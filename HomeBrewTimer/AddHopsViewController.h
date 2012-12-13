//
//  AddHopsViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 11/2/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Hop.h"

@class AddHopsViewController;

@protocol AddHopsViewControllerDelegate <NSObject>
- (void)addHopsViewControllerDidCancel:(AddHopsViewController *) controller;
- (void)addHopsViewController:(AddHopsViewController *) controller didAddHop:(Hop *)hop;
@end


@interface AddHopsViewController : UIViewController{
    UITextField *hopName;
    UITextField *hopWeight;
    UITextField *activeTxtField;
    UIView *inputAccView;
    UISegmentedControl *segmentedControl;
    UIButton *btnDone;
    UIButton *btnNext;
    UIButton *btnPrev;
}

@property (strong,nonatomic) id <AddHopsViewControllerDelegate> delegate;
@property (strong, nonatomic) IBOutlet UITextField *hopName;
@property (strong, nonatomic) IBOutlet UITextField *hopWeight;
@property (nonatomic, strong) UITextField *activeTxtField;
@property (strong, nonatomic) IBOutlet UIDatePicker *hopTime;
@property (nonatomic, strong) UIView *inputAccView;
@property (nonatomic, strong) UIButton *btnDone;
@property (nonatomic, strong) UIButton *btnNext;
@property (nonatomic, strong) UIButton *btnPrev;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;
@property (nonatomic, strong) Hop *hop;


- (IBAction)save:(id)sender;
- (IBAction)cancel:(id)sender;

@end
