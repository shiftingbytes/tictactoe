//
//  Player.h
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import <Foundation/Foundation.h>

@class AiValidationResult;

@interface Player : NSObject
@property BOOL isAi;
@property BOOL hasWon;
@property int number;
@property NSMutableArray *board;

-(int) move: (int) x : (int) y;
-(BOOL) playerTurn: (int) x : (int) y;
-(NSMutableArray*)aiMove;

@end
