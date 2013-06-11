//
//  CalculatorBrain.h
//  Calculator
//
//  Created by danielzimpel on 5/31/13.
//  Copyright (c) 2013 Cwi Software. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject

- (void) pushOperand:(double)operand;
- (double) performOperation:(NSString *)operation;

@property (readonly) id program;

+ (double)runProgram:(id)program;
+ (NSString *)descriptionOfProgram:(id)program;

@end
