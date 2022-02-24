//
//  LLRBTree.m
//  LLRBTree
//
//  Created by Jongwon Park on 5/10/21.
//

#import <Foundation/Foundation.h>
#import "LLRBTree.h"
#import "Node.h"

@implementation LLRBTree

- (instancetype) init {
    self = [super init];
    return self;
}

-(void) insertKey:(int)key{
    self.root = [self insertKey:key fromNode:self.root];
}

- (Node *) insertKey:(int)key fromNode : (Node *) myNode{
    Node* newNode = [[Node alloc] initWithKey:key];
    
    if(myNode == NULL){
        return newNode;
    }
    
    if(myNode.key > key){
        myNode.leftChild = [self insertKey:key fromNode:myNode.leftChild];
    }else if(myNode.key < key){
        myNode.rightChild = [self insertKey:key fromNode:myNode.rightChild];
    }else{
        return myNode;
    }
    
    //when right child is red but left is not
    if(myNode.rightChild.isRed && (myNode.leftChild == NULL || !myNode.leftChild.isRed)){
        myNode = [self rotateLeft:myNode];
    }
    
    //when left and left of left are both red
    if(myNode.leftChild && myNode.leftChild.isRed && myNode.leftChild.leftChild && myNode.leftChild.leftChild.isRed){
        myNode = [self rotateRight:myNode];
    }
    
    //when left and right are both red
    if(myNode.leftChild && myNode.leftChild.isRed && myNode.rightChild && myNode.rightChild.isRed){
        [self flip:myNode];
    }
    
    return myNode;
}

// returns the new top node given the old top node
// where the new top node is the right child of the old top node
- (Node*) rotateLeft:(Node*)topNode {
    Node* newTopNode = topNode.rightChild;
    Node* newRight = newTopNode.leftChild;
    
    newTopNode.leftChild = topNode;
    topNode.rightChild = newRight;
    
    [self swapColorBetween:topNode andNode:newTopNode];
    
    return newTopNode;
}

- (Node*) rotateRight:(Node*)topNode {
    Node* newTopNode = topNode.leftChild;
    Node* newLeft = newTopNode.rightChild;
       
    newTopNode.rightChild = topNode;
    topNode.leftChild = newLeft;
    
    [self swapColorBetween:newTopNode andNode:topNode];
    
    return newTopNode;
}

-(void)swapColorBetween : (Node *) first andNode: (Node *) second {
    bool firstColor = first.isRed;
    first.isRed = second.isRed;
    second.isRed = firstColor;
}

- (void) flip:(Node*)parentNode {
    parentNode.isRed = !parentNode.isRed;
    parentNode.leftChild.isRed = false;
    parentNode.rightChild.isRed = false;
}


@end
