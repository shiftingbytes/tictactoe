//
//  Player.h
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import <Foundation/Foundation.h>



@interface Player : NSObject
@property BOOL isAi;
@property int number;
@property NSMutableArray *board;


-(int) move: (int) x : (int) y;


@end
