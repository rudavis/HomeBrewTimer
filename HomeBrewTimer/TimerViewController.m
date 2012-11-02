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
@synthesize pauseButton = _pauseButton;
@synthesize cancelButton = _cancelButton;
@synthesize startButton = _startButton;
@synthesize timerTextField = _timerTextField;
@synthesize actionSheet = _actionSheet;

- (IBAction)selectTimerTextField:(id)sender {
    self.actionSheet = [[UIActionSheet alloc] initWithTitle:nil
                                                   delegate:nil
                                          cancelButtonTitle:nil
                                     destructiveButtonTitle:nil
                                          otherButtonTitles:nil];
    
    [self.actionSheet setActionSheetStyle:UIActionSheetStyleBlackTranslucent];
    
    UIDatePicker *theDatePicker = [[UIDatePicker alloc] initWithFrame:CGRectMake(0.0, 44.0, 0, 0)];
    theDatePicker.datePickerMode = UIDatePickerModeCountDownTimer;
    theDatePicker.countDownDuration = 3600;
    
    self.timerPicker = theDatePicker;
    [theDatePicker release];
    [self.timerPicker addTarget:self
     //action:nil
                      action:@selector(timerChanged:)
            forControlEvents:UIControlEventValueChanged];
    
    UIToolbar *pickerDateToolbar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 0, 320, 44)];
    pickerDateToolbar.barStyle = UIBarStyleBlackOpaque;
    [pickerDateToolbar sizeToFit];
    
    NSMutableArray *barItems = [[NSMutableArray alloc] init];
    
    UIBarButtonItem *barTitle = [[UIBarButtonItem alloc] initWithTitle:@"Set Boil Length" style:UIBarButtonItemStylePlain target:self action:nil];
    [barItems addObject:barTitle];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    [barItems addObject:flexSpace];

    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(DatePickerDoneClick)];
    [barItems addObject:doneBtn];
    
    [pickerDateToolbar setItems:barItems animated:YES];
    
    [self.actionSheet addSubview:pickerDateToolbar];
    [self.actionSheet addSubview:self.timerPicker];
    [self.actionSheet showInView:self.view];
    [self.actionSheet setBounds:CGRectMake(0, 0, 320, 464)];
}

-(void) DatePickerDoneClick {
    [self.actionSheet dismissWithClickedButtonIndex:0 animated:YES];
    NSInteger min;
    min = self.timerPicker.countDownDuration / 60;
    [self.timerTextField setText:[NSString stringWithFormat:@"%2d minutes",min]];
    
}

-(void) timerChanged:(id)sender {
    
}

-(BOOL)textFieldShouldBeginEditing:(UITextField *)textField {
    return NO;
}

- (IBAction)startTimer:(id)sender {
    
    //[_timerPicker setHidden:YES];
    [self fadeOut:_timerPicker withDuration:0.5 andWait:0.0];
    [_timerDisplay setHidden:NO];
    
    //[_stopButton setHidden:NO];
    //[_resumeButton setHidden:NO];
    //[_startButton setHidden:YES];
    [_pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
    [self fadeOut:_startButton withDuration:0.5 andWait:0.0];
    [self fadeIn:_pauseButton withDuration:0.5 andWait:0.5];
    [self fadeIn:_cancelButton withDuration:0.5 andWait:0.5];
    
    timerRunning = YES;
    
    timerSec = _timerPicker.countDownDuration;
    
    myTicker = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                                target: self
                                              selector: @selector(showActivity)
                                              userInfo: nil
                                               repeats: YES];
    
}

- (IBAction)cancelTimer:(id)sender {

    //[_timerPicker setHidden:NO];
    [self fadeIn:_timerPicker withDuration:0.5 andWait:0.5];
    [_timerDisplay setHidden:YES];
    
    //[_pauseButton setHidden:YES];
    //[_cancelButton setHidden:YES];
    //[_startButton setHidden:NO];
    [self fadeOut:_pauseButton withDuration:0.5 andWait:0.0];
    [self fadeOut:_cancelButton withDuration:0.5 andWait:0.0];
    [self fadeIn:_startButton withDuration:0.5 andWait:0.5];

    timerRunning = NO;
    
    [myTicker invalidate];
    myTicker = nil;
}

- (IBAction)pauseOrResumeTimer:(id)sender {
    if (timerRunning) {
        //Timer is running so we want to PAUSE
        //save the seconds remaining;
        //Change the text on Pause button to RESUME
        timerRunning = NO;
        [_pauseButton setTitle:@"Resume" forState:UIControlStateNormal];
        [myTicker invalidate];
        myTicker = nil;
    } else {
        //Timer is not running so the user want's to RESUME
        //Restart myTicker
        //Resume countdown
        //change Resume to PAUSE
        timerRunning = YES;
        [_pauseButton setTitle:@"Pause" forState:UIControlStateNormal];
        myTicker = [NSTimer scheduledTimerWithTimeInterval: 0.1
                                                    target: self
                                                  selector: @selector(showActivity)
                                                  userInfo: nil
                                                   repeats: YES];

    }
}

- (void)showActivity
{
    minRemaining = timerSec / 60;
    secRemaining = timerSec % 60;
    
    _timerDisplay.text = [NSString stringWithFormat:@"%02d:%02d",minRemaining, secRemaining];
    if (timerSec>0) {
        timerSec--;
    } else {
        [self cancelTimer:_cancelButton];
    }
}

- (void)fadeOut:(UIView *)viewToDissolve withDuration:(NSTimeInterval)duration andWait:(NSTimeInterval)wait
{
    [UIView beginAnimations: @"Fade Out" context:nil];
	[UIView setAnimationDelay:wait];
	[UIView setAnimationDuration:duration];
	viewToDissolve.alpha = 0.0;
	[UIView commitAnimations];
}

-(void)fadeIn:(UIView*)viewToFadeIn withDuration:(NSTimeInterval)duration
	  andWait:(NSTimeInterval)wait
{
	[UIView beginAnimations: @"Fade In" context:nil];
	[UIView setAnimationDelay:wait];
	[UIView setAnimationDuration:duration];
	viewToFadeIn.alpha = 1;
	[UIView commitAnimations];
}



- (void)viewDidLoad
{
    [super viewDidLoad];
    secRemaining = 0;
    minRemaining = 0;
    timerRunning = NO;

}

- (void)dealloc {
    
    self.actionSheet = nil;
    [super dealloc];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
