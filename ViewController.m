//
//  ViewController.m
//  autolayout
//
//  Created by Ting-yu Yeh on 3/19/15.
//  Copyright (c) 2015 Ting-yu Yeh. All rights reserved.
//

#import "ViewController.h"
#import "CalculatorBrain.h"

@interface ViewController ()

@property (nonatomic) BOOL userIsInTheMiddleOfEnteringANumber;
@property (nonatomic, strong) CalculatorBrain *myBrain;
@property (nonatomic) BOOL theUserHasEnteredDot;

@end

@implementation ViewController

@synthesize display = _display;
@synthesize calculatedHistory = _calculatedHistory;

@synthesize userIsInTheMiddleOfEnteringANumber = _userIsInTheMiddleOfEnteringANumber;
@synthesize myBrain = _myBrain;
- (CalculatorBrain *) myBrain {
    if (!_myBrain){
        _myBrain = [[CalculatorBrain alloc] init];
    }
    return _myBrain;
}
@synthesize theUserHasEnteredDot = _theUserHasEnteredDot;

- (IBAction)digitEntered:(UIButton *)sender {
//    NSLog(@"this is pressed: %@", [sender currentTitle]);

    if (self.userIsInTheMiddleOfEnteringANumber){
        self.display.text = [self.display.text stringByAppendingString:sender.currentTitle];
    }else{
        self.display.text = sender.currentTitle;
        if (![sender.currentTitle isEqualToString:@"0"]){
            self.userIsInTheMiddleOfEnteringANumber = YES;
        }
        
    }



}

- (IBAction)dotPressed:(UIButton *)sender {
    
    if (self.userIsInTheMiddleOfEnteringANumber){
        if (!self.theUserHasEnteredDot){
            self.display.text = [self.display.text stringByAppendingString:sender.currentTitle];
            self.theUserHasEnteredDot = YES;
        }
    } else {
        self.display.text = @"0.";
        self.theUserHasEnteredDot = YES;
        self.userIsInTheMiddleOfEnteringANumber = YES;
    }
    

}


- (IBAction)operationPressed:(UIButton *)sender {
    
    self.userIsInTheMiddleOfEnteringANumber = NO;
    self.theUserHasEnteredDot = NO;
    double calculatedResult;
    calculatedResult = [self.myBrain enterOperation:sender.currentTitle numberInput:self.display.text];

//    NSLog(@"%@", sender.currentTitle);
//    NSLog(@"%@", self.display.text);
//    NSLog(@"%@", @(calculatedResult).stringValue);
    self.display.text = @(calculatedResult).stringValue;

    self.calculatedHistory.text = [self.myBrain updateHistory];
    
}

//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view, typically from a nib.
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}

@end
