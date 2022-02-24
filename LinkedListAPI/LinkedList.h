//
//  LinkedList.h
//  LinkedListAPI
//
//  Created by zxiao23 on 4/6/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef LinkedList_h
#define LinkedList_h
#import "ListNode.h"

@interface LinkedList : NSObject

@property ListNode *head;

-(instancetype) initWithHead : (ListNode *) head;

// inserts a node at the head of the list
-(void)add:(int)object;

 

// adds a value at an index
-(void)addObjectAtIndex:(int) index object: (int)object;
-(void)addObjectAtIndexRecur:(int) index object: (int)object;


// adds a value at the end
-(void)addObjectAtEnd: (int)object;
-(void)addObjectAtEndRecur: (int)object;
 

//check is the linked list is empty
-(BOOL)isEmpty;

 

//clear the linked list
-(void)clear;

 

//print out every element in the list
-(void)print;
-(void)printRecur;
 

//returns true if the item is in the list, false otherwise
-(BOOL)isInList:(int)x;
-(BOOL)isInListRecur: (int)x;
 

//removes a node at a given index
-(void)deleteNodeAtIndex:(int)index;
//removes a node at a given index and returns that
-(ListNode *)deleteNodeAtIndexRecur:(int)index;

 
//return the first node of the list
-(ListNode *)first;


 
//return the last node of the list.
-(ListNode *)last;
-(ListNode *)lastRecur;
 

// returns the number of items in the list
-(int)count;
-(int)countRecur;
 

// returns a pointer to a node at the given index
-(ListNode *)nodeAt:(int)index;
-(ListNode *)nodeAtRecur:(int)index;
 

// removes all occurrences of an item and returns the total number of items removed
// this can be done by using other previously written methods
-(int) removeOccurences:(int) item;
-(int) removeOccurenceRecur:(int) item;


//reverses a linked list
-(void) reverse;


@end

#endif /* LinkedList_h */
