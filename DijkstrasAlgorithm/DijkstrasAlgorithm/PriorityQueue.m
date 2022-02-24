//
//  PriorityQueue.m
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/18/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "PriorityQueue.h"

@implementation PriorityQueue

//constructor
-(instancetype)init{
    self = [super init];
    if(self){
        self.myQueue = [[NSMutableArray alloc] init];
        [self.myQueue addObject:[NSNumber numberWithInt:831]];
    }
    return self;
}

//methods
-(bool)isEmpty{
    if([self.myQueue count] <= 1){
        return true;
    }
    return false;
}

-(void)add: (QueueNode *) node{
    if([self.myQueue count] <= 1){
        [self.myQueue addObject:node];
        return;
    }
    [self.myQueue addObject:node];
    [self floatNode:node FromIndex:(int)[self.myQueue count]-1];
}

-(QueueNode *)getMin{
    return self.myQueue[1];
}

-(QueueNode *)popMin{
    QueueNode *min = self.myQueue[1];
    self.myQueue[1] = self.myQueue[[self.myQueue count]-1];//put the last element as the root
    [self heapifyFrom:1];
    [self.myQueue removeLastObject];
    return min;
}

//get left child of a node of a tree
-(int)getLeftChildOf : (int) index{
    if(((2*index) < [self.myQueue count]) && (index >= 1)){
        return (2*index);
    }
    return -1;
}

//get right child of a node of a tree
-(int)getRightChildOf : (int) index{
    if((((2*index)+1) < [self.myQueue count]) && (index >= 1)){
        return ((2*index)+1);
    }
    return -1;
}

//get the parent of a node of a tree
-(int)getParentOf: (int) index{
    if ((index > 1) && (index < [self.myQueue count])) {
      return index/2;
    }
    return -1;
}

//this method makes the tree with root at index a min-heap
-(void)heapifyFrom: (int) index{
    int leftChildIndex = [self getLeftChildOf:index];
    int rightChildIndex = [self getRightChildOf:index];
    
    int smallestIndex = index; //we are going to find the smallest between the current index and its children
    QueueNode *current = self.myQueue[index];
    
    if(leftChildIndex != -1){
        QueueNode *leftChild = self.myQueue[leftChildIndex];
        if(leftChild.distanceUntil < current.distanceUntil){
            smallestIndex = leftChildIndex;
        }
    }
    
    if(rightChildIndex != -1){
        QueueNode *rightChild = self.myQueue[rightChildIndex];
        if(rightChild.distanceUntil < current.distanceUntil){
           smallestIndex = rightChildIndex;
        }
    }
    
    //if the smallest is not the current node, then it is not a min-heap, so we need to swap it to make it the smallest
    if(smallestIndex != index){
        QueueNode *temp = self.myQueue[smallestIndex];
        self.myQueue[smallestIndex] = self.myQueue[index];
        self.myQueue[index] = temp;
        [self heapifyFrom:smallestIndex];
    }
}

-(void)floatNode: (QueueNode *) node FromIndex : (int) index{
    self.myQueue[index] = node;
    QueueNode *par = self.myQueue[[self getParentOf:index]];
    QueueNode *cur = self.myQueue[index];
    while(par.distanceUntil > cur.distanceUntil){
        QueueNode *temp = self.myQueue[[self getParentOf:index]];
        self.myQueue[[self getParentOf:index]] = self.myQueue[index];
        self.myQueue[index] = temp;
        index = [self getParentOf:index];
        if(index <= 1){
            break;
        }
        par = self.myQueue[[self getParentOf:index]];
        cur = self.myQueue[index];
    }
}


@end
