//
//  WaveViewController.m
//  Test_Animation
//
//  Created by 李巍 on 2017/3/25.
//  Copyright © 2017年 李巍. All rights reserved.
//

#import "WaveViewController.h"


#define RandomColor [UIColor colorWithRed:((arc4random()%254)+1)/255.f green:((arc4random()%254)+1)/255.f blue:((arc4random()%254)+1)/255.f alpha:1.0f];

@interface WaveViewController ()
@property (nonatomic,strong)UILabel *arrowView;
@property (nonatomic,strong)UILabel *ministryView;
@property (nonatomic,strong)UILabel *addButton;
@property (nonatomic,strong)UILabel *firstRow;
@property (nonatomic,strong)UILabel *secondRow;
@property (nonatomic,strong)UILabel *thirdRow;
@property (nonatomic,strong)UILabel *fourthRow;
@property (nonatomic,strong)UILabel *fifthRow;
@end

CGFloat rowHeight = 70;

@implementation WaveViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    // Do any additional setup after loading the view.
    
    CGFloat width = self.view.bounds.size.width;
    
    self.arrowView = [[UILabel alloc]initWithFrame:CGRectMake(width, 0+64, width, rowHeight)];
    self.arrowView.text = @"arrowView";
    self.arrowView.textColor = [UIColor whiteColor];
    self.arrowView.font = [UIFont systemFontOfSize:40];
    self.arrowView.backgroundColor = RandomColor;
    [self.view addSubview:self.arrowView];
    
    self.ministryView = [[UILabel alloc]initWithFrame:CGRectMake(width, rowHeight+64, width, rowHeight)];
    self.ministryView.text = @"ministryView";
    self.ministryView.textColor = [UIColor whiteColor];
    self.ministryView.font = [UIFont systemFontOfSize:40];
    self.ministryView.backgroundColor = RandomColor;
    [self.view addSubview:self.ministryView];
    
    self.addButton = [[UILabel alloc]initWithFrame:CGRectMake(width, rowHeight*2+64, width, rowHeight)];
    self.addButton.text = @"addButton";
    self.addButton.textColor = [UIColor whiteColor];
    self.addButton.font = [UIFont systemFontOfSize:40];
    self.addButton.backgroundColor = RandomColor;
    [self.view addSubview:self.addButton];
    
    self.firstRow = [[UILabel alloc]initWithFrame:CGRectMake(width, rowHeight*3+64, width, rowHeight)];
    self.firstRow.text = @"firstRow";
    self.firstRow.textColor = [UIColor whiteColor];
    self.firstRow.font = [UIFont systemFontOfSize:40];
    self.firstRow.backgroundColor = RandomColor;
    [self.view addSubview:self.firstRow];
    
    self.secondRow = [[UILabel alloc]initWithFrame:CGRectMake(width, rowHeight*4+64, width, rowHeight)];
    self.secondRow.text = @"secondRow";
    self.secondRow.textColor = [UIColor whiteColor];
    self.secondRow.font = [UIFont systemFontOfSize:40];
    self.secondRow.backgroundColor = RandomColor;
    [self.view addSubview:self.secondRow];
    
    self.thirdRow = [[UILabel alloc]initWithFrame:CGRectMake(width, rowHeight*5+64, width, rowHeight)];
    self.thirdRow.text = @"thirdRow";
    self.thirdRow.textColor = [UIColor whiteColor];
    self.thirdRow.font = [UIFont systemFontOfSize:40];
    self.thirdRow.backgroundColor = RandomColor;
    [self.view addSubview:self.thirdRow];
    
    self.fourthRow = [[UILabel alloc]initWithFrame:CGRectMake(width, rowHeight*6+64, width, rowHeight)];
    self.fourthRow.text = @"fourthRow";
    self.fourthRow.textColor = [UIColor whiteColor];
    self.fourthRow.font = [UIFont systemFontOfSize:40];
    self.fourthRow.backgroundColor = RandomColor;
    [self.view addSubview:self.fourthRow];
    
    self.fifthRow = [[UILabel alloc]initWithFrame:CGRectMake(width, rowHeight*7+64, width, rowHeight)];
    self.fifthRow.text = @"fifthRow";
    self.fifthRow.textColor = [UIColor whiteColor];
    self.fifthRow.font = [UIFont systemFontOfSize:40];
    self.fifthRow.backgroundColor = RandomColor;
    [self.view addSubview:self.fifthRow];
    
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)resetAnimationUI
{
    
}

-(void)logSomething
{
    CGFloat width = self.view.bounds.size.width;
    CGFloat initialDelay = 0;
    CGFloat stutter = 0.05f;
    CGFloat duration = 0.8f;
    // 动画箭头图片
    [UIView animateWithDuration:duration delay:initialDelay
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [self.arrowView setFrame:CGRectMake(0, 0+64, width, rowHeight)];
         } completion:NULL];
    
    // 动画Ministry of Fun文字
    [UIView animateWithDuration:duration delay:initialDelay + (1 * stutter)
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [self.ministryView setFrame:CGRectMake(0, rowHeight+64, width, rowHeight)];
         } completion:NULL];
    
    [UIView animateWithDuration:duration delay:initialDelay + (2 * stutter)
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [self.addButton setFrame:CGRectMake(0, rowHeight*2+64, width, rowHeight)];
         } completion:NULL];
    
    [UIView animateWithDuration:duration delay:initialDelay + (3 * stutter)
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [self.firstRow setFrame:CGRectMake(0, rowHeight*3+64, width, rowHeight)];
         } completion:NULL];
    
    [UIView animateWithDuration:duration delay:initialDelay + (4 * stutter)
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [self.secondRow setFrame:CGRectMake(0, rowHeight*4+64, width, rowHeight)];
         } completion:NULL];
    
    [UIView animateWithDuration:duration delay:initialDelay + (5 * stutter)
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [self.thirdRow setFrame:CGRectMake(0, rowHeight*5+64, width, rowHeight)];
         } completion:NULL];
    
    [UIView animateWithDuration:duration delay:initialDelay + (6 * stutter)
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [self.fourthRow setFrame:CGRectMake(0, rowHeight*6+64, width, rowHeight)];
         } completion:NULL];
    
    [UIView animateWithDuration:duration delay:initialDelay + (7 * stutter)
         usingSpringWithDamping:0.6 initialSpringVelocity:0 options:0 animations:^{
             [self.fifthRow setFrame:CGRectMake(0, rowHeight*7+64, width, rowHeight)];
         } completion:NULL];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
