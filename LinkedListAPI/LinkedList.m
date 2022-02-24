//
//  LinkedList.m
//  LinkedListAPI
//
//  Created by zxiao23 on 4/6/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"

@implementation LinkedList

//constructors
-(instancetype) init
{
    self = [super init];
    if(self){
        self.head = NULL;
    }
    return self;
}

-(instancetype) initWithHead : (ListNode *) head
{
    self = [super init];
    if(self){
        self.head = head;
    }
    return self;
}

//methods
// inserts a node at the head of the list
-(void)add:(int)object{
    if(self.head == NULL){
        self.head = [[ListNode alloc] initWithObject:object];
    }else{
        ListNode *oldHead = self.head;
        self.head = [[ListNode alloc] initWithObject:object andNextNode:oldHead];
    }
}

// adds a value at an index
-(void)addObjectAtIndex:(int) index object: (int)object{
    ListNode *cur = self.head;
    for(int i = 0; i < index-1; i++){
        if(cur){
            cur = cur.next;
        }else{
            NSLog(@"Index out of range :(");
            return;
        }
    }
    ListNode *next = cur.next;
    cur.next = [[ListNode alloc] initWithObject:object andNextNode:next];
}

-(void)addObjectAtIndexRecur:(int) index object: (int)object{
    return [self addObjectAtIndexRecurW:index object:object node:self.head];
}

-(void)addObjectAtIndexRecurW:(int) index object: (int)object node: (ListNode *) node{
    if(index == 0){
        node.next = self.head;
        self.head = node;
        return;
    }
    if(index == 1){
        ListNode *next = node.next;
        node.next = [[ListNode alloc] initWithObject:object andNextNode:next];
        return;
    }
    index -= 1;
    return [self addObjectAtIndexRecurW:index object:object node:node.next];
}

// adds a value at the end
-(void)addObjectAtEnd: (int)object{
    [self last].next = [[ListNode alloc] initWithObject:object];
}

-(void)addObjectAtEndRecur: (int)object{
    return [self addObjectAtEndRecurW:object :self.head];
}

-(void)addObjectAtEndRecurW: (int)object : (ListNode*) node{
    if(!node){
        node.next = [[ListNode alloc] initWithObject:object];
        return;
    }
    
    return [self addObjectAtEndRecurW:object :node.next];
}

//check is the linked list is empty
-(BOOL)isEmpty{
    if(self.head){
        return false;
    }
    return true;
}

//clear the linked list
-(void)clear{
    self.head = NULL;
}

//print out every element in the list
-(void)print{
    ListNode *cur = self.head;
    while(cur){
        printf("%d\n", cur.object);
        cur = cur.next;
    }
}

-(void)printRecur{
    [self printRecurW:self.head];
}

-(void)printRecurW : (ListNode*) start{
    if(!start){
        return;
    }
    printf("%d\n", start.object);
    [self printRecurW:start.next];
}

//returns true if the item is in the list, false otherwise
-(BOOL)isInList:(int)x{
    ListNode *cur = self.head;
    while(cur){
        if(cur.object == x){
            return true;
        }
    }
    return false;
}

-(BOOL)isInListRecur: (int)x{
    return [self isInListRecurW:x :self.head];
}

-(BOOL)isInListRecurW: (int)x : (ListNode*) node{
    if(node.object == x){
        return true;
    }
    if(!node){
        return false;
    }
    
    return[self isInListRecurW:x :node.next];
}

// returns a pointer to a node at the given index
-(ListNode *)nodeAt:(int)index{
    ListNode *cur = self.head;
    for(int i = 0; i < index; i++){
        if(cur){
            cur = cur.next;
        }else{
            NSLog(@"Index out of range :(");
            return NULL;
        }
    }
    return cur;
}

-(ListNode *)nodeAtRecur:(int)index{
    return [self nodeAtRecurW:index :self.head];
}

-(ListNode *)nodeAtRecurW:(int)index : (ListNode*) start{
    if(index == 0){
        return start;
    }
    index -= 1;
    return [self nodeAtRecurW:index :start.next];
}

//removes a node at a given index
-(void)deleteNodeAtIndex:(int)index{
    if(index == 0){
        self.head = self.head.next;
    }else{
        ListNode *prev = [self nodeAt:index-1];
        if(prev.next != NULL){
            if(prev.next.next){
                prev.next = prev.next.next;
            }else{
                prev.next = NULL;
            }
        }else{
            NSLog(@"Index out of range :(");
        }
    }
}

-(ListNode *)deleteNodeAtIndexRecur:(int)index{
    return [self deleteNodeAtIndexRecurW:index :self.head];
}

-(ListNode *)deleteNodeAtIndexRecurW:(int)index : (ListNode*) start{
    if(index == 0){
        ListNode *deleted = self.head;
        self.head = self.head.next;
        return deleted;
    }
    if(index == 1){
        ListNode *deleted = start.next;
        start.next = start.next.next;
        return deleted;
    }
    index -= 1;
    return [self deleteNodeAtIndexRecurW:index :start.next];
}

//return the first node of the list
-(ListNode *)first{
    return self.head;
}

//return the last node of the list.
-(ListNode *)last{
    ListNode *cur = self.head;
    while(cur){
        if(cur.next){
            cur = cur.next;
        }
    }
    return cur;
}

-(ListNode *)lastRecur{
    return [self lastRecurW:self.head];
}

-(ListNode *)lastRecurW: (ListNode *) node{
    if(!node.next){
        return node;
    }
    return [self lastRecurW:node.next];
}

// returns the number of items in the list
-(int)count{
    int count = 0;
    ListNode *cur = self.head;
    while(cur && cur.next){
        cur = cur.next;
        count ++;
    }
    return count;
}

-(int)countRecur{
    return [self countRecurW : self.head];
}

-(int)countRecurW : (ListNode*) node{
    if(!node){
        return 0;
    }
    
    return 1+[self countRecurW:node.next];
}

// removes all occurrences of an item and returns the total number of items removed
-(int) removeOccurences:(int) item{
    int count = 0;
    int index = 0;
    ListNode *cur = self.head;
    while(cur && cur.next){
        ListNode *next = cur.next;
        if(cur.object == item){
            [self deleteNodeAtIndexRecur:index];
            count ++;
        }else{
            index++;
        }
        cur = next;
    }
    return count;
}

-(int) removeOccurenceRecur:(int) item{
    return [self removeOccurenceRecurW:item :self.head index :0];
}

-(int) removeOccurenceRecurW:(int) item : (ListNode*) node index : (int) index{
    if(!node){
        return 0;
    }
    
    if(node.object == item){
        [self deleteNodeAtIndexRecur:index];
        return 1 + [self removeOccurenceRecurW:item :node.next index: index];
    }
    index++;
    return [self removeOccurenceRecurW:item :node.next index: index];
}

//reverses a linked list
-(void) reverse{
    self.head = [self reverse : self.head];
}

-(ListNode *) reverse : (ListNode *) node{
    if(!node || !node.next){
        return node;
    }

    ListNode *newHead = [self reverse : node.next];
    node.next.next = node;
    node.next = NULL;
    
    return newHead;
}

@end
