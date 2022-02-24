//
//  ListNode.h
//  LinkedListAPI
//
//  Created by zxiao23 on 4/6/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef ListNode_h
#define ListNode_h

@interface ListNode : NSObject

@property int object;

@property ListNode *next;

-(instancetype)initWithObject:(int)object;

-(instancetype)initWithObject:(int)object andNextNode:(ListNode *)node;

 

@end

#endif /* ListNode_h */
