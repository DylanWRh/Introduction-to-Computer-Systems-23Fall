#include <stdio.h>
#include "csapp.h"
#include "cache.h"

/* Recommended max cache and object sizes */
#define POINTER_SUCC NULL
#define POINTER_FAIL ((void *)-1)

/* You won't lose style points for including this long line in your code */
static const char *user_agent_hdr = "User-Agent: Mozilla/5.0 (X11; Linux x86_64; rv:10.0.3) Gecko/20120305 Firefox/10.0.3\r\n";

typedef struct {
    char host[MAXLINE];
    char port[MAXLINE];
    char uri[MAXLINE];
} url_parser;

static void *thread(void* clientfdp);
static void do_get(rio_t *riop, char *url);
static int parse_url(char *url, url_parser *parsed);
static int read_header(rio_t *riop, char *header, url_parser *url_parsed);

int main(int argc, char **argv) {
    // printf("%s", user_agent_hdr);

    /* Handle SIGPIPE signal */
    Signal(SIGPIPE, SIG_IGN);
    
    /* Prepare for listen */
    int listenfd, connfd;
    char hostname[MAXLINE], port[MAXLINE];
    socklen_t clientlen;
    struct sockaddr_storage clientaddr;
    pthread_t tid;

    /* Check command line args */
    if (argc != 2) {
        fprintf(stderr, "usage: %s <port>\n", argv[0]);
        exit(EXIT_FAILURE);
    }

    /* Initialize cache */
    if (cache_init() == -1) {
        fprintf(stderr, "cache_init error\n");
        exit(EXIT_FAILURE);
    }

    /* Listen and check, but should not terminate */
    listenfd = Open_listenfd(argv[1]);
    while (1) {
        clientlen = sizeof(clientaddr);
        connfd = accept(listenfd, (SA *)&clientaddr, &clientlen);
        if (connfd < 0) {
            fprintf(stderr, "accept error: %s\n", strerror(errno));
            continue;
        }
        if (getnameinfo((SA *)&clientaddr, clientlen, hostname, 
        MAXLINE, port, MAXLINE, 0) < 0) {
            fprintf(stderr, "getnameinfo error: %s\n", strerror(errno));
            continue;
        }
        Pthread_create(&tid, NULL, thread, (void *)(long)connfd);
    }
    
    /* Unreachable code, only for code integrity */
    Close(listenfd);

    return 0;
}

/*
 * thread - Detachs a thread for HTTP business
 * returns POINTER_SUCC if success and POINTER_FAIL if error
 */
static void *thread(void *clientfdp) {
    /* Detach the thread */
    if (pthread_detach(pthread_self()) < 0) {
        fprintf(stderr, "pthread_detach error: %s\n", strerror(errno));
        return POINTER_FAIL;
    }

    /* Read request line */
    int clientfd = (int)(long)clientfdp;
    char buf[MAXLINE], method[MAXLINE], url[MAXLINE], version[MAXLINE];
    rio_t rio;
    rio_readinitb(&rio, clientfd);
    if (!rio_readlineb(&rio, buf, MAXLINE)) {
        fprintf(stderr, "read request line error\n");
        return POINTER_FAIL;
    }

    /* Check request format, read headers */
    if (sscanf(buf, "%s %s %s", method, url, version) != 3) {
        fprintf(stderr, "malformed request line\n");
        return POINTER_FAIL;
    }

    /* Check method request */
    if (!strcasecmp(method, "GET")) {
        do_get(&rio, url);
    }
    else {
        fprintf(stderr, "Proxy does not support this method\n");
    }

    Close(clientfd);

    return POINTER_SUCC;
}

/*
 * do_get - Deal with GET request
 * read from url and write to riop (associated with cliend fd)
 */
static void do_get(rio_t *riop, char *url) {
    url_parser url_parsed;
    char header[MAXLINE], buf[MAXLINE];

    rio_t server_rio;
    int serverfd;

    size_t response_len;
    char response[MAX_OBJECT_SIZE];
    
    int cache_block_len = 0;

    /* Request from cache */
    if ((response_len = cache_request(url, response)) != -1) {
        if (
            rio_writen(riop->rio_fd, response, response_len) 
            != response_len
        ) {
            fprintf(stderr, "rio_writen error\n");
        }
        return;
    }

    /* Parse and check url */
    if (parse_url(url, &url_parsed) < 0) {
        fprintf(stderr, "malformed URL: %s\n", url);
        return;
    }

    /* Read request headers */
    if (read_header(riop, header, &url_parsed) < 0) {
        fprintf(stderr, "malformed request header\n");
        return;
    }

    /* Connect to server */
    serverfd = open_clientfd(url_parsed.host, url_parsed.port);
    if (serverfd < 0) {
        fprintf(stderr, "open_clientfd error: %s\n", strerror(errno));
        return;
    }
    rio_readinitb(&server_rio, serverfd);

    /* Send header to server */
    if (rio_writen(serverfd, header, strlen(header)) != strlen(header)) {
        fprintf(stderr, "rio_writen error\n");
        return;
    }

    /* get response */
    while ((response_len = rio_readnb(&server_rio, buf, MAXLINE))) {
        if (response_len == -1) {
            fprintf(stderr, "rio_readnb error\n");
            return;
        }

        /* Write into cache buf */
        if (cache_block_len + response_len > MAX_OBJECT_SIZE) {
            cache_block_len = -1;
        }
        if (cache_block_len != -1) {
            memcpy(response + cache_block_len, buf, response_len);
            cache_block_len += response_len;
        }

        if (rio_writen(riop->rio_fd, buf, response_len) != response_len) {
            fprintf(stderr, "rio_writen error\n");
            return;
        }
    }
    
    /* Write to cache */
    if (cache_block_len != -1) {
        cache_write(url, response, cache_block_len);
    }

    Close(serverfd);
}

/*
 * parse_url - Parse given url (char *) into url parser
 * returns 0 if success and -1 if error
 */
static int parse_url(char *url, url_parser *parsed) {
    char *port, *uri;
    /* Check url http head */
    int http_len = strlen("http://");
    if (strncmp(url, "http://", http_len))
        return -1;
    
    /* Get and check port (if exists) and uri pointer */
    port = strchr(url+http_len, ':');
    uri = strchr(url+http_len, '/');
    if (!uri)
        return -1;
    
    /* Set host, port ad uri */
    /* a trick: set some \0's to split the string */
    /* and recover it after strcpy */
    *uri = '\0';
    if (port) *port = '\0';

    strcpy(parsed->host, url+http_len);

    if (port)
        strcpy(parsed->port, port+1);
    else 
        strcpy(parsed->port, "80");
    if (port) *port = ':';

    *uri = '/';
    strcpy(parsed->uri, uri);

    /* For debug */
    // printf("\n\n\n%s\n", parsed->host);
    // printf("%s\n", url);
    // printf("%s\n", parsed->port);
    // printf("%s\n\n\n", parsed->uri);

    return 0;
}

static int read_header(rio_t *riop, char *header, url_parser *url_parsed){
    /* read headers to buf */
    char buf[MAXLINE];
    rio_readlineb(riop, buf, MAXLINE);
    char realhost[MAXLINE];
    int usehost = 1;

    /* First line of GET header, convert url to uri and HTTP to 1.0 */
    sprintf(
        header,
        "%s%s%s",
        "GET ",
        url_parsed->uri,
        " HTTP/1.0\r\n"
    );
    
    /* Read headers other than handcrafted ones */
    while (strcmp(buf, "\r\n")) {
        if (!strncmp(buf, "Host", strlen("Host"))) {
            strcpy(realhost, buf + strlen("Host: "));
            usehost = 0;
        }           
        else if (
            strncmp(buf, "User-Agent", strlen("User-Agent"))
            && strncmp(buf, "Connection", strlen("Connection"))
            && strncmp(buf, "Proxy-Connection", strlen("Proxy-Connection"))
        ) {
            strcat(header, buf);
        }
        rio_readlineb(riop, buf, MAXLINE);
    }

    /* Add handcrafted headers */
    char *tail_pointer = header + strlen(header);
    sprintf(
        tail_pointer,
        "%s%s%s%s%s%s",
        "Host: ",
        usehost? url_parsed->host: realhost,
        usehost? "\r\n": "",
        user_agent_hdr,
        "Connection: close\r\n",
        "Proxy-Connection: close\r\n\r\n"
    );
    
    return 0;
}