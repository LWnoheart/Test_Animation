//
//  BasicViewController.m
//  Test_Animation
//
//  Created by 李巍 on 2017/3/24.
//  Copyright © 2017年 李巍. All rights reserved.
//

#import "BasicViewController.h"
#import "JNWSpringAnimation.h"
@interface BasicViewController ()
@property (nonatomic,strong)UIView *redBall;
@end

@implementation BasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self resetAnimationUI];
    
    NSArray *items = @[@"放大",@"UIView弹簧",@"JNW弹簧放大",@"JNW弹簧旋转",@"JNW弹簧移动",@"JNW弹簧旋转放大",@"CAAnimation旋转放大移动"];
    self.selectArray = items;
    
    
}

-(void)resetAnimationUI
{
    [self.redBall removeFromSuperview];
    self.redBall = [[UIView alloc] initWithFrame:CGRectMake(50, 60+64, 50, 50)];
    self.redBall.backgroundColor = [UIColor redColor];
    self.redBall.layer.cornerRadius = 0;
    [self.view addSubview:self.redBall];
}


- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            //UIViewAnimationOptionCurveEaseInOut淡入淡出
            [UIView animateWithDuration:.5 delay:0 options:UIViewAnimationOptionCurveEaseInOut animations:^{
                self.redBall.backgroundColor = [UIColor greenColor];
                self.redBall.transform = CGAffineTransformConcat(//将两个操作合并成一个，这样就可以分配一个简单矩阵转化给视图
                                                                 CGAffineTransformMakeScale(2.0, 2.0),//尺寸变为原来的两倍
                                                                 CGAffineTransformMakeTranslation(75, 0));//右移75
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        case 1:
        {
            [UIView animateWithDuration:3 delay:0 usingSpringWithDamping:.3 initialSpringVelocity:10 options:0 animations:^{
                self.redBall.transform = CGAffineTransformMakeTranslation(200, 0);
            } completion:^(BOOL finished) {
                
            }];
        }
            break;
        case 2:
        {
            JNWSpringAnimation *scale =
            [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
            scale.damping = 9;
            scale.stiffness = 100;
            scale.mass = 2;
            scale.fromValue = @(1.0);
            scale.toValue = @(2.0);
            
            [self.redBall.layer addAnimation:scale forKey:scale.keyPath];
            self.redBall.transform = CGAffineTransformMakeScale(2.0, 2.0);//增加动画后将动画的值设置到最终状态，可以在动画完成后无缝更新为新的状态。tips，layer分为模型层树，表现层树，渲染树，模型层树反应的是layer静止不动的所有属性。这是我们通常交互的层，不会因动画的改变而改变。表现层树反应了动画时layer的属性，你不应该在这个层树上设置任何值，通常都是在想要准确了解一个layer在哪或是其在动画过程中的行为时通过查看当前的动画值来与表现层树交互。渲染层是底层负责屏幕渲染的，开发者不需要操作和关心。动画执行是在表现层，当执行完会恢复为模型层的属性。所以动画完成会变回原来的状态。
        }
            break;
        case 3:
        {
            JNWSpringAnimation *scale =
            [JNWSpringAnimation animationWithKeyPath:@"transform.rotation"];
            scale.damping = 10;
            scale.stiffness = 100;
            scale.mass = 3;
            
            scale.fromValue = @(0);
            scale.toValue = @(M_PI_2);
            
            [self.redBall.layer addAnimation:scale forKey:scale.keyPath];
            self.redBall.transform = CGAffineTransformMakeRotation(M_PI_2);
        }
            break;
        case 4:
        {
            JNWSpringAnimation *scale = [JNWSpringAnimation
                                         animationWithKeyPath:@"transform.translation.x"];
            scale.damping = 7;
            scale.stiffness = 7;
            scale.mass = 1;
            
            scale.fromValue = @(0);
            scale.toValue = @(200);
            
            [self.redBall.layer addAnimation:scale forKey:scale.keyPath];
            self.redBall.transform = CGAffineTransformMakeTranslation(200, 0);
        }
            break;
        case 5:
        {
            JNWSpringAnimation *scale = [JNWSpringAnimation
                                         animationWithKeyPath:@"transform.scale"];
            scale.damping = 9;
            scale.stiffness = 9;
            scale.mass = 1;
            scale.fromValue = @(1);
            scale.toValue = @(4.0);
            
            [self.redBall.layer addAnimation:scale forKey:scale.keyPath];
            self.redBall.transform = CGAffineTransformScale(self.redBall.transform, 4.0, 4.0);
            
            JNWSpringAnimation *rotate = [JNWSpringAnimation
                                          animationWithKeyPath:@"transform.rotation"];
            rotate.damping = 9;
            rotate.stiffness = 9;
            rotate.mass = 1;
            rotate.fromValue = @(0);
            rotate.toValue = @(M_PI);
            
            [self.redBall.layer addAnimation:rotate forKey:rotate.keyPath];
            self.redBall.transform = CGAffineTransformRotate(self.redBall.transform, M_PI);
            //CGAffineTransformMakeScale,包含make在其中，属于创建一个其他值为初始的，scale为特定的transform。CGAffineTransformScale需要三个参数，表示在传入transform的前提下改变scale（特定）的值，适用于前后都改变transform的情况下。
        }
            break;
        case 6:
        {
            CABasicAnimation *scaleAnimation = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
            scaleAnimation.fromValue = @1;
            scaleAnimation.toValue = @2;
            
            CABasicAnimation *rotateAnimation = [CABasicAnimation animationWithKeyPath:@"transform.rotation"];
            rotateAnimation.fromValue = @0;
            rotateAnimation.toValue = @M_PI;
            
            CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"transform.translation.x"];
            moveAnimation.fromValue = @0;
            moveAnimation.toValue = @200;
            
            CAAnimationGroup *group = [CAAnimationGroup animation];
            group.duration = 1.5f;
            group.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
            //group.removedOnCompletion = NO;
            //group.fillMode = kCAFillModeForwards;
            
            //group.autoreverses = YES;
            
            
            
            group.animations = @[scaleAnimation,rotateAnimation,moveAnimation];
            
            [self.redBall.layer addAnimation:group forKey:@"redAnimation_group"];
        }
            break;
            
        default:
            break;
    }
}


-(void)logSomething
{
    NSLog(@"%@",NSStringFromCGRect(self.redBall.frame));
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

@end
