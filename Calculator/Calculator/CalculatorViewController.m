//
//  CalculatorViewController.m
//  Calculator
//
//  Created by danielzimpel on 5/31/13.
//  Copyright (c) 2013 Cwi Software. All rights reserved.
//

#import "CalculatorViewController.h"
#import "CalculatorBrain.h"

@interface CalculatorViewController ()

@property (nonatomic) BOOL userAddingNumber;
@property (nonatomic, strong) CalculatorBrain *brain;

@end

@implementation CalculatorViewController

@synthesize display = _display;
@synthesize userAddingNumber = _userAddingNumber;
@synthesize brain = _brain;

- (CalculatorBrain *)brain
{
    if(!_brain) _brain = [[CalculatorBrain alloc] init];
        return _brain;
}


- (IBAction)digitPressed:(UIButton *)sender {
    
    if(self.userAddingNumber)
    {
        self.display.text = [self.display.text stringByAppendingString: sender.currentTitle];
    }
    else
    {
        self.display.text = sender.currentTitle;
        self.userAddingNumber = YES;
    }

}

- (IBAction)enterPressed {
    [self.brain pushOperand:[self.display.text doubleValue]];
    self.userAddingNumber = NO;
}

- (IBAction)operationPressed:(UIButton *)sender {
    if(self.userAddingNumber) [self enterPressed];
    double result = [self.brain performOperation:sender.currentTitle];
    self.display.text = [NSString stringWithFormat:@"%g", result];
}

@end
