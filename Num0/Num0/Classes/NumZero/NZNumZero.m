//
//  NZNumZero.m
//  Num0
//
//  Created by Paul Cezanne on 9/3/13.
//  Copyright (c) 2013 Paul Cezanne. All rights reserved.
//

#import "NZNumZero.h"

@interface NZNumZero ()
- (int) numberOfFives:(int) n;

@end


@implementation NZNumZero

// return the number of zeros at the trailing end of n factorial
//
// the number of zeros is the sum of the number of fives in the factors of
// 0..n
//
// we can get clever with the interation by counting by fives, not ones.
// we can ignore the twos because for every five there is at least one two coming
// from an even number less than n.
//

- (long long) zeroCount:(unsigned long long)n;
{
    long long  count = 0;
    
    long long newN = n - (n%5);
    
    for (long long  i = 0; i<=newN; i += 5) {
        int fives = [self numberOfFives:i]; 
        count += fives;
    }

    return count;
}

// internal method to return the number of factors that are 5 in n
- (int) numberOfFives:(int) n
{
    int fiveCount = 0;
    
    if (n < 5) {
        return 0;
    }
    
    int demoninator = n%5;
    
    if (demoninator == 0) {
        fiveCount++;
        int numerator = n/5;
        fiveCount += [self numberOfFives:numerator];
    }
    
    return fiveCount;
}
@end
