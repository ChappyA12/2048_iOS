//
//  ViewController.m
//  2048
//
//  Created by Chappy Asel on 3/21/14.
//  Copyright (c) 2014 CD. All rights reserved.
//

#import "ViewController.h"
#import "2048Board.h"
#import "BoardController.h"

@interface ViewController ()
@property _2048Board *board;
@property BoardController *boardController;
@end

@implementation ViewController

NSArray *tiles;
int highscore;

- (void)viewDidLoad {
    [super viewDidLoad];
    self.boardController = [[BoardController alloc] init];
    self.board = [[_2048Board alloc] init];
    [self.board initTurnMovements]; //gets array for movements ready
    NSArray *row1 = [[NSArray alloc] initWithObjects:_Tile00,_Tile01,_Tile02,_Tile03, nil];
    NSArray *row2 = [[NSArray alloc] initWithObjects:_Tile10,_Tile11,_Tile12,_Tile13, nil];
    NSArray *row3 = [[NSArray alloc] initWithObjects:_Tile20,_Tile21,_Tile22,_Tile23, nil];
    NSArray *row4 = [[NSArray alloc] initWithObjects:_Tile30,_Tile31,_Tile32,_Tile33, nil];
    tiles = [[NSArray alloc] initWithObjects:row1,row2,row3,row4, nil];
    [self.boardController startGameWithBoard:self.board];
    [self.board printBoard];
    for (int row = 0; row < 4; row++) {
        for (int column = 0; column < 4; column++) {
            [tiles[row][column] layer].cornerRadius = 3;
            [tiles[row][column] setBackgroundColor:[UIColor colorWithRed:205.0/255 green:193.0/255 blue:181.0/255 alpha:1]];
        }
    }
    self.view.backgroundColor = [UIColor colorWithRed:0.98 green:0.973 blue:0.937 alpha:1] /*#faf8ef*/;
    _ScoreBG.layer.cornerRadius = 3;
    _HighscoreBG.layer.cornerRadius = 3;
    _RestartButton.layer.cornerRadius = 3;
}

- (void)viewDidAppear:(BOOL)animated{
    [self displayBoard];
}

- (IBAction)SwipeRight:(UISwipeGestureRecognizer *)sender {
    NSLog(@"SWIPE RIGHT");
    self.board = [self.boardController swipeRightWithBoard:self.board];
    [self.board printBoard];
    [self displayBoard];
}

- (IBAction)SwipeLeft:(UISwipeGestureRecognizer *)sender {
    NSLog(@"SWIPE LEFT");
    self.board = [self.boardController swipeLeftWithBoard:self.board];
    [self.board printBoard];
    [self displayBoard];
}

- (IBAction)SwipeUp:(UISwipeGestureRecognizer *)sender {
    NSLog(@"SWIPE UP");
    self.board = [self.boardController swipeUpWithBoard:self.board];
    [self.board printBoard];
    [self displayBoard];
}

- (IBAction)SwipeDown:(UISwipeGestureRecognizer *)sender {
    NSLog(@"SWIPE DOWN");
    self.board = [self.boardController swipeDownWithBoard:self.board];
    [self.board printBoard];
    [self displayBoard];
}

- (IBAction)RestartButtonPressed:(UIButton *)sender {
    [self.board clearBoard];
    [self.boardController startGameWithBoard:self.board];
    [self displayBoard];
}

- (void)displayBoard {
    NSArray *board = [self.board getBoardAsArray];
    NSArray *turnMovements = [self.board getTurnMovements];
    for (UIView *subview in [self.view subviews]) { //removes all the tiles
        if (subview.tag == 1) [subview removeFromSuperview];
    }
    for (NSString *turn in turnMovements){
        NSArray *turnArray = [turn componentsSeparatedByString:@" "];
        NSLog(@"%@",turnArray);
        UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(0, 0, 70, 70)]; //creates the tiles
        label.font = [UIFont boldSystemFontOfSize:40];
        label.textAlignment = NSTextAlignmentCenter;
        label.layer.cornerRadius = 3;
        label.layer.masksToBounds = YES;
        label.tag = 1;
        int tileNumber;
        if ([turnArray[0] isEqualToString:@"ADDED"]){ //tile was added
            [label setCenter:[tiles[[turnArray[1] integerValue]][[turnArray[2] integerValue]] center]];
            tileNumber = [self.board getValueAtRow:[turnArray[1] integerValue] Column:[turnArray[2] integerValue]];
            label.alpha = 0;
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            [UIView setAnimationDelay:0.1];
            label.alpha = 1;
            [UIView commitAnimations];
        }
        else if ([turnArray[0] isEqualToString:@"RETAINED"]){ //tile didnt move
            [label setCenter:[tiles[[turnArray[1] integerValue]][[turnArray[2] integerValue]] center]];
            tileNumber = [self.board getValueAtRow:[turnArray[1] integerValue] Column:[turnArray[2] integerValue]];
        }
        else if ([turnArray[0] isEqualToString:@"MOVED"]){ //tile moved to new spot
            [label setCenter:[tiles[[turnArray[1] integerValue]][[turnArray[2] integerValue]] center]];
            tileNumber = [self.board getValueAtRow:[turnArray[3] integerValue] Column:[turnArray[4] integerValue]];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            [label setCenter:[tiles[[turnArray[3] integerValue]][[turnArray[4] integerValue]] center]];
            [UIView commitAnimations];
        }
        else{ //tile was doubled
            [label setCenter:[tiles[[turnArray[3] integerValue]][[turnArray[4] integerValue]] center]];
            tileNumber = [self.board getValueAtRow:[turnArray[1] integerValue] Column:[turnArray[2] integerValue]];
            [UIView beginAnimations:nil context:nil];
            [UIView setAnimationDuration:0.2];
            [label setCenter:[tiles[[turnArray[1] integerValue]][[turnArray[2] integerValue]] center]];
            [UIView commitAnimations];
        }
        label.text = [NSString stringWithFormat:@"%d",tileNumber];
        if (tileNumber == 2 || tileNumber == 4) {
            label.textColor = [UIColor colorWithRed:0.467 green:0.431 blue:0.396 alpha:1]; /*#776e65*/
        }
        else label.textColor = [UIColor colorWithRed:0.976 green:0.965 blue:0.949 alpha:1]; /*#f9f6f2*/
        UIColor *color;
        if (tileNumber == 2) color = [UIColor colorWithRed:0.933 green:0.894 blue:0.855 alpha:1] /*#eee4da*/;
        else if (tileNumber == 4) color = [UIColor colorWithRed:0.929 green:0.878 blue:0.784 alpha:1] /*#ede0c8*/;
        else if (tileNumber == 8) color = [UIColor colorWithRed:0.949 green:0.694 blue:0.475 alpha:1] /*#f2b179*/;
        else if (tileNumber == 16) color = [UIColor colorWithRed:0.961 green:0.584 blue:0.388 alpha:1] /*#f59563*/;
        else if (tileNumber == 32) color = [UIColor colorWithRed:0.965 green:0.486 blue:0.373 alpha:1] /*#f67c5f*/;
        else if (tileNumber == 64) color = [UIColor colorWithRed:0.965 green:0.369 blue:0.231 alpha:1] /*#f65e3b*/;
        label.backgroundColor = color;
        [self.view addSubview:label];
    }
    _ScoreDisplay.text = [NSString stringWithFormat:@"%d",[self.board scoreOfBoard]];
    if ([self.board scoreOfBoard]>highscore) highscore = [self.board scoreOfBoard];
    _HighscoreDisplay.text = [NSString stringWithFormat:@"%d",highscore];
    [self.board reloadTurnMovements]; //erases all moves, ready for next turn
}

@end
