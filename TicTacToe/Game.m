//
//  Game.m
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import "Game.h"
#import "Player.h"

int const FIELDSIZE = 3;

int const PLAYERWON = 2;
int const FIELDTAKEN = 1;
int const GAMEDRAW= 3;
int const GAMEEND = 4;

@implementation Game
@synthesize board;
@synthesize player1;
@synthesize player2;
@synthesize exit;
@synthesize finish;
@synthesize moveCounter;



-(id) init
{
    self=[super init];
    
    NSNumber *n = [NSNumber numberWithInt:0];
    NSMutableArray *col = [[NSMutableArray alloc] init];
    NSMutableArray *rows =[[NSMutableArray alloc] init];
    
    for (int i=0;i<FIELDSIZE;i++)
    {
        [col addObject:n];
    }

    for (int i=0;i<FIELDSIZE;i++)
    {
        NSMutableArray *c = [[NSMutableArray alloc] initWithArray:col copyItems:YES];
        [rows addObject:c];
    }
    
    self.board = rows;
    
    //init players and refer players to the board
    
    self.player1 = [[Player alloc]init];
    self.player2 = [[Player alloc]init];
    self.player1.board = self.board;
    self.player2.board = self.board;
    self.player1.number = 1;
    self.player2.number = 2;
    
    return self;
}

-(BOOL) checkDraw{

    int moveMax = FIELDSIZE*FIELDSIZE;
    if (moveCounter >= moveMax)
    {
        NSLog(@"Game ends draw");
        finish = YES;
        return GAMEDRAW;
    }
    return 0;
}

-(void)resetBoard{
    for (int i = 0; i < [self.board count]; i++) {
        for (int j = 0; j<[[self.board objectAtIndex:i] count]; j++) {
            NSNumber *n = [NSNumber numberWithInt:0];
            [[self.board objectAtIndex:i] replaceObjectAtIndex:j withObject:n];
        }
    }
}




@end

