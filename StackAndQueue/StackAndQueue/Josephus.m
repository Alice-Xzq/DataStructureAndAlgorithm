//
//  Josephus.m
//  StackAndQueue
//
//  Created by zxiao23 on 4/13/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Josephus.h"

@implementation Josephus

//constructor
-(instancetype)init{
    self = [super init];
    if(self){
        self.myQueue = [[Queue alloc] init];
    }
    return self;
}

//method
-(int)solveWithN : (int) n andS : (int) s{
    for(int i = 1; i <= n; i++){
        [self.myQueue enqueue:[NSNumber numberWithInt:i]];
    }
    for(int i = 1; i < n; i++){
        for(int j = 0; j < s; j++){
            [self.myQueue enqueueWithNode:[self.myQueue dequeueWithNode]];
        }
        [self.myQueue dequeue];
    }
    return [self.myQueue.head.object intValue];
}

@end
