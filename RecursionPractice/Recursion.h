//
//  Recursion.h
//  RecursionPractice
//
//  Created by zxiao23 on 4/1/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef Recursion_h
#define Recursion_h

@interface Recursion : NSObject

+(int) count7 : (int) num;
+(NSString*) noX : (NSString*) str;
//+(BOOL) array6 : (NSArray*) arr index : (int) i;
+(bool) groupSum : (int) start array : (NSArray*) arr target : (int) t;
+(int) summingDigits : (int) n;
+(double) weightOnBackOf : (int) row column : (int) col;
+(double) weightOnBackOfWrapper:(int)row column:(int)col table : (NSMutableArray*) table;
+(int) countCriticalVotes : (NSArray*) blocks blockIndex : (int) index;
+(int) countCriticalVotesWrapper : (NSArray*) blocks votes : (int) votes voteCount : (int) voteCount targetVotes : (int) targetVotes;
+(NSString*) coinGame : (int) coins player1 :(NSString*) player1 player2 : (NSString*) player2;


@end
#endif /* Recursion_h */
