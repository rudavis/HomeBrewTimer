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
@synthesize segmentedControl = _segmentedControl;
@synthesize hop = _hop;


- (IBAction)save:(id)sender {
    
    _hop = [[Hop alloc]initWithName:_hopName.text weight:_hopWeight.text addTime:([[NSNumber alloc]initWithDouble:(_hopTime.countDownDuration / 60)])];
    
    [self.delegate addHopsViewController:self didAddHop:_hop];
}

- (IBAction)cancel:(id)sender {
    [self.delegate addHopsViewControllerDidCancel:self];
}

-(void)textFieldDidBeginEditing:(UITextField *)textField {
    _activeTxtField = textField;
    [self createInputAccessoryView];
    [textField setInputAccessoryView:inputAccView];
}

- (void) createInputAccessoryView
{
    inputAccView = [[UIView alloc] initWithFrame:CGRectMake(10,0,310,42)];

    UIToolbar *keyboardToolbar = [[UIToolbar alloc] init];
    keyboardToolbar.barStyle = UIBarStyleBlackTranslucent;
    [keyboardToolbar sizeToFit];
    
    _segmentedControl = [[UISegmentedControl alloc] initWithItems:[NSArray arrayWithObjects:@"Previous", @"Next", nil]];
    [_segmentedControl setSegmentedControlStyle:UISegmentedControlStyleBar];
    [_segmentedControl addTarget:self action:@selector(nextPrevious:) forControlEvents:UIControlEventValueChanged];
    
    UIBarButtonItem *nextPrevButton = [[UIBarButtonItem alloc] initWithCustomView:_segmentedControl];
    
    UIBarButtonItem *flexSpace = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    UIBarButtonItem *doneBtn = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemDone target:self action:@selector(resignKeyboard)];
    
    NSArray *barItems = [NSArray arrayWithObjects:nextPrevButton, flexSpace, doneBtn, nil];
    [keyboardToolbar setItems:barItems];
    
    [inputAccView addSubview:keyboardToolbar];
    
}

- (void) nextPrevious:(id) sender
{
    switch(_activeTxtField.tag) {
        case 1:
            //Hop Name
            if (_segmentedControl.selectedSegmentIndex == 1){
                [_hopWeight becomeFirstResponder];
                _activeTxtField = _hopWeight;
            }
            break;
        case 2:
            //Hop Weight
            if (_segmentedControl.selectedSegmentIndex == 0){
                [_hopName becomeFirstResponder];
                _activeTxtField = _hopName;
            }
        default:
            break;
    }
}

- (void) resignKeyboard
{
    [_activeTxtField resignFirstResponder];
}

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



@end
