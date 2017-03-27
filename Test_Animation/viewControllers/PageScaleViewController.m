//
//  PageScaleViewController.m
//  Test_Animation
//
//  Created by 李巍 on 2017/3/25.
//  Copyright © 2017年 李巍. All rights reserved.
//

#import "PageScaleViewController.h"
#import "JNWSpringAnimation.h"

@interface PageScaleViewController ()
@property (nonatomic,strong)UIView *appBackground;
@property (nonatomic,strong)UIView *mapView;
@property (nonatomic,assign)BOOL mapShowing;
@end

@implementation PageScaleViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    // Do any additional setup after loading the view.
    self.selectArray = @[@"缩进"];
    
    self.appBackground = [[UIImageView alloc] initWithFrame:CGRectMake(0, 64,self.view.bounds.size.width, self.view.bounds.size.height-64-30)];
    self.appBackground.backgroundColor = [UIColor greenColor];
    self.appBackground.layer.cornerRadius = 15;
    [self.view addSubview:self.appBackground];
    
    
    self.mapView = [[UIView alloc] initWithFrame:CGRectMake(0, 102, self.view.bounds.size.width, self.view.bounds.size.height-103-30)];
    self.mapView.backgroundColor = [UIColor redColor];
    self.mapView.alpha = 0.0f;
    self.mapView.transform = CGAffineTransformMakeTranslation(0, 30);
    self.mapView.transform = CGAffineTransformScale(self.mapView.transform, 1.1, 1.1);
    [self.view addSubview:self.mapView];
    
    self.mapShowing = NO;
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(void)logSomething
{
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
            if (self.mapShowing) {
                self.mapShowing = NO;
                // 再次使用这些动画相同的damping和stiffness
                // 这样我们就可以获取CGFloat形式的值。注意这个值会高一点
                // 意味着动画会花费更少的时间（在匹配此damping和stiffness的弹簧动画下）。
                // 少时间是好的，因为我们要回到界面的默认状态，而此时用户只想让地图赶紧消失。
                CGFloat dampingStiffnessOut = 24.0f;
                
                // 再说一次，从当前状态开始很重要，这样用户点击按钮时就不会抽动
                [UIView animateWithDuration:.5 delay:0
                                    options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     self.appBackground.alpha = 1.0f;
                                 } completion:NULL];
                
                [UIView animateWithDuration:.3 delay:0
                                    options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     self.mapView.alpha = 0.0f;
                                 } completion:NULL];
                
                // 地图有两个分开的动画，一个是位置一个是比例。
                // 我们通过presentationLayer获取@“transform.scale”的变化的值，如之前的例子一样
                JNWSpringAnimation *mapScale =
                [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
                mapScale.damping = dampingStiffnessOut;
                mapScale.stiffness = dampingStiffnessOut;
                mapScale.mass = 1;
                mapScale.fromValue =
                @([[self.mapView.layer.presentationLayer
                    valueForKeyPath:mapScale.keyPath] floatValue]);
                mapScale.toValue = @(1.1);
                
                [self.mapView.layer addAnimation:mapScale forKey:mapScale.keyPath];
                self.mapView.transform =
                CGAffineTransformScale(CGAffineTransformIdentity, 1.1, 1.1);
                
                JNWSpringAnimation *mapTranslate =
                [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
                mapTranslate.damping = dampingStiffnessOut;
                mapTranslate.stiffness = dampingStiffnessOut;
                mapTranslate.mass = 1;
                mapTranslate.fromValue =
                @([[self.mapView.layer.presentationLayer
                    valueForKeyPath:mapTranslate.keyPath] floatValue]);
                mapTranslate.toValue = @(30);
                
                [self.mapView.layer addAnimation:mapTranslate forKey:mapTranslate.keyPath];
                self.mapView.transform = CGAffineTransformTranslate(self.mapView.transform, 0, 30);
                
                // 主app背景的比例动画。我们将其动画回1.0倍
                JNWSpringAnimation *scale =
                [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
                scale.damping = dampingStiffnessOut;
                scale.stiffness = dampingStiffnessOut;
                scale.mass = 1;
                scale.fromValue =
                @([[self.appBackground.layer.presentationLayer
                    valueForKeyPath:@"transform.scale.x"] floatValue]);
                scale.toValue = @(1.0);
                
                [self.appBackground.layer addAnimation:scale forKey:scale.keyPath];
                self.appBackground.transform =
                CGAffineTransformScale(CGAffineTransformIdentity, 1.0, 1.0);
            }else{
                self.mapShowing = YES;
                
                [UIView animateWithDuration:.5 delay:0
                                    options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState
                                 animations:^{
                                     self.appBackground.alpha = 0.3f;
                                 } completion:NULL];
                
                [UIView animateWithDuration:.15 delay:0
                                    options:UIViewAnimationOptionCurveEaseInOut|UIViewAnimationOptionBeginFromCurrentState 
                                 animations:^{
                                     self.mapView.alpha = 1.0f;
                                 } completion:NULL];
                //UIViewAnimationOptionCurveEaseInOut用来定义动画的淡入淡出，UIViewAnimationOptionBeginFromCurrentState会从其alpha的当前值开始动画，这样即使动画被打断了，它也不会跳回开始动画前的初始值。
                
                
                CGFloat dampingStiffness = 16.0f;
                
                // 主app背景的比例动画
                JNWSpringAnimation *scale =
                [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
                scale.damping = dampingStiffness;
                scale.stiffness = dampingStiffness;
                scale.mass = 1;
                scale.fromValue = @([[self.appBackground.layer.presentationLayer
                                      valueForKeyPath:scale.keyPath] floatValue]);
                scale.toValue = @(0.9);
                
                [self.appBackground.layer addAnimation:scale forKey:scale.keyPath];
                self.appBackground.transform =
                CGAffineTransformScale(CGAffineTransformIdentity, .9, .9);
                
                
                // 地图有两个分开的动画，一个用于位置，一个用于比例
                JNWSpringAnimation *mapScale =
                [JNWSpringAnimation animationWithKeyPath:@"transform.scale"];
                mapScale.damping = dampingStiffness;
                mapScale.stiffness = dampingStiffness;
                mapScale.mass = 1;
                mapScale.fromValue =
                @([[self.mapView.layer.presentationLayer valueForKeyPath:mapScale.keyPath] floatValue]);
                mapScale.toValue = @(1.0);
                
                [self.mapView.layer addAnimation:mapScale forKey:mapScale.keyPath];
                self.mapView.transform = CGAffineTransformScale(CGAffineTransformIdentity, 1, 1);
                
                JNWSpringAnimation *mapTranslate =
                [JNWSpringAnimation animationWithKeyPath:@"transform.translation.y"];
                mapTranslate.damping = dampingStiffness;
                mapTranslate.stiffness = dampingStiffness;
                mapTranslate.mass = 1;
                mapTranslate.fromValue =
                @([[self.mapView.layer.presentationLayer valueForKeyPath:mapTranslate.keyPath] floatValue]);
                mapTranslate.toValue = @(0);
                
                [self.mapView.layer addAnimation:mapTranslate forKey:mapTranslate.keyPath];
                self.mapView.transform = CGAffineTransformTranslate(self.mapView.transform, 0, 0);
            }
        }
            break;
            
        default:
            break;
    }
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
