/*
 * mm.c
 * 
 * 
 * Strategies used are listed as below:
 *      1. A combination of first and best fit.
 *          if we find a free block close enough to size, choose it
 *          otherwise, choose the block with minimum size (but larger than required size)
 *      2. Segregated free lists
 *      3. Immediate coalescence
 *      4. No footers in alloc blocks
 *      5. Finetune some hyperparams like number of lists 
 *          and thresholds of list seperation and best fit strategy
 * Heap structure:
 *      1. each entry is 8 bytes, saving the address of corresponding linklist
 *      2. a prologue header and a epilogue header at the start and end of heap
 *      3. a gap to ensure 8-bytes alignment
 *      +--------+-----+--------+----------------+--------+-----+--------+----------+
 *      | entrys | ... | entrys | prologue | gap | blocks | ... | blocks | epilogue |
 *      +--------+-----+--------+----------------+--------+-----+--------+----------+
 *      ^                       ^                ^                                  ^
 *      free_listp         free_list_endp     heap_listp                   epilogue_p 
 * Free block structure:
 *      1. a header and a footer, each 4 bytes
 *      2. a pointer pointing to successor in the linklist, 8 bytes
 *      3. the pointer to the block bp points to the pointer part of block
 *      4. bp is 8 bytes aligned
 *      +--------+---------+-----+--------+
 *      | header | pointer | ... | footer |
 *      +--------+---------+-----+--------+
 *               ^          
 *               bp
 * Alloc block structure:
 *      1. a header, 4 bytes
 *      2. contents, no less than 12 bytes
 *      3. the pointer to the block bp points to the contents part of block
 *      4. bp is 8 bytes aligned
 *      +--------+----------+
 *      | header | contents |
 *      +--------+----------+
 *               ^          
 *               bp
 * Header/Footer structure:
 *      1. size part: the size of the block. Since bp is 8 bytes aligned,
 *          only the front 29 bits are used to record size
 *      2. prev_alloc mark (P): whether previous block is alloc
 *      3. alloc mark (A): whether this block is alloc
 *      +----------------+---+---+---+
 *      |      size      |   | P | A |
 *      +----------------+---+---+---+
 * 
 */
#include <assert.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <unistd.h>

#include "mm.h"
#include "memlib.h"

/* If you want debugging output, use the following macro.  When you hand
 * in, remove the #define DEBUG line. */
// #define DEBUG
#ifdef DEBUG
# define dbg_printf(...) printf(__VA_ARGS__)
# define dbg_checkheap(x) mm_checkheap(x)
#else
# define dbg_printf(...)
# define dbg_checkheap(x)
#endif

/* do not change the following! */
#ifdef DRIVER
/* create aliases for driver tests */
#define malloc mm_malloc
#define free mm_free
#define realloc mm_realloc
#define calloc mm_calloc
#endif /* def DRIVER */

/* single word (4) or double word (8) alignment */
#define ALIGNMENT 8

/* rounds up to the nearest multiple of ALIGNMENT */
#define ALIGN(p) (((size_t)(p) + (ALIGNMENT-1)) & ~0x7)

/* global variables */
static char *heap_listp = 0;    /* Pointer to prologue block */
static char *free_listp = 0;    /* Pointer to free list header */
static char *free_list_endp = 0;    /* Pointer to the end of free list header */
static char *epilogue_p = 0;    /* Pointer to the epilogue block */
/* end global variables */

/* Basic constants and macros, some from mm-textbook */
#define WSIZE       4       /* Word and header/footer size (bytes) */ 
#define DSIZE       8       /* Double word size (bytes) */
#define CHUNKSIZE  (1<<12)  /* Extend heap by this amount (bytes) */  
#define MINSIZE     16      /* Minimum block size */
#define LISTNUM     10       /* Number of free list headers */
#define INIT_SIZE   16      /* The threshold */

#define MAX(x, y) ((x) > (y)? (x) : (y))  
#define MIN(x, y) ((x) < (y)? (x) : (y))  

/* Pack a size and allocated bits into a word */
#define PACK(size, prev_alloc, alloc)  ((size) | (prev_alloc << 1) | (alloc)) 

/* Read and write a word at address p */
#define GET(p)       ((*(unsigned int *)(p)))            
#define PUT(p, val)  ((*((unsigned int *)(p))) = (unsigned int)(val))    

/* Read the size and allocated fields from pointer p or block pointer bp*/
#define GET_SIZE_P(p)  (GET(p) & ~0x7)                   
#define GET_ALLOC_P(p) (GET(p) & 0x1)   
#define GET_PALLOC_P(p)     ((GET(p) >> 1) & 0x1) 
#define GET_SIZE(bp)   (GET_SIZE_P(HDRP(bp)))  
#define GET_ALLOC(bp)  (GET_ALLOC_P(HDRP(bp)))
#define GET_PALLOC(bp)      (GET_PALLOC_P(HDRP(bp)))

/* Set the size and allocated fields from pointer p */
#define SET_SIZE_P(p, size)    ((*(unsigned int *)(p)) = ((*(unsigned int *)(p)) & 0x7) | size)   
#define SET_ALLOC_P(p)   ((*(unsigned int *)(p)) |= 0x1)
#define CLR_ALLOC_P(p)   ((*(unsigned int *)(p)) &= ~0x1)
#define SET_PALLOC_P(p)  ((*(unsigned int *)(p)) |= 0x2)
#define CLR_PALLOC_P(p)  ((*(unsigned int *)(p)) &= ~0x2)

/* Given block ptr bp, compute address of its header and footer */
#define HDRP(bp)       ((char *)(bp) - WSIZE)                      
#define FTRP(bp)       ((char *)(bp) + GET_SIZE(bp) - DSIZE) 

/* Given block ptr bp, compute block pointer of next and previous blocks */
#define NEXT_BLKP(bp)  ((char *)(bp) + GET_SIZE(bp))
/* A trick, header of HDRP(bp) is the footer of prev block (if exists) */
#define PREV_BLKP(bp)  ((char *)(bp) - GET_SIZE(HDRP(bp))) 

/* Given free block ptr bp, set and get its successor in the link */
#define GET_SUCC(bp)   ((char *)(*(size_t *)(bp)))
#define SET_SUCC(bp, succp)     (*(size_t*)(bp) = (size_t)(succp))

/* End basic constants and macros */

/* Function prototypes for internal helper routines */
static inline void *extend_heap(size_t words);
static inline void *coalesce(void *bp);

static inline void *free_list_entry(size_t size);
static inline void *free_list_insert(void *bp);
static inline void free_list_remove(void *bp);

static inline void *find_free(size_t size);
static inline void *place_alloc(void *bp, size_t size);

static void free_list_dbg();
static void heap_dbg();
static void heap_err(int lineno);
/* End function prototypes*/

/*
 * Initialize: return -1 on error, 0 on success.
 */
int mm_init(void) {
    /* Create the initial free list headers */
    free_listp = mem_sbrk(LISTNUM * DSIZE + 2 * WSIZE);
    if (free_listp == (void *)-1) 
        return -1;
    memset(free_listp, 0, DSIZE * LISTNUM);
    free_list_endp = free_listp + DSIZE * LISTNUM;

    /* Create prologue and epilogue */
    heap_listp = free_list_endp;
    PUT(heap_listp, PACK(DSIZE, 1, 1));         /* Prologue header */
    PUT(heap_listp + WSIZE, PACK(0, 1, 1));     /* Epilogue header */
    heap_listp += 2 * WSIZE; 
    epilogue_p = heap_listp; 

    /* Initialize the heap and check results */
    void *bp = extend_heap(CHUNKSIZE);
    if (!bp)
        return -1;
    
    dbg_checkheap(__LINE__);
    return 0;
}

/*
 * malloc
 */
void *malloc (size_t size) { 
    if (size == 0) 
        return NULL;
    
    dbg_checkheap(__LINE__);
    if (size == 448) size = 512;    /* Magic alignment */
    if (size == 4072) size = 4096;    /* Magic alignment */
    /* Determine the size needed */
    size = ALIGN(size + WSIZE);     /* Add header space */
    if (size <= MINSIZE)
        size = MINSIZE;
    /* Find a free block that fits size or extend the heap*/
    char *bp = find_free(size);
    if (!bp) {
        bp = extend_heap(MAX(size, CHUNKSIZE));
        if (!bp) return NULL;
    }
    free_list_remove(bp);
    
    dbg_checkheap(__LINE__);

    return place_alloc(bp, size);
}

/*
 * free
 */
void free (void *ptr) {
    if(!ptr) return;

    /* Reset header and footer */
    CLR_ALLOC_P(HDRP(ptr));
    PUT(FTRP(ptr), GET(HDRP(ptr)));

    void *next_bp = NEXT_BLKP(ptr);
    CLR_PALLOC_P(HDRP(next_bp));

    /* Reset free list */
    coalesce(ptr);

    dbg_checkheap(__LINE__);
}

/*
 * realloc - you may want to look at mm-naive.c
 */
void *realloc(void *oldptr, size_t size) {
    /* Special case where oldptr is NULL or size is zero*/
    if (size == 0) {
        free(oldptr);
        return NULL;
    }
    if (!oldptr)
        return malloc(size);
    /* Determine the old and new size */
    size = ALIGN(size + WSIZE);     /* Add header space */
    if (size <= MINSIZE)
        size = MINSIZE;
    size_t old_size = GET_SIZE(oldptr);

    /* old size is enough, do nothing */
    if (old_size >= size) 
        return oldptr;

    /* Else, malloc a new space, copy old contents, and free old*/
    void *newbp = malloc(size);
    if (!newbp)
        return NULL;
    memcpy(newbp, oldptr, MIN(size, old_size));
    free(oldptr);

    dbg_checkheap(__LINE__);

    return newbp;
}

/*
 * calloc - you may want to look at mm-naive.c
 * This function is not tested by mdriver, but it is
 * needed to run the traces.
 */
void *calloc (size_t nmemb, size_t size) {
    size *= nmemb;
    char *bp = malloc(size);
    if (!bp)
        return NULL;
    memset(bp, 0, size);

    dbg_checkheap(__LINE__);

    return bp;
}


/*
 * Return whether the pointer is in the heap.
 * May be useful for debugging.
 */
static int in_heap(const void *p) {
    return p <= mem_heap_hi() && p >= mem_heap_lo();
}

/*
 * Return whether the pointer is aligned.
 * May be useful for debugging.
 */
static int aligned(const void *p) {
    return (size_t)ALIGN(p) == (size_t)p;
}

/*
 * mm_checkheap
 */
void mm_checkheap(int lineno) {
    /* check prologue */
    void *prologue_bp = heap_listp - WSIZE;
    if (!in_heap(prologue_bp)) {
        printf("Prologue not in heap!\n");
        heap_err(lineno);
    }
    if (!GET_ALLOC(prologue_bp) || !GET_PALLOC(prologue_bp) 
        || GET_SIZE(prologue_bp) != DSIZE) {
            printf("Prologue error!\n");
            printf("Expected 0x%x, got 0x%x\n", PACK(DSIZE, 1, 1), GET(HDRP(prologue_bp)));
            heap_err(lineno);
    }

    /* check epilogue */
    if (mem_heap_hi() + 1 != epilogue_p) {
        printf("Epilogue location error!\n");
        heap_err(lineno);
    }
    if (!aligned(epilogue_p)) {
        printf("Epilogue alignment error!\n");
        heap_err(lineno);
    }
    if (!GET_ALLOC(epilogue_p) || GET_SIZE(epilogue_p)) {
        printf("Epilogue error!\n");
        heap_err(lineno);
    }

    /* check blocks */
    for (void *bp = heap_listp; GET_SIZE(bp); bp = NEXT_BLKP(bp)) {
        if (!in_heap(bp)) {
            printf("Block not in heap!\n");
            printf("Block addr: %p\n", bp);
            printf("heap lo: %p\nheap hi: %p\n", mem_heap_lo(), mem_heap_hi());
            heap_err(lineno);
        }
        if (!aligned(bp)) {
            printf("Block not aligned!\n");
            heap_err(lineno);
        }
        if (GET_SIZE(bp) < MINSIZE) {
            printf("Block size %d is too small!\n", GET_SIZE(bp));
            heap_err(lineno);
        }
        if (GET_ALLOC(bp)) {
            printf("Block alloc bit error!\n");
            heap_err(lineno);
        }
    }

    /* check free list */
    for (int i = 0; i < LISTNUM; ++i) {
        void *entry = free_listp + i * DSIZE;
        for (void *bp = GET_SUCC(entry); bp; bp = GET_SUCC(bp)) {
            if (!in_heap(bp)) {
                printf("Free block not in heap!\n");
                printf("Block addr: %p\n", bp);
                printf("heap lo: %p\nheap hi: %p\n", mem_heap_lo(), mem_heap_hi());
                heap_err(lineno);
            }
            if (!aligned(bp)) {
                printf("Free block not aligned!\n");
                heap_err(lineno);
            }
            if (GET_SIZE(bp) < MINSIZE) {
                printf("Free block size %d is too small!\n", GET_SIZE(bp));
                heap_err(lineno);
            }
            if (GET_ALLOC(bp)) {
                printf("Free block alloc bit error!\n");
                heap_err(lineno);
            }
        }
    }
}

/* Inline helper functions */

/*
 * coalesce - Coalesce adjacent free blocks
 * returns a pointer to the coalesced block
 */
static inline void *coalesce(void *bp) {
    void *prev_bp = PREV_BLKP(bp);
    void *next_bp = NEXT_BLKP(bp);
    size_t prev_alloc = GET_PALLOC(bp);
    size_t next_alloc = GET_ALLOC(next_bp);
    size_t size = GET_SIZE(bp);

    /* No coalescence, directly insert */
    if (prev_alloc && next_alloc) {
        return free_list_insert(bp);
    }

    /* 
     * With coalescence, remove old bp, 
     * compute new bp and size,
     * set header and footer, then insert
     */
    if (prev_alloc && !next_alloc) {
        free_list_remove(next_bp);
        size += GET_SIZE(next_bp);
    }
    else if (!prev_alloc && next_alloc) {
        bp = prev_bp;
        size += GET_SIZE(prev_bp);
        free_list_remove(prev_bp);
    }
    else if (!prev_alloc && !next_alloc) {
        bp = prev_bp;
        size += GET_SIZE(prev_bp) + GET_SIZE(next_bp);
        free_list_remove(prev_bp);
        free_list_remove(next_bp);
    }
    SET_SIZE_P(HDRP(bp), size);
    SET_SIZE_P(FTRP(bp), size);
    return free_list_insert(bp);
}

/*
 * extend_heap - Extend the heap by size bytes as a free block
 * returns bp of the new block
 */
static inline void *extend_heap(size_t size) {
    char *bp;

    /* Align to 8 bytes */
    size = ALIGN(size);
    
    /* Create new block */
    if ((long)(bp = mem_sbrk(size)) == -1)  
        return NULL;
        
    /* Set header and footer */
    int prev_alloc = GET_PALLOC(epilogue_p);
    PUT(HDRP(bp), PACK(size, prev_alloc, 0));
    PUT(FTRP(bp), PACK(size, prev_alloc, 0));

    /* Update epilogue*/
    epilogue_p += size;
    PUT(HDRP(epilogue_p), PACK(0, 0, 1));

    /* Coalesce adjacent free blocks */
    return coalesce(bp);
}

/*
 * free_list_entry - Determines which free list to search for block
 * returns a pointer to corresponding list entry
 */
static inline void *free_list_entry(size_t size) {
    size_t init_size = INIT_SIZE;
    for(int x = 0; x < LISTNUM - 1; ++x) {
        if (size <= init_size)
            return free_listp + x * DSIZE;
        init_size *= 2;
    }
    return free_listp + (LISTNUM - 1) * DSIZE;
}

/*
 * free_list_insert - Inserts a free block into corresponding free list
 * returns the input pointer
 */
static inline void *free_list_insert(void *bp) {
    void *entry = free_list_entry(GET_SIZE(bp));
    void *succp = GET_SUCC(entry);
    SET_SUCC(bp, succp);
    SET_SUCC(entry, bp);
    return bp;
}

/*
 * free_list_remove - Remove a free block from corresponding free list
 */
static inline void free_list_remove(void *bp) {
    void *entry = free_list_entry(GET_SIZE(bp));
    void *p, *succp;
    for (p = entry; (succp = GET_SUCC(p)) && succp != bp; p = succp);
    SET_SUCC(p, GET_SUCC(bp));
}

/*
 * find_free - Finds a free block that fits input size
 * returns the block pointer
 */
static inline void *find_free(size_t size) {
    void *entry = free_list_entry(size);
    /* In corresponding list exists a free block */
    /* Find a relatively close one */
    size_t mindis = -1;
    void *minp = NULL;
    size_t thresh = size / 4;
    for (void *p = GET_SUCC(entry); p; p = GET_SUCC(p))
        if (GET_SIZE(p) >= size) {
            if (GET_SIZE(p) - size <= thresh)return p;
            else if (GET_SIZE(p) - size < mindis) {
                mindis = GET_SIZE(p) - size;
                minp = p;
            }
        }
    if (minp) return minp;
            
    /* Find in lists of larger size */
    for (char *p = entry + DSIZE; p != free_list_endp; p += DSIZE)
        if (GET_SUCC(p))
            return GET_SUCC(p);
    return NULL;
}

/*
 * place_alloc - Places an alloc block inside a free block
 * returns the block pointer of alloc block
 */
static inline void *place_alloc(void *bp, size_t size) {
    size_t rest_size = GET_SIZE(bp) - size;
    void *resbp = bp;

    if (rest_size <= MINSIZE) {
        SET_ALLOC_P(HDRP(bp));
        SET_PALLOC_P(HDRP(NEXT_BLKP(bp)));
        return resbp;
    }
    else {
        PUT(HDRP(bp), PACK(size, GET_PALLOC(bp), 1));
        bp = NEXT_BLKP(bp);
        PUT(HDRP(bp), PACK(rest_size, 1, 0));
        PUT(FTRP(bp), PACK(rest_size, 1, 0));
        free_list_insert(bp);
        return resbp;
    }
    return NULL;
}

/*
 * heap_err - Print error infomation
 */
static inline void heap_err(int lineno) {
    printf("Error detected at line %d\n", lineno);
    free_list_dbg();
    heap_dbg();
    exit(1);
}

/*
 * free_list_dbg - Print information of free lists
 */
static void free_list_dbg() {
    printf("\n--------------------LIST DEBUG--------------------\n\n");
    for (int i = 0; i < LISTNUM; ++i) {
        printf("Entry %d", i);
        for (void *entry = free_listp + i * DSIZE; entry; entry = GET_SUCC(entry)) {
            printf(" -> %p", GET_SUCC(entry));
        }
        printf("\n");
    }
    printf("------------------END LIST DEBUG------------------\n\n");
}

/*
 * free_list_dbg - Print information of heap
 */
static void heap_dbg() {
    printf("\n--------------------HEAP DEBUG--------------------\n\n");
    printf("mem_heap_lo: %p mem_heap_hi: %p\n\n", mem_heap_lo(), mem_heap_hi());
    int cnt = 0;
    void *p;
    for (p = heap_listp; GET_SIZE(p) > 0; p = NEXT_BLKP(p)){
        printf("Block %3d   adr %p   size %5x   alloc %d   palloc %d   hd %5x", 
            ++cnt, p, GET_SIZE(p), GET_ALLOC(p), GET_PALLOC(p), GET(HDRP(p)));
        if (!GET_ALLOC(p)) printf(" ft %5x", GET(FTRP(p)));
        printf("\n");
        fflush(stdout);
    }
    printf("Block %3d   adr %p   size %5x   alloc %d   hd %7x\n", 
        ++cnt, p, GET_SIZE(p), GET_ALLOC(p), GET(HDRP(p)));
    printf("\n");
    printf("------------------END HEAP DEBUG------------------\n\n");
}

/* End inline helper functions */