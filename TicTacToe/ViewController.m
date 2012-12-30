//
//  ViewController.m
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import "ViewController.h"
#import "Player.h"
#import "Game.h"

@interface ViewController ()



@end

@implementation ViewController
@synthesize currentPlayer;
@synthesize game;


int map[9][2];


- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.game = [[Game alloc]init];
    //init coordinates to map buttons to gameboard
    map[0][0]=2;
    map[0][1]=0;
    
    map[1][0]=2;
    map[1][1]=1;
    
    map[2][0]=2;
    map[2][1]=2;
    
    map[3][0]=1;
    map[3][1]=0;
    
    map[4][0]=1;
    map[4][1]=1;
    
    map[5][0]=1;
    map[5][1]=2;
    
    map[6][0]=0;
    map[6][1]=0;
    
    map[7][0]=0;
    map[7][1]=1;
    
    map[8][0]=0;
    map[8][1]=2;
    
    [self nextPlayer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)fieldPressed:(id)sender
{
    if (!game.finish && !currentPlayer.isAi)
    {
        UIButton *b = sender;
        int x; int y;
        //mapping buttons to coordinates on gameboard
        x = map[b.tag][0];
        y = map[b.tag][1];
        [self playerTurn:x :y];

    }
    
}
-(void) playerTurn:(int)x :(int)y
{
    if (currentPlayer.isAi) {
        x = [game aiMove];
        y = [game aiMove];
    }
    
    
    if([currentPlayer playerTurn:x :y ])
    {
        
        [self drawButtonColors];
        game.moveCounter++;
        
        if (currentPlayer.hasWon) {
            game.finish = YES;
            NSString *message =[NSString stringWithFormat:@"Spieler %i hat gewonnen!",currentPlayer.number];
            [self alertInfo: message];
        }
        
        else if (game.checkDraw) {
            game.finish = YES;
            NSString *message = @"Spiel endet unentschieden.";
            [self alertInfo: message];
        }
        
        else{
            
        [NSTimer scheduledTimerWithTimeInterval:1 target:self selector:@selector(nextPlayer) userInfo:nil repeats:NO];
            
                       
        }
    }
    //call again if no valid result was returned
    else if(currentPlayer.isAi)
    {
        [self playerTurn:0 :0];
    }


}

-(void) nextPlayer{
    
    if(!currentPlayer)
    {
        currentPlayer=game.player1;
            }
    

    else if (currentPlayer==game.player1)
    {
        currentPlayer=game.player2;
        
        if(currentPlayer.isAi)
        {
            [self playerTurn:0 :0];
        }

    }
    
    else if (currentPlayer==game.player2)
    {
        currentPlayer=game.player1;
    }
    
    NSLog(@"Active Player: %i",currentPlayer.number);

}

-(void) alertInfo:(NSString*) message
{

    UIAlertView *alert = [[UIAlertView alloc] initWithTitle:@"Spiel beendet"
                                                   message:message
                                                  delegate:self
                                         cancelButtonTitle:@"Beenden"
                                         otherButtonTitles:@"Nochmal spielen", nil];
    [alert show];

}

-(void)alertView:(UIAlertView *)alertView didDismissWithButtonIndex:(NSInteger)buttonIndex
{
    NSLog(@"Button %i was pressed",buttonIndex);
    if(buttonIndex==1)
        
    {
        [game newGame];
        [self drawButtonColors];
        currentPlayer = game.player1;
                
    }

}


-(void) drawButtonColors
{
    UIView *mainElement = [self.view viewWithTag:11];
    int value;
    for (UIButton* b in mainElement.subviews) {
        
        for (int i = 0; i < [game.board count]; i++) {
            for (int j = 0; j<[[game.board objectAtIndex:i] count]; j++) {
               
                if(map[b.tag][0] == i && map[b.tag][1]==j)
                {
                NSNumber *n = [[game.board objectAtIndex:i] objectAtIndex:j];
                value = [n intValue];
                
                switch (value) {
                    case 0:
                        b.backgroundColor = [UIColor whiteColor];
                        break;
                    case 1:
                        b.backgroundColor = [UIColor redColor];
                        break;
                    case 2:
                        b.backgroundColor = [UIColor blueColor];
                        break;
                    default:
                        break;
                        }
                }
                
            }
        }
        
        
    }


}

@end
