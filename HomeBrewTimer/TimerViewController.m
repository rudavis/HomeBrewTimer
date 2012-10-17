//
//  TimerViewController.m
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/16/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import "TimerViewController.h"

@interface TimerViewController ()

@end

@implementation TimerViewController

@synthesize timerPicker = _timerPicker;
@synthesize timerDisplay = _timerDisplay;
@synthesize stopButton = _stopButton;
@synthesize resumeButton = _resumeButton;
@synthesize startButton = _startButton;

- (IBAction)startTimer:(id)sender {
    
    [_timerPicker setHidden:YES];
    [_timerDisplay setHidden:NO];
    
    [_stopButton setHidden:NO];
    [_resumeButton setHidden:NO];
    [_startButton setHidden:YES];
    timerRunning = YES;
    
    timerSec = _timerPicker.countDownDuration;
    
    myTicker = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                                target: self
                                              selector: @selector(showActivity)
                                              userInfo: nil
                                               repeats: YES];
    
}

- (IBAction)stopTimer:(id)sender {

    [_timerPicker setHidden:NO];
    [_timerDisplay setHidden:YES];
    
    [_stopButton setHidden:YES];
    [_resumeButton setHidden:YES];
    [_startButton setHidden:NO];
    timerRunning = NO;
    
    [myTicker invalidate];
    myTicker = nil;
}

- (void)showActivity
{
    minRemaining = timerSec / 60;
    secRemaining = timerSec % 60;
    
    _timerDisplay.text = [NSString stringWithFormat:@"%02d:%02d",minRemaining, secRemaining];
    if (timerSec>0) {
        timerSec--;
    } else {
        [self stopTimer:_stopButton];
    }
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    secRemaining = 0;
    minRemaining = 0;
    timerRunning = NO;
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
