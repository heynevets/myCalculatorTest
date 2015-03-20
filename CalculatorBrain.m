//
//  CalculatorBrain.m
//  autolayout
//
//  Created by Ting-yu Yeh on 3/19/15.
//  Copyright (c) 2015 Ting-yu Yeh. All rights reserved.
//

#import "CalculatorBrain.h"

@interface CalculatorBrain()

@property (nonatomic, strong) NSMutableArray *allButtonPressedUntilNow;

@property (nonatomic, strong) NSMutableArray *operandStack;

@property (nonatomic, strong) NSString *lastOperation;


@end

@implementation CalculatorBrain

@synthesize allButtonPressedUntilNow = _allButtonPressedUntilNow;
- (NSMutableArray *)allButtonPressedUntilNow {
    if (!_allButtonPressedUntilNow){
        _allButtonPressedUntilNow = [[NSMutableArray alloc] init];
//        [_allButtonPressedUntilNow addObject:@"="];
    }

    
    
    
    
    
    return _allButtonPressedUntilNow;
    
}
- (void)setAllButtonPressedUntilNow:(NSMutableArray *)allButtonPressedUntilNow{
    _allButtonPressedUntilNow = allButtonPressedUntilNow;
    
}

@synthesize operandStack = _operandStack;
- (NSMutableArray *)operandStack{
    
    if (!_operandStack) _operandStack = [[NSMutableArray alloc] init];
    return _operandStack;
}


@synthesize lastOperation = _lastOperation;



- (void)pushOperand:(double)operand{
    NSNumber *operandObject = [NSNumber numberWithDouble:operand];
    
    [self.operandStack addObject:operandObject];
    
}

- (double)popOperand{
    double result = [[self.operandStack lastObject] doubleValue];
    [self.operandStack removeLastObject];
    return result;
}


- (double)enterOperation:(NSString *)operation numberInput:(NSString *)currentDisplay{

    double result = currentDisplay.doubleValue;
    [self pushOperand:currentDisplay.doubleValue];
//    
//    NSLog(@"%@", @(result).stringValue);
//    NSLog(@"%@", currentDisplay);
    [self.allButtonPressedUntilNow addObject:[[self.operandStack lastObject] stringValue]];
    
    if (self.lastOperation || [operation isEqualToString:@"Enter"]) {
        //perform operation

        
        if ([self.lastOperation isEqualToString:@"+"]){
            result = [self popOperand] + [self popOperand];
            NSLog(@"%@", currentDisplay);
        } else if ([self.lastOperation isEqualToString:@"-"]){
            double temp = [self popOperand];
            result = [self popOperand] - temp;
            NSLog(@"%@", currentDisplay);
        } else if ([self.lastOperation isEqualToString:@"*"]){
            result = [self popOperand] * [self popOperand];
            NSLog(@"%@", currentDisplay);
        } else if ([self.lastOperation isEqualToString:@"/"]){
            double temp = [self popOperand];
            result = [self popOperand] / temp;
            NSLog(@"%@", currentDisplay);
        }

        [self pushOperand:result];
    }

    if ([operation isEqualToString:@"Enter"]){
        self.lastOperation = nil;
    }else{
        self.lastOperation = operation;
    }
    

    [self.allButtonPressedUntilNow addObject:operation];
    
    return result;
}




- (void)updateOperandHistory:(NSString *)displayValue{
    
    [self.allButtonPressedUntilNow addObject:displayValue];
    
}

- (NSString *)updateHistory{
    NSMutableString *tempstring = [[NSMutableString alloc] init];
    for (int i = 0; i < [self.allButtonPressedUntilNow count]; i++){
        [tempstring appendString:self.allButtonPressedUntilNow[i]];
        [tempstring appendString:@" "];
    }
    [tempstring appendString:@"="];
    return tempstring;
}

@end

