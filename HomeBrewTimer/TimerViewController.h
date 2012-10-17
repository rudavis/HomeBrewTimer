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
@property (strong, nonatomic) IBOutlet UIButton *pauseButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *startButton;

- (IBAction)startTimer:(id)sender;
- (IBAction)cancelTimer:(id)sender;
- (IBAction)pauseOrResumeTimer:(id)sender;
- (void)showActivity;
- (void)fadeOut:(UIView *)viewToDissolve withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait;
- (void)fadeIn:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait;

@end
