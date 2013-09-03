//
//  NZViewController.m
//  Num0
//
//  Created by Paul Cezanne on 9/3/13.
//  Copyright (c) 2013 Paul Cezanne. All rights reserved.
//

#import "NZViewController.h"
#import "NZNumZero.h"


@interface NZViewController ()
@end

@implementation NZViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    self.numZeroEngine = [[NZNumZero alloc] init];
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)num0Pressed:(id)sender
{
    // using GCD slows the computations down but the UI stays alive
    //
    // 123,456,789 - 1.651 seconds
    // 1,234,567,890 - 16.619 seconds
    //
    // with GCD
    // 123,456,789 - 2.2 seconds
    // 1,234,567,890 - 25.80 seconds
    //
    // with GCD and faster class
    // 123456789 - 0.774 seconds
    // 1,234,567,890 - 7.5 seconds
    //
    
    [_inputNumber resignFirstResponder];
    [_answerLabel setText:@"calculating..."];
    
    double startTime = CACurrentMediaTime();
    unsigned long long input = [[_inputNumber text] longLongValue];
    
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        
        int count = [_numZeroEngine zeroCount:input];
        
         dispatch_async(dispatch_get_main_queue(), ^{
             
            double endTime = CACurrentMediaTime();
            double seconds = endTime - startTime;

            [_answerLabel setText:[NSString stringWithFormat:@"%d (%3.4f seconds)", count, seconds]];
        });
    });

}

- (BOOL)textFieldShouldReturn:(UITextField *)textField {
    [self num0Pressed:nil];
    return YES;
}

@end
