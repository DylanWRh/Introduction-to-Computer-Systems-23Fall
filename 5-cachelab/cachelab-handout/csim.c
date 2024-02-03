#include "cachelab.h"   // To call printSummary function
#include <getopt.h>
#include <stdlib.h>
#include <unistd.h>     // Recommanded headers from writeup
#include <stdio.h>      // Print help information

// variables related to cache
int verbose_flag = 0;                   // whether to display trace info
int s = -1, S = -1, E = -1, b = -1, t = -1;     // arguments of cache
int hit = 0, miss = 0, eviction = 0;    // counters
typedef struct {
    unsigned valid;         // 0 for invalid and 1 for valid
    int time;               // last used time
    unsigned long tag;      // at most 64-bit tag for a line
} CacheLine;
CacheLine* cache;       // the whole cache

// variables related to file
char* trace_file;                       // path of trace file
char line[40];                          // one line in the file

// print help information, handling -h option
void printHelp() {
    printf("Usage: ./csim-ref [-hv] -s <num> -E <num> -b <num> -t <file>\n");
    printf("Options:\n");
    printf("  -h         Print this help message.\n");
    printf("  -v         Optional verbose flag.\n");
    printf("  -s <num>   Number of set index bits.\n");
    printf("  -E <num>   Number of lines per set.\n");
    printf("  -b <num>   Number of block offset bits.\n");
    printf("  -t <file>  Trace file.\n\n");
    printf("Examples:\n");
    printf("  linux>  ./csim-ref -s 4 -E 1 -b 4 -t traces/yi.trace\n");
    printf("  linux>  ./csim-ref -v -s 8 -E 2 -b 4 -t traces/yi.trace\n");
}

// update time for LRU strategy
void timeUpdate() {
    for (int i = 0; i < S; ++i) {
        int tmp_i = i * E;
        for (int j = 0; j < E; ++j) {
            if (cache[tmp_i + j].valid) {
                cache[tmp_i + j].time++;
            }
        }
    }
}

// update cache
void cacheUpdate(unsigned long addr) {
    unsigned long ss = (addr << t) >> (t + b);  // get set index
    unsigned long tt = addr >> (s + b);         // get tag index
    CacheLine* set_ptr = cache + ss * E;        // first line of set ss

    // hit
    for (int i = 0; i < E; ++i) {
        // valid is not 0 and tags match, hit
        if (set_ptr[i].valid && set_ptr[i].tag == tt) {
            hit++;
            set_ptr[i].time = 0;
            if (verbose_flag) printf(" hit");
            return;
        }
    }

    // miss
    miss++;
    if (verbose_flag) printf(" miss");
    // cold miss
    for (int i = 0; i < E; ++i) {
        if (!set_ptr[i].valid) {
            set_ptr[i].valid = 1;
            set_ptr[i].tag = tt;
            set_ptr[i].time = 0;
            return;
        }
    }

    // eviction
    eviction++;
    if (verbose_flag) printf(" eviction");
    int evicted = 0;
    int max_time = 0;
    for (int i = 0; i < E; ++i) {
        if (set_ptr[i].time > max_time) {
            max_time = set_ptr[i].time;
            evicted = i;
        }
    }
    set_ptr[evicted].tag = tt;
    set_ptr[evicted].time = 0;
}

int main(int argc, char** argv) {
    // handle cmd line
    int opt;
    while ((opt = getopt(argc, argv, "hvs:E:b:t:")) != -1) {
        switch(opt) {
            case 'h': printHelp(); exit(0);
            case 'v': verbose_flag = 1; break;
            case 's': s = atoi(optarg); break;
            case 'E': E = atoi(optarg); break;
            case 'b': b = atoi(optarg); break;
            case 't': trace_file = optarg; break;
            default: printHelp(); exit(1);   // Handle undefined command options
        }
    }

    // handle exceptions
    if (
        (s < 0) || (E <= 0) || (b < 0) || (s + b > 64)      // Check params
        || !(fopen(trace_file, "r"))                      // Check file
    ) {
        // not valid command
        printHelp();
        exit(1);
    }

    // Set cache params
    t = 64 - s - b;
    S = 1 << s;

    // Create cache
    cache = malloc(S * E * sizeof(CacheLine));  // Use malloc as recommanded in writeup
    if (!cache) exit(1);                // fail to create

    // Simulate cache
    FILE* file = fopen(trace_file, "r");    // open file
    char op; long addr; int size;           // information of each line
    // scan the file and update cache
    while(fscanf(file, " %c %lx,%d", &op, &addr, &size) > 0) {
        if (verbose_flag) printf("%c %lx,%d", op, addr, size);
        /* Actually, L and S have the same behavior in our simulator,
         * and M can be viewed as an L followed by a hit S.
         * By the assumption that memory accesses are aligned properly,
         * the variable size can be ignored when updating cache,
         * and it is only used when verbose_flag is set true
         */
        timeUpdate();
        cacheUpdate(addr);
        /* We don't update time twice here when seeing M,
         * because it has no influence on relative value
         */
        if (op == 'M') {
            hit++;
            if (verbose_flag) printf(" hit");
        }
        if (verbose_flag) printf("\n");
    }
    fclose(file);

    printSummary(hit, miss, eviction);  // call printSummary at the end of main
    return 0;  // The main routine should exit with a status of zero
}