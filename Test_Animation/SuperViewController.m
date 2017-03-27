//
//  SuperViewController.m
//  Test_Animation
//
//  Created by 李巍 on 2017/3/24.
//  Copyright © 2017年 李巍. All rights reserved.
//

#import "SuperViewController.h"

@interface SuperViewController ()<UICollectionViewDataSource>
@property (nonatomic,strong)UICollectionView *selectView;
@end

@interface LabelCell : UICollectionViewCell
@property (nonatomic,strong)UILabel *textLabel;
@end
static NSString *collectIden = @"collectIden";
@implementation SuperViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    UIBarButtonItem *resetBarItem = [[UIBarButtonItem alloc]initWithTitle:@"重置" style:UIBarButtonItemStylePlain target:self action:@selector(resetAnimationUI)];
    UIBarButtonItem *logBarItem = [[UIBarButtonItem alloc]initWithTitle:@"log" style:UIBarButtonItemStylePlain target:self action:@selector(logSomething)];
    self.navigationItem.rightBarButtonItems = @[logBarItem,resetBarItem];
    
    WS(this);
    self.automaticallyAdjustsScrollViewInsets = NO;
    UICollectionViewFlowLayout *layout = [[UICollectionViewFlowLayout alloc]init];
    layout.scrollDirection = UICollectionViewScrollDirectionHorizontal;
    layout.estimatedItemSize = CGSizeMake(20, 20);
    layout.minimumLineSpacing = 10;
    layout.sectionInset = UIEdgeInsetsMake(0, 10, 0, 10);
    self.selectView = [[UICollectionView alloc]initWithFrame:CGRectZero collectionViewLayout:layout];
    [self.selectView registerClass:[LabelCell class] forCellWithReuseIdentifier:collectIden];
    self.selectView.backgroundColor = [UIColor whiteColor];
    self.selectView.showsHorizontalScrollIndicator = NO;
    self.selectView.delegate = self;
    self.selectView.dataSource = self;
    [self.view addSubview:self.selectView];
    [self.selectView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.equalTo(this.view);
        make.bottom.equalTo(this.view).offset(-10);
        make.height.mas_equalTo(@20);
    }];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section
{
    return self.selectArray.count;
}


- (__kindof UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath
{
    LabelCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:collectIden forIndexPath:indexPath];
    cell.textLabel.text = self.selectArray[indexPath.row];
    return cell;
}

-(void)setSelectArray:(NSArray<NSString *> *)selectArray
{
    _selectArray = selectArray;
    [self.selectView reloadData];
}

-(void)resetAnimationUI
{
    
}

-(void)logSomething
{
    
}
- (void)collectionView:(UICollectionView *)collectionView didSelectItemAtIndexPath:(NSIndexPath *)indexPath
{
    
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




@implementation LabelCell
-(id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        WS(this);
        self.textLabel = [[UILabel alloc]init];
        self.textLabel.font = [UIFont systemFontOfSize:14];
        self.textLabel.textColor = [UIColor darkGrayColor];
        self.textLabel.layer.cornerRadius = 3;
        self.textLabel.layer.borderWidth = 1;
        self.textLabel.layer.borderColor = [UIColor magentaColor].CGColor;
        [self.contentView addSubview:self.textLabel];
        [self.textLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.top.bottom.equalTo(this.contentView);
        }];
    }
    return self;
}
@end
