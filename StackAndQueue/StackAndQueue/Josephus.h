//
//  Josephus.h
//  StackAndQueue
//
//  Created by zxiao23 on 4/13/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef Josephus_h
#define Josephus_h
#import "Queue.h"

@interface Josephus : NSObject

@property Queue *myQueue;

-(int)solveWithN : (int) n andS : (int) s;

@end

#endif /* Josephus_h */
