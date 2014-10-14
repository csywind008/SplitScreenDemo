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
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
        
    }
    return self;
}
-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
{
    if(!dragEnable)
    {
        return;
    }
    UITouch *touch = [touches anyObject];
    beginPoin = [touch locationInView:self];
    NSLog(@"touchbegan_change");
}
-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchmoved_change");
    if(!dragEnable)
    {
        return;
    }
    UITouch *touch = [touches anyObject];
    CGPoint newPoint = [touch locationInView:self];
    
    float offsetX = newPoint.x - beginPoin.x;
    float offsetY = newPoint.y - beginPoin.y;
    self.center = CGPointMake(self.center.x+offsetX, self.center.y + offsetY);
}
-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
{
    NSLog(@"touchesEnded_chang");
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
