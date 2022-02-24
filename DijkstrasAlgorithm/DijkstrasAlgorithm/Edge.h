//
//  Edge.h
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/18/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef Edge_h
#define Edge_h
#import "Node.h"

@interface Edge : NSObject

//properties
@property int to; //the end of this Edge
@property double distance;

//constructor
-(instancetype)initWithStart : (Node *) start WithEnd:(Node *)end;

@end

#endif /* Edge_h */
