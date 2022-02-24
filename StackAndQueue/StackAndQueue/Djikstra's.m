//
//  Djikstra's.m
//  StackAndQueue
//
//  Created by zxiao23 on 4/13/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Djikstra's.h"
#import "Stack.h"

@implementation Djikstra

//constructor
-(instancetype)init{
    self = [super init];
    if(self){
        self.operandStack = [[Stack alloc] init];
        self.operatorStack = [[Stack alloc] init];
    }
    return self;
}

//method

-(int)solve:(NSString *)exp{
    int index = 0;
    while(index < [exp length]){
        char curChar = [exp characterAtIndex:index];
        if(curChar >= '0' && curChar <= '9'){
            NSString *curNum = [NSString stringWithFormat:@"%c", curChar];
            index++;
            while(index < [exp length] && [exp characterAtIndex:index] >= '0' && [exp characterAtIndex:index] <= '9'){
                curNum = [NSString stringWithFormat:@"%c%c", curChar, [exp characterAtIndex:index]];
                index++;
            }
            [self.operandStack push:[NSNumber numberWithInt:[curNum intValue]]];
        }else if(curChar == '+' || curChar == '-' || curChar == '*' || curChar == '/'){
            [self.operatorStack push:[NSString stringWithFormat:@"%c", curChar]];
            index++;
        }else if(curChar == ')'){
            NSNumber *result = [self.operandStack pop];
            NSNumber *num = [self.operandStack pop];
            char curChar = [[self.operatorStack pop] characterAtIndex:0];
            if(curChar == '+'){
                result = [NSNumber numberWithInt:([result intValue] + [num intValue])];
            }else if(curChar == '-'){
                result = [NSNumber numberWithInt:([num intValue] - [result intValue])];
            }else if(curChar == '*'){
                result = [NSNumber numberWithInt:([result intValue] * [num intValue])];
            }else{
                result = [NSNumber numberWithInt:([num intValue] / [result intValue])];
            }
            [self.operandStack push:result];
            index++;
        }else{
            index++;
        }
    }
    return [self.operandStack.pop intValue];
}

-(int)solveGeneral:(NSString *)exp{
    if(![exp containsString:@"("]){
        return [self complieExp : exp];
    }
    NSString *before = [exp substringToIndex:[exp rangeOfString:@"("].location];
    NSString *middle = [exp substringWithRange:NSMakeRange([exp rangeOfString:@"("].location + 1, ([exp rangeOfString:@")" options:NSBackwardsSearch].location - [exp rangeOfString:@"("].location) - 1)];
    NSString *back = [exp substringFromIndex:[exp rangeOfString:@")" options:NSBackwardsSearch].location+1];
    NSLog(@"%@ // %@ // %@", before, middle, back);
    return [self complieExp:[NSString stringWithFormat:@"%@%@%@", before, [[NSNumber numberWithInt:[self solveGeneral:middle]] stringValue], back]];
}

//this method complies an expression without any "()" so it follows the order of * / and then + -
-(int)complieExp : (NSString *)exp{
    int index = 0;
    //the next part follows the order of doing * and / before + and -
    while(index < [exp length]){
        char curChar = [exp characterAtIndex:index];
        if(curChar >= '0' && curChar <= '9'){
            NSString *curNum = @"";
            while(curChar >= '0' && curChar <= '9'){
                curNum = [NSString stringWithFormat:@"%@%c", curNum, curChar];
                index++;
                if(index >= [exp length]){
                    break;
                }
                curChar = [exp characterAtIndex:index];
            }
            [self.operandStack push:curNum];
        }else if(curChar == '+' || curChar == '-'){
            [self.operatorStack push:[NSString stringWithFormat:@"%c", curChar]];
            index++;
        //a special note here: I decided to do a * or / operation and get the next number directly whenever I encounter them because they should be complied first
        }else if(curChar == '*' || curChar == '/'){
            char op = curChar;
            NSNumber *num = [self.operandStack pop];
            NSString *nxtNum = @"";
            index++;
            curChar = [exp characterAtIndex:index];
            while(curChar >= '0' && curChar <= '9'){
                nxtNum = [NSString stringWithFormat:@"%@%c", nxtNum, curChar];
                index++;
                if(index >= [exp length]){
                    break;
                }
                curChar = [exp characterAtIndex:index];
            }
            NSNumber *result = [[NSNumber alloc] init];
            if(op == '*'){
                result = [NSNumber numberWithInt:([num intValue] * [nxtNum intValue])];
            }else{
                result = [NSNumber numberWithInt:([num intValue] / [nxtNum intValue])];
            }
            [self.operandStack push:result];
        }else if(curChar == '(' || curChar == ')'){
            NSLog(@"Error Char");
        }
    }
    //complies the rest of the + and - operations
    while(![self.operatorStack isEmpty]){
        char curChar = [[self.operatorStack pop] characterAtIndex:0];
        NSNumber *num = [self.operandStack pop];
        NSNumber *result = [self.operandStack pop];
        if(curChar == '+'){
            result = [NSNumber numberWithInt:([result intValue] + [num intValue])];
        }else if(curChar == '-'){
            result = [NSNumber numberWithInt:([num intValue] - [result intValue])];
        }
        [self.operandStack push:result];
    }
    return [self.operandStack.pop intValue];
}

@end
