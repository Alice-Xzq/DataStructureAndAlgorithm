//
//  TreeNode.m
//  BinarySearchTrees
//
//  Created by zxiao23 on 4/29/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TreeNode.h"

@implementation TreeNode

//constructor
-(instancetype)init{
    self = [super self];
    if(self){
        self.key = -1;
        self.count = 1;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

-(instancetype)initWithKey : (int) k{
    self = [super self];
    if(self){
        self.key = k;
        self.count = 1;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

-(instancetype)initWithKey : (int) k andCount: (int) c{
    self = [super self];
    if(self){
        self.key = k;
        self.count = c;
        self.left = NULL;
        self.right = NULL;
    }
    return self;
}

-(instancetype)initWithKey : (int) k withLeftKey : (TreeNode *) leftNode andRightKey : (TreeNode *) rightNode{
    self = [super self];
    if(self){
        self.key = k;
        self.count = 1;
        self.left = leftNode;
        self.right = rightNode;
    }
    return self;
}

-(instancetype)initWithKey : (int) k andCount: (int) c withLeftKey : (TreeNode *) leftNode andRightKey : (TreeNode *) rightNode{
    self = [super self];
    if(self){
        self.key = k;
        self.count = c;
        self.left = leftNode;
        self.right = rightNode;
    }
    return self;
}

@end
