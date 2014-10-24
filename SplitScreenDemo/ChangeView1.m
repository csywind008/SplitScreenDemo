//
//  ChangeView1.m
//  SplitScreenDemo
//
//  Created by Peter James on 14-10-14.
//  Copyright (c) 2014年 beiming. All rights reserved.
//

#import "ChangeView1.h"

@implementation ChangeView1

@synthesize dragEnable;
- (id)initWithFrame:(CGRect)frame
{
    CGRect fframe = CGRectMake(frame.origin.x, frame.origin.y, 114, 89);
    self = [super initWithFrame:fframe];
    if (self) {
        // Initialization code
        UIPinchGestureRecognizer *pinchGestureRecognizer = [[UIPinchGestureRecognizer alloc]initWithTarget:self action:@selector(BigorSmall:)];
        [self addGestureRecognizer:pinchGestureRecognizer];
    }
    return self;
}
-(void)BigorSmall:(UIPinchGestureRecognizer *)pin
{
    if(pin.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"bigorsmall");
    }
}
                /*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect
{
    // Drawing code
}
*/

@end
