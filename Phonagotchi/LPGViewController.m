//
//  LPGViewController.m
//  Phonagotchi
//
//  Created by Steven Masuch on 2014-07-26.
//  Copyright (c) 2014 Lighthouse Labs. All rights reserved.
//

#import "LPGViewController.h"
#import "MyPhonagotchi.h"

@interface LPGViewController ()

@property (nonatomic) UIImageView *petImageView;
@property (nonatomic) UIImageView *appleImageView;
@property (nonatomic) UIImageView *appleImageViewCopy;
@property (nonatomic) UIImageView *bucketImageView;

@property (nonatomic, strong) MyPhonagotchi *myPhonagotchi;



@end

@implementation LPGViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.myPhonagotchi = [[MyPhonagotchi alloc] init];
	
    self.view.backgroundColor = [UIColor colorWithRed:(252.0/255.0) green:(240.0/255.0) blue:(228.0/255.0) alpha:1.0];
    
    self.petImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.petImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.petImageView.image = [UIImage imageNamed:@"default"];
    
    [self.view addSubview:self.petImageView];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterX
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterX
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    [self.view addConstraint:[NSLayoutConstraint constraintWithItem:self.petImageView
                                                          attribute:NSLayoutAttributeCenterY
                                                          relatedBy:NSLayoutRelationEqual
                                                             toItem:self.view
                                                          attribute:NSLayoutAttributeCenterY
                                                         multiplier:1.0
                                                           constant:0.0]];
    
    //BUCKET!!!!
    self.bucketImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.bucketImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.bucketImageView.image = [UIImage imageNamed:@"bucket"];
    
    [self.view addSubview:self.bucketImageView];
    self.bucketImageView.alpha = 0.8;
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeWidth
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:50]];
    
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeHeight
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:nil
                                                           attribute:NSLayoutAttributeNotAnAttribute
                                                          multiplier:1
                                                            constant:50]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1
                                                            constant:500]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.bucketImageView
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:40]];
    
    //// APPLE!!!!
    self.appleImageView = [[UIImageView alloc] initWithFrame:CGRectZero];
    self.appleImageView.translatesAutoresizingMaskIntoConstraints = NO;
    
    self.appleImageView.image = [UIImage imageNamed:@"apple"];
    
    [self.bucketImageView addSubview:self.appleImageView];
    

    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                                  attribute:NSLayoutAttributeWidth
                                                                  relatedBy:NSLayoutRelationEqual
                                                                     toItem:nil
                                                                  attribute:NSLayoutAttributeNotAnAttribute
                                                                 multiplier:1
                                                                   constant:25]];

    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                                   attribute:NSLayoutAttributeHeight
                                                                   relatedBy:NSLayoutRelationEqual
                                                                      toItem:nil
                                                                   attribute:NSLayoutAttributeNotAnAttribute
                                                                  multiplier:1
                                                                    constant:25]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeTop
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeTop
                                                          multiplier:1
                                                            constant:510]];
    
    [self.view addConstraint: [NSLayoutConstraint constraintWithItem:self.appleImageView
                                                           attribute:NSLayoutAttributeLeft
                                                           relatedBy:NSLayoutRelationEqual
                                                              toItem:self.view
                                                           attribute:NSLayoutAttributeLeft
                                                          multiplier:1
                                                            constant:50]];
    


    self.appleImageViewCopy = [[UIImageView alloc] initWithImage:self.appleImageView.image];
    self.appleImageViewCopy.translatesAutoresizingMaskIntoConstraints = YES;
    
    
    
    //PETTING!
    UIPanGestureRecognizer *petting = [[UIPanGestureRecognizer alloc] initWithTarget:self action:@selector(pettingGesture:)];
    
    [self.view addGestureRecognizer:petting];
    
    
    //FEEDING!!
    UIPinchGestureRecognizer *feeding = [[UIPinchGestureRecognizer alloc] initWithTarget:self action:@selector(feedingGesture:)];
    
    [self.view addGestureRecognizer:feeding];
    
    
    
    
    
}

- (void)pettingGesture:(UIPanGestureRecognizer *)petting
{
    
    CGPoint velocityOfPet = [petting velocityInView:self.view];
    
    [self.myPhonagotchi pettingVelocity:velocityOfPet];
    
    if (self.myPhonagotchi.isPetGrumpy == YES) {
        
        self.petImageView.image = [UIImage imageNamed:@"grumpy"];
        
    }
}

- (void)feedingGesture:(UIPinchGestureRecognizer *)feeding
{
    
    CGPoint location = [feeding locationInView:self.view];
    
    CGRect newFrame;
    
    if((feeding.state == UIGestureRecognizerStateBegan || feeding.state == UIGestureRecognizerStateChanged)){
        
        [self.myPhonagotchi feedsAt:location];
        
        if(self.myPhonagotchi.makeAnotherApple == YES){
            
            newFrame = CGRectMake(50, 510, self.appleImageView.frame.size.width, self.appleImageView.frame.size.height);
            self.appleImageViewCopy.frame = newFrame;
            
            [self.view addSubview:self.appleImageViewCopy];
            

            CGPoint touchLocation = [feeding locationInView:self.view];
            self.appleImageViewCopy.center = touchLocation;
        }

    }
    
    if(feeding.state == UIGestureRecognizerStateEnded){
        
        [self.myPhonagotchi didFeedAt:location];
        
        if(self.myPhonagotchi.giveCatApple == YES){
            
            [UIImageView animateWithDuration:1.0
                                       delay:1.0
                                     options:0
                                  animations:^{self.appleImageViewCopy.alpha = 0.0f;}
                                  completion:^(BOOL finished){self.appleImageViewCopy.hidden = YES;}];
            
            
        
        }else{
            
            [UIImageView animateWithDuration:0.5
                                       delay:1.0
                                     options:UIViewAnimationOptionCurveEaseIn
                                  animations:^{self.appleImageViewCopy.frame = CGRectMake((location.x), (location.y-500), self.appleImageViewCopy.frame.size.width, self.appleImageViewCopy.frame.size.height);}
                                  completion:^(BOOL finished){self.appleImageViewCopy.hidden = YES;}];
            
       

            
        }
        
        
    
    }
}


@end
