//
//  BST.h
//  BinarySearchTrees
//
//  Created by zxiao23 on 4/29/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef BST_h
#define BST_h
#import "TreeNode.h"

@interface BST : NSObject

@property TreeNode *root;

//constructors
-(instancetype)initWithRoot : (TreeNode *) node;

//methods
-(bool)contains : (int) key;  // Does this symbol table contain the given key?
-(void)deleteKey : (int) key;   // Removes the specified key and its associated value from this symbol table (if the key is in this symbol table).
-(int)height; // Returns the height of the BST (for debugging)
-(bool)isEmpty; // Returns true if this symbol table is empty.
-(int)max; // Returns the largest key in the symbol table.
-(int)min; // Returns the smallest key in the symbol table.
-(NSMutableString *)levelorder; // traverse (prints out) the keys in level order.
-(NSMutableString *)inorder; // traverse (prints out) the keys in inorder order.
-(NSMutableString *)postorder; // traverses (prints out) the keys in postorder order.
-(NSMutableString *)preorder; // traverses (prints out) the keys in preorder order.
-(void)putKey : (int) k; // Inserts the specified key-value pair into the symbol table, overwriting the old value with the new value if the symbol table already contains the specified key.
-(int)size; // Returns the number of key-value pairs in this symbol table.



@end

#endif /* BST_h */
