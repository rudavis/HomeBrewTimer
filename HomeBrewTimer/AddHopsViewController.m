//
//  AddHopsViewController.m
//  HomeBrewTimer
//
//  Created by Russ Davis on 11/2/12.
//  Copyright (c) 2012 RTB. All rights reserved.
//

#import "AddHopsViewController.h"

@interface AddHopsViewController ()

@end

@implementation AddHopsViewController

@synthesize delegate = _delegate;
@synthesize hopName = _hopName;
@synthesize hopWeight = _hopWeight;
@synthesize inputAccView = _inputAccView;
@synthesize btnDone = _btnDone;
@synthesize btnNext = _btnNext;
@synthesize btnPrev = _btnPrev;
@synthesize activeTxtField = _activeTxtField;


- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view.
    _hopTime.countDownDuration = 2700;
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)dealloc {
    [_hopName release];
    [_hopWeight release];
    [_hopTime release];
    [super dealloc];
}
- (IBAction)done:(id)sender {
    [self.delegate addHopsViewControllerDidSave:self];
}

- (IBAction)cancel:(id)sender {
    [self.delegate addHopsViewControllerDidCancel:self];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    [self createInputAccessoryView];
    activeTxtField = textField;
    [textField setInputAccessoryView:inputAccView];
}

- (void) createInputAccessoryView
{
    inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10,0,310,40)];

    UIToolbar *keyboardToolbar = [[[UIToolbar alloc] init] autorelease];
    keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
    [keyboardToolbar sizeToFit];
    
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Previous", @"Next", nil]];
    [segmentControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [segmentControl addTarget:self action:@selector(nextPrevious:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *nextPrevButton = [[UIBarButtonItem alloc] initWithCustomView:segmentControl];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard)];
    
    NSArray *barItems = [NSArray arrayWithObjects:nextPrevButton, flexSpace, doneBtn, nil];
    [segmentControl release];
    [nextPrevButton release];
    [flexSpace release];
    [doneBtn release];
    [keyboardToolbar setItems:barItems];
    
    [inputAccView addSubview:keyboardToolbar];
    
}

- (void) nextPrevious:(id) sender
//TODO:  switch focus back and forth...
{
    
}

- (void) resignKeyboard
{
    [activeTxtField resignFirstResponder];
}



@end
