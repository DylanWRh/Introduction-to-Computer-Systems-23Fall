/* Function header comments are in .h file*/
#include "cache.h"

struct {
    sem_t mutex, w;             /* mutex lock for nreader and writable */
    int nreader;                /* Number of readers */

    int lru_timer;              /* timer for LRU strategy */

    char url[MAXLINE];          /* URL of contents */
    char obj[MAX_OBJECT_SIZE];  /* Contents */
    ssize_t length;             /* length of contents */
} *cache = NULL;
int timer = 0;
sem_t timer_mutex; 

int cache_init() {
    cache = calloc(MAX_CACHE_NUM, sizeof(*cache));
    if (!cache) return -1;

    for(int i = 0; i < MAX_CACHE_NUM; ++i) {
        cache[i].nreader = 0;
        Sem_init(&cache[i].mutex, 0, 1);
        Sem_init(&cache[i].w, 0, 1);
    } 

    Sem_init(&timer_mutex, 0, 1);
    return 0;
}

int cache_request(char url[MAXLINE], char buf[MAX_OBJECT_SIZE]) {
    int length = -1;
    for (int i = 0; i < MAX_CACHE_NUM && length == -1; ++i) {
        before_read(i);
        if (!strcmp(url, cache[i].url)) {
            /* Set timer */
            P(&timer_mutex);
            ++timer;
            V(&timer_mutex);
            /* Get content */
            cache[i].lru_timer = timer;   
            memcpy(buf, cache[i].obj, cache[i].length);
            length = cache[i].length;
        }
        after_read(i);
    }
    return length;
}

void before_read(int idx) {
    P(&cache[idx].mutex);
    cache[idx].nreader++;
    if (cache[idx].nreader == 1)
        P(&cache[idx].w);
    V(&cache[idx].mutex);
}

void after_read(int idx) {
    P(&cache[idx].mutex);
    cache[idx].nreader--;
    if (cache[idx].nreader == 0)
        V(&cache[idx].w);
    V(&cache[idx].mutex);
}

int find_fit(){
    int idx = -1, min_timer = 0x7fffffff;
    for (int i = 0; i < MAX_CACHE_NUM; ++i) {
        before_read(i);
        if (!cache[i].lru_timer) {
            idx = i;
            after_read(i);
            return i;
        }
        else if (cache[i].lru_timer < min_timer) {
            min_timer = cache[i].lru_timer;
            idx = i;
        }
        after_read(i);
    }
    return idx;
}

void cache_write(char url[MAXLINE], char buf[MAX_OBJECT_SIZE], size_t length) {
    int idx = find_fit();

    P(&timer_mutex);
    timer++;
    V(&timer_mutex);

    P(&cache[idx].w);
    cache[idx].lru_timer = timer;
    memcpy(cache[idx].obj, buf, length);
    strcpy(cache[idx].url, url);
    cache[idx].length = length;
    V(&cache[idx].w);
}

