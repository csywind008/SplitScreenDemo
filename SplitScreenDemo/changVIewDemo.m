//
//  changVIewDemo.m
//  SplitScreenDemo
//
//  Created by Peter James on 14-10-13.
//  Copyright (c) 2014年 beiming. All rights reserved.
//

#import "changVIewDemo.h"

@implementation changVIewDemo

@synthesize myRect,CVdelegate;
- (id)initWithFrame:(CGRect)frame
{
    _w = 1.0/2;
    _h = 1.0/2;
    myRect = CGRectMake(frame.origin.x, frame.origin.y, 666*_w, 612*_h);
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
        [panGesture addTarget:self action:@selector(handlePanGestureRecognize:)];
        [self addGestureRecognizer:panGesture];
        [self ViewInit];
        self.backgroundColor = [UIColor yellowColor];
        
    }
    return self;
}
-(void)handlePanGestureRecognize:(UIPanGestureRecognizer*)pan
{
    NSLog(@"handlepan");

    UIView *panV = [pan view];
    CGPoint pp = [pan translationInView:self.superview];
    if(pan.state == UIGestureRecognizerStateBegan||pan.state ==UIGestureRecognizerStateChanged)
    {
        CGPoint P = [pan translationInView:panV.superview];
        NSLog(@"point:%f,%f",pp.x,pp.y);
 //       CGPoint pa = CGPointMake(panV.center.x+P.x, panV.center.y+P.y);
//        if (pa.x<self.frame.size.width/3||pa.y<self.frame.size.height/3||pa.x>panV.superview.frame.size.width-self.frame.size.width/3||pa.y>panV.superview.frame.size.height-self.frame.size.height/3) {
//            
//        }else {
            panV.center = CGPointMake(panV.center.x+P.x, panV.center.y+P.y);
            [pan setTranslation:CGPointZero inView:panV.superview];
     //   }
        
        
    }
    if(pan.state == UIGestureRecognizerStateEnded)
    {
        //self.hidden = YES;

    }
}
-(void)ViewInit
{
}


@end
