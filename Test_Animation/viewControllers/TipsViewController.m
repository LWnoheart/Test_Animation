//
//  TipsViewController.m
//  Test_Animation
//
//  Created by 李巍 on 2017/3/24.
//  Copyright © 2017年 李巍. All rights reserved.
//

#import "TipsViewController.h"
#import "JNWSpringAnimation.h"

@interface TipsViewController ()

@property (nonatomic,strong)UIView *overlayView;

@property (nonatomic,strong)UIView *alertView;

@property (nonatomic,strong)UIButton *doneBtn;

@end

@implementation TipsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    self.selectArray = @[@"系统alert",@"从下飞出来alert",@"系统alert带回弹"];
    
    
    self.overlayView = [[UIView alloc] initWithFrame:self.view.bounds];
    self.overlayView.backgroundColor = [UIColor blackColor];
    self.overlayView.alpha = 0.0f;
    [self.view addSubview:self.overlayView];
    
    
    CGFloat alertDimension = 250;
    CGRect alertViewFrame = CGRectMake(
                                       self.view.bounds.size.width/2 - alertDimension/2,
                                       self.view.bounds.size.height/2 - alertDimension/2,
                                       alertDimension, alertDimension);
    self.alertView = [[UIView alloc] initWithFrame:alertViewFrame];
    self.alertView.backgroundColor = [UIColor greenColor];
    self.alertView.alpha = 0.0f;
    //self.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2);
    self.alertView.layer.cornerRadius = 10;
    self.alertView.layer.shadowColor = [UIColor blackColor].CGColor;
    self.alertView.layer.shadowOffset = CGSizeMake(0, 5);
    self.alertView.layer.shadowOpacity = 0.3f;
    self.alertView.layer.shadowRadius = 10.0f;
    [self.view addSubview:self.alertView];
    
    
    WS(this);
    self.doneBtn = [UIButton buttonWithType:UIButtonTypeCustom];
    [self.doneBtn setTitle:@"Done" forState:UIControlStateNormal];
    self.doneBtn.titleLabel.font = [UIFont boldSystemFontOfSize:20];
    [self.doneBtn addTarget:self action:@selector(donePress:) forControlEvents:UIControlEventTouchUpInside];
    [self.alertView addSubview:self.doneBtn];
    [self.doneBtn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.bottom.equalTo(this.alertView);
        make.height.mas_equalTo(@30);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/



-(void)resetAnimationUI
{
    self.overlayView.alpha = 0.0f;
    self.alertView.alpha = 0.0f;
    //self.alertView.transform = CGAffineTransformMakeScale(1.2, 1.2);
}

-(void)logSomething
{
    
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    self.doneBtn.tag = indexPath.row;
    switch (indexPath.row) {
        case 0:
        {
            [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.overlayView.alpha = 0.3f;
                                 self.alertView.alpha = 1.0f;
                             } completion:NULL];
            
            JNWSpringAnimation *scale = [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
            scale.damping = 14;
            scale.stiffness = 14;
            scale.mass = 1;
            scale.fromValue = @(1.2);
            scale.toValue = @(1.0);
            
            [self.alertView.layer addAnimation:scale forKey:scale.keyPath];
            self.alertView.transform = CGAffineTransformMakeScale(1.0, 1.0);
        }
            break;
        case 1:
        {
            //alertView.transform = CGAffineTransformMakeScale(.25, .25);
            //alertView.transform = CGAffineTransformTranslate(alertView.transform, 0, 600);
            
            // 同时处理覆盖层和警告框
            [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.overlayView.alpha = 0.2f;
                self.alertView.alpha = 1.0f;
            } completion:NULL];
            
            // 将警告框的比例动画从0.25变为1.0
            JNWSpringAnimation *scale =
            [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
            scale.damping = 12;
            scale.stiffness = 12;
            scale.mass = 1;
            scale.fromValue = @(.25);
            scale.toValue = @(1.0);
            
            [self.alertView.layer addAnimation:scale forKey:scale.keyPath];
            self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
            
            // 将Y方向的位置从600动画回0
            // 将其放回原来的位置
            JNWSpringAnimation *translate = [JNWSpringAnimation
                                             animationWithKeyPath:@"transform.translation.y"];
            translate.damping = 15;
            translate.stiffness = 15;
            translate.mass = 1;
            translate.fromValue = @(600);
            translate.toValue = @(0);
            
            [self.alertView.layer addAnimation:translate forKey:translate.keyPath];
            self.alertView.transform = CGAffineTransformTranslate(self.alertView.transform, 0, 0);
            
            //damping和stiffness一致时，意味着它是一种没有弹性的指数衰减类型的动作。然而scale动画的值比translation动画的值要低，意味着scale会慢一点点。这是因为我想要所有的动画大致在同时结束，因为translation动画比scale动画移动更多的值，所以它需要移动的快一点点来匹配scale动画的速度。这只会略微被注意到，但如果某个动画比另一个结束得早，绝对会看起来很奇怪。
        }
            break;
        case 2:
        {
            [UIView animateWithDuration:.3 delay:0 options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.overlayView.alpha = 0.3f;
                                 self.alertView.alpha = 1.0f;
                             } completion:NULL];
            
            JNWSpringAnimation *scale = [JNWSpringAnimation
                                         animationWithKeyPath:@"transform.scale"];
            scale.damping = 32;
            scale.stiffness = 450;
            scale.mass = 2.4;
            scale.fromValue = @(0);
            scale.toValue = @(1.0);
            
            [self.alertView.layer addAnimation:scale forKey:scale.keyPath];
            self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
        }
            break;
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
}


-(void)donePress:(UIButton *)btn
{
    switch (btn.tag) {
        case 0:
        {
            [UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.overlayView.alpha = 0.0f;
                                 self.alertView.alpha = 0.0f;
                             } completion:NULL];
            
            JNWSpringAnimation *scaleOut = [JNWSpringAnimation
                                            animationWithKeyPath:@"transform.scale"];
            scaleOut.damping = 11;
            scaleOut.stiffness = 11;
            scaleOut.mass = 1;
            scaleOut.fromValue = @(1.0);
            scaleOut.toValue = @(0.7);
            
            [self.alertView.layer addAnimation:scaleOut forKey:scaleOut.keyPath];
            self.alertView.transform = CGAffineTransformMakeScale(0.7, 0.7);
        }
            break;
        case 1:
        {
            // 一起淡化覆盖层和警告框
            [UIView animateWithDuration:.2 delay:0 options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.overlayView.alpha = 0.0f;
                                 self.alertView.alpha = 0.0f;
                             } completion:NULL];
            
            // 动画将警告框的比例从1.0变为0.5
            JNWSpringAnimation *scale =
            [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
            scale.damping = 17;
            scale.stiffness = 17;
            scale.mass = 1;
            scale.fromValue = @(1.0);
            scale.toValue = @(0.5);
            
            [self.alertView.layer addAnimation:scale forKey:scale.keyPath];
            self.alertView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 0.5, 0.5);
            
            // 动画将位置从0变回屏幕底部
            JNWSpringAnimation *translate = [JNWSpringAnimation
                                             animationWithKeyPath:@"transform.translation.y"];
            translate.damping = 4;
            translate.stiffness = 4;
            translate.mass = 1;
            translate.fromValue = @(0);
            translate.toValue = @(600);
            
            [self.alertView.layer addAnimation:translate forKey:translate.keyPath];
            self.alertView.transform = CGAffineTransformTranslate(self.alertView.transform, 0, 600);
        }
            break;
        case 2:
        {
            [UIView animateWithDuration:.15 delay:0 options:UIViewAnimationOptionCurveEaseInOut
                             animations:^{
                                 self.overlayView.alpha = 0.0f;
                                 self.alertView.alpha = 0.0f;
                             } completion:NULL];
            
            JNWSpringAnimation *scaleOut = [JNWSpringAnimation
                                            animationWithKeyPath:@"transform.scale"];
            scaleOut.damping = 11;
            scaleOut.stiffness = 11;
            scaleOut.mass = 1;
            scaleOut.fromValue = @(1.0);
            scaleOut.toValue = @(0.7);
            
            [self.alertView.layer addAnimation:scaleOut forKey:scaleOut.keyPath];
            self.alertView.transform = CGAffineTransformMakeScale(0.7, 0.7);
        }
            break;
        case 3:
        {
            
        }
            break;
            
        default:
            break;
    }
}

@end
