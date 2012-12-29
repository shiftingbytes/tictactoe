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

@interface ViewController : UIViewController
@property (nonatomic,strong) Player *currentPlayer;
@property (nonatomic,strong) Game *game;
@property (nonatomic,strong) UIColor *color;

-(IBAction)fieldPressed:(id)sender;

-(void) nextPlayer;

@end
