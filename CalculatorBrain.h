//
//  CalculatorBrain.h
//  autolayout
//
//  Created by Ting-yu Yeh on 3/19/15.
//  Copyright (c) 2015 Ting-yu Yeh. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface CalculatorBrain : NSObject



- (void)pushOperand:(double)operand;
- (double)popOperand;

- (double)enterOperation:(NSString *)operation numberInput:(NSString *)currentDisplay;

- (void)updateOperandHistory:(NSString *)buttonPressed;
- (NSString *)updateHistory;
@end
