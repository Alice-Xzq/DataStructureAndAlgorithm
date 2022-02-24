//
//  main.m
//  Sorting
//
//  Created by zxiao23 on 4/21/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sorting.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        /* The following three lines check whether our mach_absolute_time returns nanoseconds or not, it did since the denom and numer are both 1*/
//        mach_timebase_info_data_t info;
//        mach_timebase_info(&info);
//        printf("denom: %u, numer: %u", info.denom, info.numer);
        /*tests for sorts*/
        NSString *data = @"";
        for(int i = 1000; i < 2000; i+=1000){
            uint64_t avg = 0;
            for(int j = 0; j < 10; j++){
                int size = i;
                int* test = malloc(size * sizeof(int));
                for(int i = 0; i < size; i++){
                    test[i] = arc4random_uniform(100000);
                }
                uint64_t startTime = mach_absolute_time();
                [Sorting quickSort:test withStart:0 andEnd:size-1];
                uint64_t endTime = mach_absolute_time();
                avg += (endTime - startTime);
            }
            avg /= 10;
            data = [data stringByAppendingFormat:@"%i, %llu \n", i, avg];
        }
        /*test*/
//        int size = 100;
//        int* test = malloc(size * sizeof(int));
//        for(int i = 0; i < size; i++){
//            test[i] = arc4random_uniform(100000);
//        }
//        int* result = [Sorting quickSort:test withStart:0 andEnd:size-1];
//        for(int i = 0; i < size; i++){
//            printf("%i ", result[i]);
//        }
        /*Birthday Problem*/
//        printf("%f", [Sorting birthdayProblem]);
        NSURL *url = [[NSFileManager defaultManager] URLsForDirectory:NSDownloadsDirectory inDomains:NSUserDomainMask][0];
        
        url = [url URLByAppendingPathComponent:@"result.csv"];
        [data writeToURL:url atomically:true encoding:NSUTF8StringEncoding error:NULL];
        
        
    }
    return 0;
}
