//
//  ViewController.h
//  TicTacToe
//
//  Created by Markus Rührmair on 28.12.12.
//  Copyright (c) 2012 shiftingbytes. All rights reserved.
//

#import <UIKit/UIKit.h>
@class Player;
@class Game;

@interface ViewController : UIViewController <UIAlertViewDelegate>
@property (nonatomic,strong) Player *currentPlayer;
@property (nonatomic,strong) Game *game;



-(IBAction)fieldPressed:(id)sender;

-(void) nextPlayer;
-(void) playerTurn:(int)x : (int) y;
-(void) alertInfo:(NSString*) message;
-(void) drawButtonColors;
@end
