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
@property (strong, nonatomic) IBOutlet UITextField *hopName;
@property (strong, nonatomic) IBOutlet UITextField *hopWeight;
@property (strong, nonatomic) IBOutlet UITextField *hopTimeTextField;
@property (nonatomic, strong) UITextField *activeTxtField;
@property (strong, nonatomic) IBOutlet UIDatePicker *hopTime;
@property (nonatomic, strong) UIView *inputAccView;
@property (nonatomic, strong) UIButton *btnDone;
@property (nonatomic, strong) UIButton *btnNext;
@property (nonatomic, strong) UIButton *btnPrev;
@property (nonatomic, strong) UISegmentedControl *segmentedControl;


- (IBAction)done:(id)sender;
- (IBAction)cancel:(id)sender;

@end
