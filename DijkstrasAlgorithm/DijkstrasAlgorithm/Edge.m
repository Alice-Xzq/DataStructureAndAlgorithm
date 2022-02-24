//
//  Edge.m
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/18/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Edge.h"

@implementation Edge

//constructor
-(instancetype)init{
    self = [super init];
    if(self){
        self.to = -1;
        self.distance = -1;
    }
    return self;
}

-(instancetype)initWithStart : (Node *) start WithEnd:(Node *)end{
    self = [super init];
    if(self){
        self.to = end.ID;
        self.distance = sqrt(pow((start.x - end.x), 2) + pow((start.y - end.y), 2));
    }
    return self;
}


@end
