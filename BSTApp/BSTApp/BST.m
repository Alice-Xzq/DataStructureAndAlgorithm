//
//  BST.m
//  BinarySearchTrees
//
//  Created by zxiao23 on 4/29/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BST.h"

@implementation BST

//constructors
-(instancetype)init{
    self = [super init];
    if(self){
        self.root = NULL;
    }
    return self;
}

-(instancetype)initWithRoot : (TreeNode *) node{
    self = [super init];
    if(self){
        self.root = node;
    }
    return self;
}

//methods

// Does this symbol table contain the given key?
-(bool)contains : (int) key{
    TreeNode *cur = self.root;
    while(cur != NULL){
        if(key < cur.key){
            cur = cur.left;
        }else if(key > cur.key){
            cur = cur.right;
        }else{
            return true;
        }
    }
    return false;
}

// Removes the specified key and its associated value from this symbol table (if the key is in this symbol table).
-(void)deleteKey : (int) key{
    self.root = [self deleteKey:key fromNode:self.root];
}

-(TreeNode *)deleteKey : (int) key fromNode : (TreeNode *) node{
    if(!node){
        return NULL;
    }
    if(node.key > key){
        node.left = [self deleteKey:key fromNode:node.left]; //search for the key in the tree starting from the left child (smaller)
    }else if(node.key < key){
        node.right = [self deleteKey:key fromNode:node.right]; //search for the key in the tree starting from the right child (larger)
    }else{
        //now we are on the node we wanted to delete
        if(!node.right){
            //if the node has no right child, we simply replace it with its left child
            return node.left;
        }else if(!node.left){
            //if the node has no left child, we simply replace it with its right child
            return node.right;
        }
        
        //when the current node has both children, we need to find and delete the next smallest element and replace the current node with it
        TreeNode *temp = node;
        node = [self min:temp.right];
        node.right = [self deleteSmallest:temp.right];
        node.left = temp.left;
    }
    node.count = 1 + [self size:node.left] + [self size:node.right]; //updating the count
    return node;
}

//finds and returns the node with specific key (returns NULL if can't find the key)
-(TreeNode *)findNodeWithKey : (int) key{
    TreeNode *cur = self.root;
    while(cur != NULL){
        if(cur.key < key){
            cur = cur.left;
        }else if(cur.key > key){
            cur = cur.right;
        }else{
            return cur;
        }
    }
    return NULL;
}

//finds and deletes the key of the smallest item starting from the current node
-(TreeNode *)deleteSmallest : (TreeNode *) node{
    //if the left child is empty, we know the current element is smallest in this branch
    if(!node){
        return NULL;
    }
    //if the current node has no left node, we are replacing the current node with its right child
    if(!node.left){
        return node.right;
    }
    
    node.left = [self deleteSmallest:node.left];
    node.count = 1 + [self size:node.left] + [self size:node.right]; //updating the count
    return node;
}

//finds and deletes the key of the largest item starting from the current node
-(TreeNode *)deleteLargest : (TreeNode *) node{
    //if the left child is empty, we know the current element is smallest in this branch
    if(!node){
        return NULL;
    }
    //if the current node has no right node, we are replacing the current node with its left child
    if(!node.right){
        return node.left;
    }
    
    node.right = [self deleteSmallest:node.right];
    node.count = 1 + [self size:node.left] + [self size:node.right]; //updating the count
    return node;
}

// Returns the height of the BST (for debugging)
-(int)height{
    return [self heightFromNode:self.root];
}

-(int)heightFromNode : (TreeNode *)node{
    if(!node){
        return 0;
    }
    
    return MAX([self heightFromNode:node.left]+1, [self heightFromNode:node.right]+1);
}

// Returns true if this symbol table is empty.
-(bool)isEmpty{
    if(self.root){
        return false;
    }
    return true;
}

// Returns the largest key in the symbol table.
-(int)max{
    TreeNode *max = [self max:self.root];
    return max.key;
}

-(TreeNode *)max : (TreeNode *) node{
    if(!node){
        return NULL;
    }
    if(!node.right){
        return node;
    }
    
    return [self max:node.right];
}

// Returns the smallest key in the symbol table.
-(int)min{
    TreeNode *min = [self min:self.root];
    return min.key;
}

-(TreeNode *)min : (TreeNode *) node{
    if(!node){
        return NULL;
    }
    if(!node.left){
        return node;
    }
    
    return [self min:node.left];
}

// traverse (prints out) the keys in level order.
-(NSMutableString *)levelorder{
    int index = 0;
    NSMutableString *str = [[NSMutableString alloc] init];
    NSMutableArray *list = [[NSMutableArray alloc] init];
    [list addObject:self.root];
    TreeNode *cur = list[index];
    while(index < [list count] && list[index]){
        cur = list[index];
        if(cur.left){
            [list addObject:cur.left];
        }
        if(cur.right){
            [list addObject:cur.right];
        }
        [str appendFormat:@"[key: %i] ", cur.key];
        index++;
    }
    [str appendString:@"\n"];
    return str;
}

// traverse (prints out) the keys in inorder order.
-(NSMutableString *)inorder{
    NSMutableString *str = [[NSMutableString alloc] init];
    [self inorder:self.root withString:str];
    [str appendString:@"\n"];
    return str;
}

-(NSMutableString *)inorder : (TreeNode *)node withString : (NSMutableString *) str{
    if(node == NULL){
        return str;
    }
    [self inorder:node.left withString:str];
    [str appendFormat:@"[key: %i] ", node.key];
    [self inorder:node.right withString:str];
    return str;
}

// traverses (prints out) the keys in postorder order.
-(NSMutableString *)postorder{
    NSMutableString *str = [[NSMutableString alloc] init];
    [self postorder:self.root withString:str];
    [str appendString:@"\n"];
    return str;
}

-(NSMutableString *)postorder : (TreeNode *)node withString : (NSMutableString *) str{
    if(node == NULL){
        return str;
    }
    [self postorder:node.left withString:str];
    [self postorder:node.right withString:str];
    [str appendFormat:@"[key: %i] ", node.key];
    return str;
}

// traverses (prints out) the keys in preorder order.
-(NSMutableString *)preorder{
    NSMutableString *str = [[NSMutableString alloc] init];
    str = [self preorder:self.root withString:str];
    [str appendString:@"\n"];
    return str;
}

-(NSMutableString *)preorder : (TreeNode *)node withString : (NSMutableString *) str{
    if(node == NULL){
        return str;
    }
    [str appendFormat:@"[key: %i] ", node.key];
    [self preorder:node.left withString:str];
    [self preorder:node.right withString:str];
    return str;
}

// Inserts the specified key-value pair into the symbol table, overwriting the old value with the new value if the symbol table already contains the specified key.
-(void)putKey : (int) k{
    self.root = [self putOnNode:self.root withKey:k];
}

-(TreeNode *)putOnNode : (TreeNode *) node withKey : (int) key{
    if(node == NULL){
        return [[TreeNode alloc] initWithKey:key];
    }
    if(key < node.key){
        node.left = [self putOnNode:node.left withKey:key];
    }else if(key > node.key){
        node.right = [self putOnNode:node.right withKey:key];
    }
    node.count = 1 + [self size:node.left] + [self size:node.right];
    return node;
}

// Returns the number of key-value pairs in this symbol table.
-(int)size{
    return [self size:self.root];
}

-(int)size : (TreeNode *)node{
    if(node == NULL){
        return 0;
    }
    return node.count;
}

@end
