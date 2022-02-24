//
//  ViewController.h
//  BSTApp
//
//  Created by zxiao23 on 5/6/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "BST.h"

@interface ViewController : NSViewController

@property BST *myTree;
@property int displayMode;

@property (weak) IBOutlet NSTextField *valueInput;
@property (weak) IBOutlet NSTextField *resultDisplay;
@property (weak) IBOutlet NSScrollView *treeDisplay;

@end

