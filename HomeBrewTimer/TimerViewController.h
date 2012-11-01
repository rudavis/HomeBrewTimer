//
//  TimerViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/16/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AbstractActionSheetPicker;
@interface TimerViewController : UIViewController <UITextFieldDelegate>
{
    NSTimer *myTicker;
    NSInteger timerSec;
    NSInteger timerSec2;
    NSInteger minRemaining;
    NSInteger secRemaining;
    BOOL timerRunning;
}

@property (strong, nonatomic) IBOutlet UITextField *timerTextField;
@property (strong, nonatomic) NSDate *selectedDate;
@property (strong, nonatomic) IBOutlet UIDatePicker *timerPicker;
@property (strong, nonatomic) IBOutlet UILabel *timerDisplay;
@property (strong, nonatomic) IBOutlet UIButton *pauseButton;
@property (strong, nonatomic) IBOutlet UIButton *cancelButton;
@property (strong, nonatomic) IBOutlet UIButton *startButton;
@property (nonatomic, retain) UIActionSheet *actionSheet;



- (IBAction)selectTimerTextField:(id)sender;
- (void)datePickerDoneClick;
- (IBAction)startTimer:(id)sender;
- (IBAction)cancelTimer:(id)sender;
- (IBAction)pauseOrResumeTimer:(id)sender;
- (void)showActivity;
- (void)fadeOut:(UIView *)viewToDissolve withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait;
- (void)fadeIn:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait;

@end
