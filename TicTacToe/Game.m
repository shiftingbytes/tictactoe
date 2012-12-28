//
//  Game.m
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import "Game.h"
#import "Player.h"

@implementation Game
@synthesize board = _board;
@synthesize player1;
@synthesize player2;

const static int FIELDSIZE=3;

-(id) init
{
    self=[super init];
    
    
    NSNumber *n = [NSNumber numberWithInt:0];
    NSMutableArray *col = [[NSMutableArray alloc]init];
    NSMutableArray *rows =[[NSMutableArray alloc]init];
    
    for (int i=0; i < FIELDSIZE; i++) {
        [col addObject:n];
    }
    for (int i=0; i < FIELDSIZE; i++) {
        [rows addObject:col];
    }
    
    self.board = [NSMutableArray arrayWithArray:rows];
    
    self.player1 = [[Player alloc]init];
    self.player2 = [[Player alloc]init];
    self.player1.board = self.board;
    self.player2.board = self.board;
    
    
    return self;
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

