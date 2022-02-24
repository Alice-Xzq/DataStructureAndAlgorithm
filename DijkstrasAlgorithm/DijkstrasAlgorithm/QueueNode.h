//
//  QueueNode.h
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/23/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef QueueNode_h
#define QueueNode_h
#import "Edge.h"

@interface QueueNode : NSObject

@property QueueNode *prevNode;
@property int ID;
@property double distanceUntil; //this record the distance until this node

//constructor
-(instancetype)initWithprev: (QueueNode *) prev andID : (int) newID andDistance: (double) d;
-(instancetype)initFromQueueNode : (QueueNode *) start toNewNode : (Edge *) edge;

@end

#endif /* QueueNode_h */
