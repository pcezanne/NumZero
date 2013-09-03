//
//  NZNumZero.h
//  Num0
//
//  Created by Paul Cezanne on 9/3/13.
//  Copyright (c) 2013 Paul Cezanne. All rights reserved.
//

#import <Foundation/Foundation.h>

// NZNumZero is the math engine for computing the number of trailing zeros
// at the end of n factorial
//

@interface NZNumZero : NSObject

- (long long) zeroCount:(unsigned long long)n;

@end
