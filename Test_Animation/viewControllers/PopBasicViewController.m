//
//  PopBasicViewController.m
//  Test_Animation
//
//  Created by 李巍 on 2017/3/27.
//  Copyright © 2017年 李巍. All rights reserved.
//

#import "PopBasicViewController.h"
//#import <pop/pop.h>
@interface PopBasicViewController ()
@property (nonatomic,strong)UIView *redBall;
@end

@implementation PopBasicViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = [UIColor whiteColor];
    [self resetAnimationUI];
    
    self.selectArray = @[@"弹性放大"];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


-(void)resetAnimationUI
{
    [self.redBall removeFromSuperview];
    self.redBall = [[UIView alloc] initWithFrame:CGRectMake(50, 60+64, 50, 50)];
    self.redBall.backgroundColor = [UIColor redColor];
    self.redBall.layer.cornerRadius = 0;
    [self.view addSubview:self.redBall];
    //https://github.com/Cloudox/Motion-Design-for-iOS
}

-(void)logSomething
{
    
}

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    switch (indexPath.row) {
        case 0:
        {
//            POPSpringAnimation *scale =
//            [POPSpringAnimation animationWithPropertyNamed:kPOPViewScaleXY];
//            scale.toValue = [NSValue valueWithCGPoint:CGPointMake(2, 2)];
//            scale.springBounciness = 20.0f; // Between 0-20
//            scale.springSpeed = 1.0f; // Between 0-20
//            [self.redBall pop_addAnimation:scale forKey:@"scale"];
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
