//
//  main.m
//  LinkedListAPI
//
//  Created by zxiao23 on 4/6/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "LinkedList.h"
#import "ListNode.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
        NSLog(@"Hello, World!");
        ListNode *first = [[ListNode alloc] init];
        LinkedList *myList = [[LinkedList alloc] initWithHead:first];
//        [myList add:1];
//        [myList add:2];
//        [myList print];
//        [myList clear];
        NSLog(@"Is the string empty? %d", [myList isEmpty]);
        for(int i = 1; i < 4; i++){
            [myList add:i];
        }
        [myList addObjectAtIndexRecur:3 object:23];
        [myList addObjectAtIndexRecur:1 object:23];
        [myList printRecur];
        NSLog(@"%d", [myList removeOccurenceRecur:23]);
        [myList print];
    }
    return 0;
}
