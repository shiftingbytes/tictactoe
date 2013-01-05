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
@synthesize board, number, isAi;



-(id)init{

    self=[super init];
    return self;

}

// Player Turn
// return true if it was a valid turn
// return false if intended field was already taken
-(BOOL) playerTurn: (int) x : (int) y
{
    switch ([self move:x :y]) {
        case 1:
            NSLog(@"Field %i,%i already taken",x,y);
            return NO;
            break;
        case 2:
            self.hasWon = YES;
            NSLog(@"Player %i has won",self.number);
            return YES;
            break;
        default:
            NSLog(@"Player %i has taken field %i,%i",self.number,x,y);
            return YES;
            break;
    }

}

-(int) move:(int)x :(int)y
{
    NSNumber *n = [NSNumber numberWithInt:self.number];
    
    //place player number on gameboard if it is not taken already
     NSNumber *zero = [NSNumber numberWithInt:0];
    
    if ([[[board objectAtIndex:x]objectAtIndex:y] isEqualToNumber:zero]) {
        
        NSNumber *n = [NSNumber numberWithInt:self.number];

        [[self.board objectAtIndex:x] replaceObjectAtIndex:y withObject:n];
       // NSLog(@"Value to change: %@ at %i",[self.board objectAtIndex:x],y);
        
    }else{
        
        return FIELDTAKEN;
    }
    
    //check victory conditions
    //check col
    
    for(int i=0;i<FIELDSIZE;i++)
    {
        if([[board objectAtIndex:x]objectAtIndex:i] != n)
           {
               break;
           }
        if(i == FIELDSIZE-1)
           {
               return PLAYERWON;
           }
           
    }
    //check rows
    for(int i=0;i<FIELDSIZE;i++)
    {
        if([[board objectAtIndex:i]objectAtIndex:y] != n)
        {
            break;
        }
        if(i == FIELDSIZE-1)
        {
            return PLAYERWON;
        }
        
    }
    
    if(x == y)
    {
        //we're on a diagonal
        for(int i=0;i<FIELDSIZE;i++)
        {
            if([[board objectAtIndex:i]objectAtIndex:i] != n)
            {
                break;
            }
            if(i == FIELDSIZE-1)
            {
                return PLAYERWON;
            }
            
        }
    }
    
    //check anti diagonal
    for(int i=0;i<FIELDSIZE;i++)
    {
        if([[board objectAtIndex:i]objectAtIndex:(FIELDSIZE-1)-i] != n)
        {
            break;
        }
        if(i == FIELDSIZE-1)
        {
            return PLAYERWON;
        }
        
    }
    return 0;
}


-(NSMutableArray*) aiMove;
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    int x = -1;
    int y = -1;
    NSNumber *myNumber = [NSNumber numberWithInt:self.number];
    //NSNumber *opponentNumber = [NSNumber numberWithInt:abs(self.number - 3)];
    NSNumber *empty = [NSNumber numberWithInt:0];
    
    int myCounter =0;
    int opponentCounter =0;
    
    
    //check rows
    for(int i=0;i<FIELDSIZE;i++)
    {
        int counter =0;
        int emptycounter =0;
        for(int j=0;j<FIELDSIZE;j++)
        {
            if([[board objectAtIndex:i]objectAtIndex:j] != empty)
            {
                counter++;
                if ([[board objectAtIndex:i]objectAtIndex:j] == myNumber)
                {
                    myCounter++;
                }
                else
                {
                    opponentCounter++;
                }
                
            }
            else
            {
                emptycounter++;
            }
        }
        if(counter >0 && emptycounter >0)
        {
            x=i;
            for(int j=0;j<FIELDSIZE;j++)
            {
                if([[board objectAtIndex:x]objectAtIndex:j] == empty)
                {
                    y=j;
                    break;
                }
            }
            
        
        }
        
    }
    
    //check cols
    if(opponentCounter<2 && myCounter <2)
    {
        
        for(int i=0;i<FIELDSIZE;i++)
        {
        int counter =0;
        int emptycounter =0;
        for(int j=0;j<FIELDSIZE;j++)
        {
            if([[board objectAtIndex:j]objectAtIndex:i] != empty)
            {
                counter++;
            }
            else
            {
                emptycounter++;
            }
        }
        if(counter >0 && emptycounter >0)
        {
            y=i;
            for(int j=0;j<FIELDSIZE;j++)
            {
                if([[board objectAtIndex:j]objectAtIndex:y] == empty)
                {
                    x=j;
                    break;
                }
            }
            
            
        }
        
        }
    
    }
    
    
    if(y==-1)
    {
        y = arc4random() % 3;
    }
    if(x==-1)
    {
        x = arc4random() % 3;
    }
    
    
    NSNumber *xc = [NSNumber numberWithInt:x];
    NSNumber *yc = [NSNumber numberWithInt:y];
    [array addObject:xc];
    [array addObject:yc];
    return array;

    
    
    
}





@end

