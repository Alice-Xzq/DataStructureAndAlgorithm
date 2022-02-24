//
//  ListNode.m
//  LinkedListAPI
//
//  Created by zxiao23 on 4/6/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "ListNode.h"

@implementation ListNode

//constructor
-(instancetype) init
{
    self = [super init];
    if(self){
        self.object = 0;
        self.next = NULL;
    }
    return self;
}

-(instancetype) initWithObject:(int)object
{
    self = [super init];
    if(self){
        self.object = object;
        self.next = NULL;
    }
    return self;
}

-(instancetype) initWithObject:(int)object andNextNode:(ListNode *)node
{
    self = [super init];
    if(self){
        self.object = object;
        self.next = node;
    }
    return self;
}

@end
