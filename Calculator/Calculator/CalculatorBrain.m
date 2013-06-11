//
//  CalculatorBrain.m
//  Calculator
//
//  Created by danielzimpel on 5/31/13.
//  Copyright (c) 2013 Cwi Software. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()
@property (nonatomic, strong) NSMutableArray *programStack;
@end

@implementation CalculatorBrain;

@synthesize programStack = _programStack;
@synthesize program;

- (NSMutableArray *)programStack
{
    if(_programStack == nil) _programStack = [[NSMutableArray alloc] init];
    return _programStack;
}

- (void) pushOperand:(double)operand
{
    [self.programStack addObject:[NSNumber numberWithDouble:operand]];
}

- (double) performOperation:(NSString *)operation
{
    [self.programStack addObject:operation];
    return [CalculatorBrain runProgram:self.program];
}

- (id) program
{
    return [self.programStack copy];
}

+ (NSString *) descriptionOfProgram:(id)program
{
    return @"Description";
}

+ (double) popOperandOfStack:(NSMutableArray *)stack
{
    double result = 0;
    
    id topOfStack = [stack lastObject];
    if(topOfStack) [stack removeLastObject];
    
    if ([topOfStack isKindOfClass:[NSNumber class]])
    {
        result = [topOfStack doubleValue];
    }
    else if ([topOfStack isKindOfClass:[NSString class]])
    {
        NSString *operation = topOfStack;
        if([operation isEqualToString:@"+"])
        {
            result = [self popOperandOfStack:stack] + [self popOperandOfStack:stack];
        }
        else if([operation isEqualToString:@"-"])
        {
            result = [self popOperandOfStack:stack] - [self popOperandOfStack:stack];
        }
        else if([operation isEqualToString:@"*"])
        {
            result = [self popOperandOfStack:stack] * [self popOperandOfStack:stack];
        }
        else if([operation isEqualToString:@"/"])
        {
            double divisor = [self popOperandOfStack:stack];
            if(divisor) result = [self popOperandOfStack:stack] / divisor;
        }
 
    }
    
    return result;
}

+ (double) runProgram:(id)program
{
    NSMutableArray *stack;
    if ([program isKindOfClass:[NSArray class]]) {
        stack = [program mutableCopy];
    }
    return [self popOperandOfStack:stack];
}

@end
