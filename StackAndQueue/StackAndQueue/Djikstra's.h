//
//  Djikstra's.h
//  StackAndQueue
//
//  Created by zxiao23 on 4/13/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef Djikstra_s_h
#define Djikstra_s_h
#import "Stack.h"

@interface Djikstra : NSObject

@property Stack *operandStack;
@property Stack *operatorStack;

-(int) solve : (NSString *) exp;
-(int)solveGeneral:(NSString *)exp;

@end

#endif /* Djikstra_s_h */
