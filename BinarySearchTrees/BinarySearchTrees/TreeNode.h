//
//  TreeNode.h
//  BinarySearchTrees
//
//  Created by zxiao23 on 4/29/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef TreeNode_h
#define TreeNode_h

@interface TreeNode : NSObject

@property int key;
@property TreeNode *left;
@property TreeNode *right;
@property int count;

//methods
-(instancetype)initWithKey : (int) k;
-(instancetype)initWithKey : (int) k andCount: (int) c;
-(instancetype)initWithKey : (int) k withLeftKey : (TreeNode *) leftNode andRightKey : (TreeNode *) rightNode;
-(instancetype)initWithKey : (int) k andCount: (int) c withLeftKey : (TreeNode *) leftNode andRightKey : (TreeNode *) rightNode;


@end

#endif /* TreeNode_h */
