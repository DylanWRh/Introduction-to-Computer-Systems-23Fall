#include "csapp.h"

#define MAX_CACHE_SIZE 1049000
#define MAX_OBJECT_SIZE 102400
#define MAX_CACHE_NUM 10

/*
 * cache_init - initialize web cache
 * returns 0 if success and -1 if error
 */
int cache_init(void);

/*
 * cache_request - Given url as a key to search in cache
 * and write results (if any) into buf
 * returns size of contents if success and -1 if fail
 */
int cache_request(char url[MAXLINE], char buf[MAX_OBJECT_SIZE]);

/*
 * before_read - manage mutex lock before reading a cache block
 */
void before_read(int idx);

/*
 * after_read - manage mutex lock after reading a cache block
 */
void after_read(int idx);

/*
 * find_fit - Find a block to write in, use LRU strategy
 * returns the index of the block
 */
int find_fit();

/*
 * cache_write - Given url as a key, write concent into cache
 */
void cache_write(char url[MAXLINE], char buf[MAX_OBJECT_SIZE], size_t length);

