//
//  main.m
//  StackAndQueue
//
//  Created by zxiao23 on 4/12/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Queue.h"
#import "Stack.h"
#import "Josephus.h"
#import "Djikstra's.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        //test for Josephus Problem
//        Josephus *myJoProblemSolver = [[Josephus alloc] init];
//        NSLog(@"%d", [myJoProblemSolver solveWithN:41 andS:2]);
        //test for Djikstra's Two Stack Algorithm
        Djikstra *myDjProblemSolver = [[Djikstra alloc] init];
        NSLog(@"%d", [myDjProblemSolver solveGeneral:@"1+(2+3)*4*5"]);
    }
    return 0;
}
