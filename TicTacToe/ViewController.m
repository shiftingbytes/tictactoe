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
@synthesize color;
//@synthesize view;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.game = [[Game alloc]init];
    [self nextPlayer];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(IBAction)fieldPressed:(id)sender
{
    if (!game.finish)
    {
        UIButton *button = sender;
        
        int x; int y;
        switch (button.tag) {
            case 0:
                x=2;y=0;
                break;
            case 1:
                x=2;y=1;
                break;
            case 2:
                x=2;y=2;
                break;
            case 3:
                x=1;y=0;
                break;
            case 4:
                x=1;y=1;
                break;
            case 5:
                x=1;y=2;
                break;
            case 6:
                x=0;y=0;
                break;
            case 7:
                x=0;y=1;
                break;
            case 8:
                x=0;y=2;
                break;
            default:
                break;
        }
        if([currentPlayer playerTurn:x :y ])
        {
            button.backgroundColor = color;
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
                            
            [self nextPlayer];
            }
        }
        

    }
    
}

-(void) nextPlayer{
    
    if(!currentPlayer)
    {
        currentPlayer=game.player1;
        self.color=[UIColor redColor];
    }
    

    else if (currentPlayer==game.player1)
    {
        currentPlayer=game.player2;
        self.color=[UIColor blueColor];
    }
    
    else if (currentPlayer==game.player2)
    {
        currentPlayer=game.player1;
        self.color=[UIColor redColor];
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
        [game resetBoard];
        [self resetColors];
        game.finish = NO;
        currentPlayer.hasWon = NO;
        game.moveCounter = 0;
        
        
    }

}

-(void)resetColors
{
    UIView *mainElement = [self.view viewWithTag:11];
    
    for (UIButton* button in mainElement.subviews) {
        button.backgroundColor = [UIColor whiteColor];
    }

}


@end
