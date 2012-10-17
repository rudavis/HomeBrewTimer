//
//  TimerViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 10/16/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface TimerViewController : UIViewController

@property (strong, nonatomic) IBOutlet UIDatePicker *timerPicker;


- (IBAction)startTimer:(id)sender;

@end
