//
//  Node.m
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/18/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"

@implementation Node

//constructors
-(instancetype)init{
    self = [super init];
    if(self){
        self.ID = -1;
        self.x = -1;
        self.y = -1;
    }
    return self;
}

-(instancetype)initNode : (int) node WithX : (int) x andY : (int) y{
    self = [super init];
    if(self){
        self.ID = node;
        self.x = x;
        self.y = y;
    }
    return self;
}

-(double)distanceTo : (Node *) other{
    double ans = sqrt(pow((self.x - other.x), 2) + pow((self.y - other.y), 2));
    return ans;
}

@end
