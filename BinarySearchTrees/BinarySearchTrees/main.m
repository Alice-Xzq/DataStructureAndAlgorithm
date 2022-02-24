//
//  main.m
//  BinarySearchTrees
//
//  Created by zxiao23 on 4/29/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "BST.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        BST *myTree = [[BST alloc] init];
        [myTree putKey:23];
        [myTree putKey:31];
        [myTree putKey:21];
        [myTree putKey:19];
        [myTree putKey:22];
        [myTree putKey:81];
        [myTree putKey:97];
        [myTree inorder];
        [myTree deleteKey:23];
        [myTree inorder];
        [myTree deleteKey:19];
        [myTree inorder];
        printf("min: %d\n",[myTree min]);
        printf("max: %d\n",[myTree max]);
    }
    return 0;
}
