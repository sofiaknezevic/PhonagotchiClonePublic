//
//  MyPhonagotchi.h
//  Phonagotchi
//
//  Created by Sofia Knezevic on 2017-02-16.
//  Copyright © 2017 Lighthouse Labs. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface MyPhonagotchi : NSObject

@property (readonly) BOOL isPetGrumpy;
@property (readonly) BOOL makeAnotherApple;
@property (readonly) BOOL giveCatApple;

- (void) pettingVelocity:(CGPoint) velocity;
- (void) feedsAt:(CGPoint)location;
- (void) didFeedAt:(CGPoint)location;

@end
