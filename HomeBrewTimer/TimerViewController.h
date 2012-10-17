//
//  TimerViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/16/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController
{
    NSTimer *myTicker;
    NSInteger timerSec;
    NSInteger minRemaining;
    NSInteger secRemaining;
    BOOL timerRunning;
}

@property (strong, nonatomic) IBOutlet UIDatePicker *timerPicker;
@property (strong, nonatomic) IBOutlet UILabel *timerDisplay;
@property (strong, nonatomic) IBOutlet UIButton *stopButton;
@property (strong, nonatomic) IBOutlet UIButton *resumeButton;
@property (strong, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startTimer:(id)sender;
- (IBAction)stopTimer:(id)sender;
- (void)showActivity;


@end
