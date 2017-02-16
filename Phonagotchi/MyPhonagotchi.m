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
        _makeAnotherApple = NO;
        _giveCatApple = NO;
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

- (void)feedsAt:(CGPoint)location
{
    if((location.x >= 55 && location.y >= 290) || (location.x <= 75 && location.y <= 315)){
        
        _makeAnotherApple = YES;
        
    }else{
        
        _makeAnotherApple = NO;
        
    }
}

-(void)didFeedAt:(CGPoint)location
{
    
    if((location.x >= 80 && location.y >= 290 ) || (location.x <= 100 && location.y <= 320)){
        
        NSLog(@"You gave the cat the apple!!");
        
        _giveCatApple = YES;
        
    }else{
        
        _giveCatApple = NO;
        
    }
    
}

@end
