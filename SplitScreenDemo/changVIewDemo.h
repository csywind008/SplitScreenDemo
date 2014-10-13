//
//  changVIewDemo.h
//  SplitScreenDemo
//
//  Created by Peter James on 14-10-13.
//  Copyright (c) 2014年 beiming. All rights reserved.
//

#import <UIKit/UIKit.h>

@protocol changViewDelegate;
@interface changVIewDemo : UIView
{
    float _w;
    float _h;
}
@property(nonatomic)CGRect myRect;
@property(nonatomic)id<changViewDelegate>CVdelegate;
-(void)ViewInit;
-(void)loseRespond;
@end

@protocol changViewDelegate <NSObject>

@end