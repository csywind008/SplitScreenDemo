//
//  RootViewController.m
//  SplitScreenDemo
//
//  Created by Peter James on 14-10-13.
//  Copyright (c) 2014年 beiming. All rights reserved.
//

#import "RootViewController.h"
@interface RootViewController ()

@end

@implementation RootViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIView *normalview = [[UIView alloc]initWithFrame:CGRectMake(50, 50, 100, 50)];
    normalview.backgroundColor = [UIColor redColor];
    [self.view addSubview:normalview];
    changVIewDemo *ChangeView = [[changVIewDemo alloc]initWithFrame:CGRectMake(700, 0, 200, 150)];
    [self.view addSubview:ChangeView];
    NSLog(@"root:%f,%f",self.view.frame.size.width,self.view.frame.size.height);
    self.view.backgroundColor = [UIColor grayColor];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
