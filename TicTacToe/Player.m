//
//  Player.m
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import "Player.h"
#import "Game.h"

@implementation Player
@synthesize   board, number, isAi;

const static int PLAYERWON = 2;
const static int FIELDTAKEN =1;
const static int GAMEDRAW = 3;
const static int GAMEEND = 4;

-(id)init{

    self=[super init];
    
    return self;

}



-(int) move:(int)x :(int)y
{
    //place player number number on gameboard if it is not taken already
    if ([[board objectAtIndex:x]objectAtIndex:y]==0) {
        NSNumber *n = [NSNumber numberWithInt:self.number];
        [[board objectAtIndex:x] replaceObjectAtIndex:y withObject:n];
    }else{
        
        return FIELDTAKEN;
        
    }
    
    //check victory conditions
    
    
    return 0;
}



@end

