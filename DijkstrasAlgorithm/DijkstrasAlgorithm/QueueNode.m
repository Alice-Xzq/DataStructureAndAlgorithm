//
//  QueueNode.m
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/23/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "QueueNode.h"

@implementation QueueNode

//constructors
-(instancetype)init{
    self = [super init];
    if(self){
        self.ID = -1;
        self.distanceUntil = 0;
    }
    return self;
}

-(instancetype)initWithprev: (QueueNode *) prev andID : (int) newID andDistance: (double) d{
    self = [super init];
    if(self){
        self.prevNode = prev;
        self.ID = newID;
        self.distanceUntil = d;
    }
    return self;
}

-(instancetype)initFromQueueNode : (QueueNode *) start toNewNode : (Edge *) edge{
    self = [super init];
    if(self){
        self.prevNode = start;
        self.ID = edge.to;
        self.distanceUntil = start.distanceUntil + edge.distance;
    }
    return self;
}


@end
