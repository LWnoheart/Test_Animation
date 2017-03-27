//
//  SuperViewController.h
//  Test_Animation
//
//  Created by 李巍 on 2017/3/24.
//  Copyright © 2017年 李巍. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "Masonry.h"
#define WS(weakSelf)  __weak __typeof(&*self)weakSelf = self;
@interface SuperViewController : UIViewController<UICollectionViewDelegate>

@property (nonatomic,strong)NSArray<NSString *> *selectArray;

-(void)resetAnimationUI;

-(void)logSomething;

- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath;

@end
