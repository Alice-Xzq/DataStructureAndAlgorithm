//
//  ViewController.m
//  BSTApp
//
//  Created by zxiao23 on 5/6/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import "ViewController.h"

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Do any additional setup after loading the view.
    self.myTree = [[BST alloc] init];
    self.displayMode = 0;
}

- (void)setRepresentedObject:(id)representedObject {
    [super setRepresentedObject:representedObject];

    // Update the view, if already loaded.
}

- (IBAction)add:(id)sender {
    int input = [self.valueInput intValue];
    [self.myTree putKey:input];
    [self displayNewTree];
}

- (IBAction)delete:(id)sender {
    int input = [self.valueInput intValue];
    [self.myTree deleteKey:input];
    [self displayNewTree];
}

- (IBAction)contains:(id)sender {
    int input = [self.valueInput intValue];
    if([self.myTree contains:input]){
        [self.resultDisplay setStringValue:@"The value you just entered is in the tree"];
    }else{
        [self.resultDisplay setStringValue:@"The value you just entered is not in the tree"];
    }
}

- (IBAction)printMax:(id)sender {
    [self.resultDisplay setStringValue:[NSString stringWithFormat:@"The maximum value in this tree is %d", [self.myTree max]]];
}

- (IBAction)printMin:(id)sender {
    [self.resultDisplay setStringValue:[NSString stringWithFormat:@"The minimum value in this tree is %d", [self.myTree min]]];
}

- (IBAction)size:(id)sender {
    [self.resultDisplay setStringValue:[NSString stringWithFormat:@"The size of this tree is %d", [self.myTree size]]];
}

- (IBAction)height:(id)sender {
    [self.resultDisplay setStringValue:[NSString stringWithFormat:@"The height of this tree is %d", [self.myTree height]]];
}

- (IBAction)printPreorder:(id)sender {
    self.displayMode = 1;
    [self displayNewTree];
}

- (IBAction)printInorder:(id)sender {
    self.displayMode = 2;
    [self displayNewTree];
}

- (IBAction)printPostorder:(id)sender {
    self.displayMode = 3;
    [self displayNewTree];
}

- (IBAction)printLevelorder:(id)sender {
    self.displayMode = 0;
    [self displayNewTree];
}

- (void)displayNewTree{
    if(self.displayMode == 0){
        [self.treeDisplay.documentView deleteToBeginningOfParagraph:@""];
        [self.treeDisplay.documentView insertText:[self.myTree levelorder]];
    }else if(self.displayMode == 1){
        [self.treeDisplay.documentView insertText:[self.myTree preorder]];
    }else if(self.displayMode == 2){
        [self.treeDisplay.documentView insertText:[self.myTree inorder]];
    }else{
        [self.treeDisplay.documentView insertText:[self.myTree postorder]];
    }
}

@end
