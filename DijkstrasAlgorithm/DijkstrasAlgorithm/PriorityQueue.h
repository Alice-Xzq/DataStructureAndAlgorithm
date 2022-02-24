//
//  PriorityQueue.h
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/18/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//  cite    https://www.codesdope.com/blog/article/priority-queue-using-heap/#:~:text=Priority%20queue%20is%20a%20type,first%20come%20first%20serve%20basis.
//

#ifndef PriorityQueue_h
#define PriorityQueue_h
#import "QueueNode.h"

@interface PriorityQueue : NSObject

//properties
@property NSMutableArray *myQueue;

//methods
-(bool)isEmpty;
-(void)add: (QueueNode *) node;
-(QueueNode *)getMin;
-(QueueNode *)popMin;


@end

#endif /* PriorityQueue_h */
