//
//  Node.h
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/18/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef Node_h
#define Node_h

@interface Node : NSObject

//properties

@property int ID;
@property int x;
@property int y;

//constructor
-(instancetype)initNode : (int) node WithX : (int) x andY : (int) y;

@end

#endif /* Node_h */
