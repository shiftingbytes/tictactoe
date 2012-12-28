//
//  Game.h
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;

@interface Game : NSObject


@property(nonatomic,strong) NSMutableArray *board;
@property(nonatomic,strong) Player *player1;
@property(nonatomic,strong) Player *player2;

-(void) resetBoard;

@end