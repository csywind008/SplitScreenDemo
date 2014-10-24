//
//  RootViewController.m
//  SplitScreenDemo
//
//  Created by Peter James on 14-10-13.
//  Copyright (c) 2014年 beiming. All rights reserved.
//

#import "RootViewController.h"
#import "ChangeView1.h"
@interface RootViewController ()

@end

@implementation RootViewController
{
    ChangeView1 *changview1;
}
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
    CGRect bounds = CGRectMake(0, 0, Width, Height);

    UIImageView *backView = [[UIImageView alloc]initWithFrame:bounds];
    backView.image = [UIImage imageNamed:@"background.jpg" ];
    [self.view addSubview:backView];
    
    
    UIView *normalview = [[UIView alloc]initWithFrame:CGRectMake(200, 50, 100, 50)];
    normalview.backgroundColor = [UIColor yellowColor];
    [self.view addSubview:normalview];
    changVIewDemo *ChangeView = [[changVIewDemo alloc]initWithFrame:CGRectMake(700, 0, 200, 150)];
    [self.view addSubview:ChangeView];
    
    NSLog(@"root:%f,%f",self.view.frame.size.width,self.view.frame.size.height);
    self.view.backgroundColor = [UIColor grayColor];
    
    changview1 = [[ChangeView1 alloc]initWithFrame:CGRectMake(200, 200, 100, 50)];
    changview1.backgroundColor = [UIColor blueColor];
    changview1.dragEnable = YES;
    [self.view addSubview:changview1];
    
    ChangeView1 *changview11 = [[ChangeView1 alloc]initWithFrame:CGRectMake(300, 300, 100, 50)];
    changview11.backgroundColor = [UIColor greenColor];
    changview11.dragEnable = YES;
    [self.view addSubview:changview11];
    
    [self viewInit];
}
-(void)viewInit
{
    tableView = [[UITableView alloc]initWithFrame:CGRectMake(0, 0, cellWidth, Height) style:UITableViewStylePlain];
    tableView.separatorColor = [UIColor grayColor];
    tableView.layer.borderWidth = 3;
    tableView.layer.borderColor = [UIColor redColor].CGColor;
    tableView.delegate=self;
    tableView.dataSource = self;
    tableView.showsVerticalScrollIndicator = NO;
   // tableView.transform = CGAffineTransformMakeRotation(-M_PI_2);
    //tableView.backgroundColor = [UIColor redColor];
    [self.view addSubview:tableView];
    //通过长按控制
    UILongPressGestureRecognizer * longPressGr = [[UILongPressGestureRecognizer alloc] initWithTarget:self action:@selector(longPressToDo:)];
    longPressGr.minimumPressDuration = 0.3;
    [tableView addGestureRecognizer:longPressGr];
    
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    [panGesture addTarget:self action:@selector(handlePanGestureRecognize:)];
    //[tableView addGestureRecognizer:panGesture];
}

#pragma mark tableviewdelegate
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 7;
}
-(CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return cellWidth/4*3;
}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellname = @"cell";
    UITableViewCell  *cell = [tableView dequeueReusableCellWithIdentifier:cellname];
    if(cell == nil)
    {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:cellname];
    }
    cell.textLabel.text = [NSString stringWithFormat:@"%d",indexPath.row];
    UIPanGestureRecognizer *panGesture = [[UIPanGestureRecognizer alloc]init];
    [panGesture addTarget:self action:@selector(handlePanGestureRecognize:)];
    //[cell addGestureRecognizer:panGesture];
    
    return  cell;
}
-(void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    [self.view bringSubviewToFront:changview1];
    changview1.hidden = NO;
}
#pragma mark Gesture
//长按手势
-(void)longPressToDo:(UILongPressGestureRecognizer *)gesture
{
    ChangeView1 *newchangview1;
    CGPoint point = [gesture locationInView:tableView.superview];
    changview1.hidden = NO;
    if(gesture.state == UIGestureRecognizerStateBegan)
    {
        CGPoint point1 = [gesture locationInView:tableView];
        NSIndexPath * indexPath = [tableView indexPathForRowAtPoint:point1];
       
        
        if(indexPath == nil) return ;
        //add your code here
        newchangview1 = [[ChangeView1 alloc]init];
        newchangview1.center = point;

        [self.view bringSubviewToFront:newchangview1];
        newchangview1.backgroundColor = [UIColor colorWithRed:1.0/((indexPath.row+1)%35) green:1.0/((indexPath.row*2)%15) blue:1.0/((indexPath.row+4)%10) alpha:1];
        NSLog(@"longpress:%f,%f,index:%d,%@",point.x,point.y,indexPath.row,changview1.backgroundColor);
        [self.view addSubview:newchangview1];
    }
    if(gesture.state == UIGestureRecognizerStateChanged)
    {
        newchangview1.center = point;
        [self.view bringSubviewToFront:changview1];
    }
}
-(void)handlePanGestureRecognize:(UIPanGestureRecognizer *)pan
{
    UITableViewCell *cell = (UITableViewCell *)[pan view];
    CGPoint p = [pan translationInView:cell.superview];
    CGPoint pa = CGPointMake(cell.center.x+p.x, cell.center.y+p.y);
    if (pa.x<self.view.frame.size.width/3||pa.y<self.view.frame.size.height/3||pa.x>cell.superview.frame.size.width-self.view.frame.size.width/3||pa.y>cell.superview.frame.size.height-self.view.frame.size.height/3) {
        return;
    }
    if(pan.state == UIGestureRecognizerStateBegan)
    {
        NSLog(@"began");
    }
    if(pan.state == UIGestureRecognizerStateChanged)
    {
        NSLog(@"change");
        changview1.hidden = NO;
        changview1.center = CGPointMake(p.x, p.y);

    } if(pan.state == UIGestureRecognizerStateCancelled)
    {
        NSLog(@"Cancelled");
    }if(pan.state == UIGestureRecognizerStateEnded)
    {
        NSLog(@"Ended");
    }if(pan.state == UIGestureRecognizerStateRecognized)
    {
        NSLog(@"Recognized");
    }
}
#pragma mark touch
//-(void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    pointbegin = [touch locationInView:self.view];
//    NSLog(@"begin,touch.x:%f,y:%f",pointbegin.x,pointbegin.y);
//}
//-(void)touchesMoved:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    UITouch *touch = [touches anyObject];
//    pointmove = [touch locationInView:self.view];
//    float offsetx = pointmove.x - pointbegin.x;
//    float offsety = pointmove.y - pointbegin.y;
//    if(offsetx != 0||offsety !=0)
//    {
//        changview1.hidden = NO;
//        changview1.center = CGPointMake(pointmove.x, pointmove.y);
//    }
//    NSLog(@"moved");
//}
//-(void)touchesEnded:(NSSet *)touches withEvent:(UIEvent *)event
//{
//    changview1.hidden = YES;
//}
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
