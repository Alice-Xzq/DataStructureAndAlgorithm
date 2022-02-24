//
//  main.m
//  Red&BlackBinarySearchTree
//
//  Created by zxiao23 on 5/10/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LLRBTree.h"
#import "Node.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        LLRBTree *tree = [[LLRBTree alloc] init];
        
        [tree insertKey:100];
        [tree insertKey:50];
        NSLog(@"%@",tree);
    }
    return 0;
}
