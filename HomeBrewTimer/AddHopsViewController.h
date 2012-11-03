//
//  AddHopsViewController.h
//  HomeBrewTimer
//
//  Created by Russ Davis on 11/2/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import <UIKit/UIKit.h>

@class AddHopsViewController;

@protocol AddHopsViewControllerDelegate <NSObject>
- (void)addHopsViewControllerDidCancel:(AddHopsViewController *) controller;
- (void)addHopsViewControllerDidSave:(AddHopsViewController *) controller;
@end


@interface AddHopsViewController : UIViewController{
    UITextField *hopName;
    UITextField *hopWeight;
    UITextField *hopTimeTextField;
    UITextField *activeTxtField;
    UIView *inputAccView;
    UISegmentedControl *segmentedControl;
    UIButton *btnDone;
    UIButton *btnNext;
    UIButton *btnPrev;
}

@property (strong,nonatomic) id <AddHopsViewControllerDelegate> delegate;
@property (retain, nonatomic) IBOutlet UITextField *hopName;
@property (retain, nonatomic) IBOutlet UITextField *hopWeight;
@property (retain, nonatomic) IBOutlet UITextField *hopTimeTextField;
@property (nonatomic, retain) UITextField *activeTxtField;
@property (retain, nonatomic) IBOutlet UIDatePicker *hopTime;
@property (nonatomic, retain) UIView *inputAccView;
@property (nonatomic, retain) UIButton *btnDone;
@property (nonatomic, retain) UIButton *btnNext;
@property (nonatomic, retain) UIButton *btnPrev;
@property (nonatomic, retain) UISegmentedControl *segmentedControl;


- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;

@end
