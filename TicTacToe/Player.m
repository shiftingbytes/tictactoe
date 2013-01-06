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
    if([self checkWinningMove:self.number :x :y])
    {
        return PLAYERWON;
    }
    
   
    return 0;
}


-(NSMutableArray*) aiMove;
{
    NSMutableArray *array = [[NSMutableArray alloc]init];
    NSNumber *zero = [NSNumber numberWithInt:0];
    int x = -1;
    int y = -1;
    int myNumber = self.number;
    int opponentNumber = abs(self.number - 3);
    NSNumber *n;
    NSNumber *o;
    

    for(int i=0;i<FIELDSIZE;i++)
    {
        for(int j=0;j<FIELDSIZE;j++)
        {   
            o = [[board objectAtIndex:i] objectAtIndex:j];
            
            if ([o isEqualToNumber:zero]) {
                
                n = [NSNumber numberWithInt:opponentNumber];
                [[board objectAtIndex:i] replaceObjectAtIndex:j withObject:n];
                
                if([self checkWinningMove:opponentNumber :i :j])
                {
                    x=i;y=j;
                    NSLog(@"Winning Move: x:%i y:%i",i,j);
                    
                }
                
                n = [NSNumber numberWithInt:myNumber];
                [[board objectAtIndex:i] replaceObjectAtIndex:j withObject:n];
                
                if([self checkWinningMove:myNumber :i :j])
                {
                    x=i;y=j;
                    NSLog(@"Winning Move: x:%i y:%i",i,j);
                    
                }
                
                [[board objectAtIndex:i] replaceObjectAtIndex:j withObject:o];
            }
            
            
          
        }
    }
    


    if(y==-1)
    {
        NSLog(@"Random AI");
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



-(BOOL)checkWinningMove:(int) playerNumber: (int) x :(int) y
 {
    NSNumber *n = [NSNumber numberWithInt:playerNumber];
     
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
             return YES;
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
             return YES;
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
                 return YES;
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
             return YES;
         }
         
     }
 
 
     return NO;
 }



@end

