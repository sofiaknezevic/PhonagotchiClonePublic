//
//  MyPhonagotchi.m
//  Phonagotchi
//
//  Created by Sofia Knezevic on 2017-02-16.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import "MyPhonagotchi.h"

@implementation MyPhonagotchi

- (instancetype)init
{
    self = [super init];
    if (self) {
        _isPetGrumpy = NO;
    }
    return self;
}

- (void)pettingVelocity:(CGPoint)velocity
{

    if(velocity.x >= 5000 || velocity.x <= -5000){
        
        _isPetGrumpy = YES;
        
    }else{
        
        _isPetGrumpy = NO;
        
    }
    
}

- (void)feedsAt:(CGPoint)x andAt:(CGPoint)y
{
    
}

@end
