//
//  NZViewController.h
//  Num0
//
//  Created by Paul Cezanne on 9/3/13.
//  Copyright (c) 2013 Paul Cezanne. All rights reserved.
//

#import <UIKit/UIKit.h>

@class NZNumZero;


@interface NZViewController : UIViewController <UITextFieldDelegate>

@property (weak, nonatomic) IBOutlet UITextField *inputNumber;
@property (weak, nonatomic) IBOutlet UIButton *num0Button;
@property (weak, nonatomic) IBOutlet UILabel *answerLabel;


@property (strong, nonatomic) NZNumZero *numZeroEngine;

- (IBAction)num0Pressed:(id)sender;
@end
