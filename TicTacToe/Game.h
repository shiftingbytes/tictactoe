//
//  Game.h
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import <Foundation/Foundation.h>
@class Player;


extern int const FIELDSIZE;
extern int const PLAYERWON;
extern int const FIELDTAKEN;
extern int const GAMEDRAW;
extern int const GAMEEND;

@interface Game : NSObject


@property(nonatomic,strong) NSMutableArray *board;
@property(nonatomic,strong) Player *player1;
@property(nonatomic,strong) Player *player2;
@property(nonatomic,assign) BOOL exit;
@property(nonatomic,assign) BOOL finish;
@property(nonatomic,assign) int moveCounter;


-(void) resetBoard;
-(BOOL) checkDraw;

@end