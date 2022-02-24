//
//  Recursion.m
//  RecursionPractice
//
//  Created by zxiao23 on 4/1/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Recursion.h"

@implementation Recursion

-(instancetype) init {
    self = [super init];
    if(self){
        NSLog(@"successful initialization");
    }
    return self;
}

//practices

+(int) count7 : (int) num {
    //base case
    if(num == 0){
        return 0;
    }
    //steps
    if(num % 10 == 7){
        return 1 + [self count7 : num / 10];
    }
    return [self count7 : num / 10];
}

+(NSString*) noX : (NSString*) str {
    //base case
    if([str length] == 0){
        return @"";
    }
    //step
    NSString *firstChar = [str substringToIndex:(NSUInteger) 1];
    if([firstChar isEqualToString:@"x"]){
        return [self noX : [str substringFromIndex:(NSUInteger) 1]];
    }
    return [NSString stringWithFormat:@"%@%@", firstChar, [self noX : [str substringFromIndex:(NSUInteger) 1]]];
}

+(bool) groupSum : (int) start array : (NSArray*) arr target : (int) t{
    //base case
    if((int)[arr  objectAtIndex:start] == t){
        return true;
    }
    
    //step case
    if(start == [arr count]-1){
        return false;
    }
    return([self groupSum : (start+1) array : arr target : t] ||[self groupSum : (start+1) array : arr target : (t-(int)[arr  objectAtIndex:start])]);
}

//the actual assignment

//return the sum of the digits from a number
+(int) summingDigits : (int) n{
    //base case
    if(n == 0){
        return 0;
    }
    //steps
    return n % 10 + [self summingDigits: n / 10];
}

//return the weight on the back of a person from row and column
+(double) weightOnBackOf : (int) row column : (int) col{
    NSMutableArray* mem = [[NSMutableArray alloc] initWithCapacity:row+1];
    for(int i = 0; i <= row; i++){
        mem[i] = [[NSMutableArray alloc] initWithCapacity:i+2];
        for(int j = 0; j < i+2; j++){
            mem[i][j] = [NSNumber numberWithFloat: 0.0];
        }
    }
    return [self weightOnBackOfWrapper:row column:col table:mem];
}

//the recursive class for the weightOnBackOf function
+(double) weightOnBackOfWrapper:(int)row column:(int)col table : (NSMutableArray*) table{
    if(row == 0 && col == 0){
        return 0.0;
    }
    
    if([table[row][col] doubleValue] != 0.0){
        return [table[row][col] doubleValue];
    }
    
    if(col == 0){
        table[row][col] = [NSNumber numberWithFloat:100.0 + (float)[self weightOnBackOfWrapper:row - 1 column:0 table : table]/2.0];

        return [table[row][col] doubleValue];
    }else if (col == row){
        table[row][col] = [NSNumber numberWithFloat:100.0 + (float)[self weightOnBackOfWrapper:row - 1 column:col - 1 table : table]/2.0];
        
        return [table[row][col] doubleValue];
    }
    table[row][col] = [NSNumber numberWithFloat:200.0 + (float)[self weightOnBackOfWrapper:row - 1 column: col - 1 table : table]/2.0 + (float)[self weightOnBackOfWrapper:row - 1 column: col table : table]/2.0];
    return [table[row][col] doubleValue];
}

//returns the number of critical votes from the block at the index
+(int) countCriticalVotes : (NSArray*) blocks blockIndex : (int) index{
    NSNumber* sum = [blocks valueForKeyPath: @"@sum.self"];
    int votes = [blocks[index] intValue];
    //remove the current voting block from the blocks
    NSMutableArray *newBlocks = [blocks mutableCopy];
    [newBlocks removeObjectsInRange:(NSRange){index, 1}];
    return [self countCriticalVotesWrapper:newBlocks votes:votes voteCount:0 targetVotes:[sum intValue]/2+1];
}

//the recursive class for the countCriticalVotes function
//take in the blocks array with the number of votes from the block that we are considering, the vote count for one side, and the number of target votes we need to win.
+(int) countCriticalVotesWrapper : (NSArray*) blocks votes : (int) votes voteCount : (int) voteCount targetVotes : (int) targetVotes{
    if(voteCount >= targetVotes){
        return 0;
    }
    if([blocks count] == 0){
        if(voteCount + votes >= targetVotes){
            return 1;
        }
        return 0;
    }
    //take the first block out and adds the critical vote counts with/without the block
    int newVotes = [blocks[0] intValue];
    blocks = [blocks subarrayWithRange: NSMakeRange(1, [blocks count] - 1)];
    return [self countCriticalVotesWrapper:blocks votes:votes voteCount:voteCount targetVotes:targetVotes] + [self countCriticalVotesWrapper:blocks votes:votes voteCount:voteCount + newVotes targetVotes:targetVotes];
}

//returns the winning player and the number of strategies he/she can win with
+(NSString*) coinGame : (int) coins player1 :(NSString*) player1 player2 : (NSString*) player2 {
    //base case
    if(coins == 1 || coins == 2 || coins == 0){
        return [NSString stringWithFormat:@"%@ %d", player1, 1];
    }
    //technically we can use recursion to find the result when the number of coins equal to 3, however, this statement here allows me to not do a if statement in the step cases to see whether the number of coins is larger than 3 or not. (it also saves time)
    if(coins == 3){
        return [NSString stringWithFormat:@"%@ %d", player2, 2];
    }
    //step case
    //when the number of coins is divisible by 3, we know the second player is going to win, and we adds up the number of strategies
    if(coins % 3 == 0){
        NSArray *nextStep1 = [[self coinGame : coins - 1 player1 : player2 player2:player1] componentsSeparatedByString: @" "];
        NSArray *nextStep2 = [[self coinGame : coins - 2 player1 : player2 player2:player1] componentsSeparatedByString: @" "];
        NSArray *nextStep4 = [[self coinGame : coins - 4 player1 : player2 player2:player1] componentsSeparatedByString: @" "];
        return [NSString stringWithFormat:@"%@ %d", player2, [nextStep1[1] intValue] + [nextStep2[1] intValue] + [nextStep4[1] intValue]];
    }
    
    //when the number of coins is not divisible by 3, we know the first player is going to win by making the number of coins divisible by 3, and we adds up the number of strategies according to whether there is one more coins than 3 or two more
    if(coins % 3 == 1){
        NSArray *nextStep1 = [[self coinGame : coins - 1 player1 : player2 player2:player1] componentsSeparatedByString: @" "];
        NSArray *nextStep4 = [[self coinGame : coins - 4 player1 : player2 player2:player1] componentsSeparatedByString: @" "];
         return [NSString stringWithFormat:@"%@ %d", player1, [nextStep1[1] intValue] + [nextStep4[1] intValue]];
    }
    NSArray *nextStep2 = [[self coinGame : coins - 2 player1 : player2 player2:player1] componentsSeparatedByString: @" "];
    return [NSString stringWithFormat:@"%@ %d", player1, [nextStep2[1] intValue]];
}

@end
