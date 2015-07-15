//
//  ViewController.h
//  2048
//
//  Created by Chappy Asel on 3/21/14.
//  Copyright (c) 2014 CD. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ViewController : UIViewController <UIGestureRecognizerDelegate>

@property (weak, nonatomic) IBOutlet UILabel *Tile00;
@property (weak, nonatomic) IBOutlet UILabel *Tile01;
@property (weak, nonatomic) IBOutlet UILabel *Tile02;
@property (weak, nonatomic) IBOutlet UILabel *Tile03;
@property (weak, nonatomic) IBOutlet UILabel *Tile10;
@property (weak, nonatomic) IBOutlet UILabel *Tile11;
@property (weak, nonatomic) IBOutlet UILabel *Tile12;
@property (weak, nonatomic) IBOutlet UILabel *Tile13;
@property (weak, nonatomic) IBOutlet UILabel *Tile20;
@property (weak, nonatomic) IBOutlet UILabel *Tile21;
@property (weak, nonatomic) IBOutlet UILabel *Tile22;
@property (weak, nonatomic) IBOutlet UILabel *Tile23;
@property (weak, nonatomic) IBOutlet UILabel *Tile30;
@property (weak, nonatomic) IBOutlet UILabel *Tile31;
@property (weak, nonatomic) IBOutlet UILabel *Tile32;
@property (weak, nonatomic) IBOutlet UILabel *Tile33;

@property (weak, nonatomic) IBOutlet UILabel *GameBG;
@property (weak, nonatomic) IBOutlet UILabel *ScoreBG;
@property (weak, nonatomic) IBOutlet UILabel *HighscoreBG;
@property (weak, nonatomic) IBOutlet UIButton *RestartButton;


@property (weak, nonatomic) IBOutlet UILabel *ScoreDisplay;
@property (weak, nonatomic) IBOutlet UILabel *HighscoreDisplay;

@end
