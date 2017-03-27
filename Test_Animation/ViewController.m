//
//  ViewController.m
//  Test_Animation
//
//  Created by 李巍 on 2017/3/23.
//  Copyright © 2017年 李巍. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)NSDictionary *dataDic;;
@end

static NSString *tableViewIdentifier = @"tableViewIdentifier_";

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:tableViewIdentifier];
}


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataDic.allKeys.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:tableViewIdentifier forIndexPath:indexPath];
    cell.textLabel.text = self.dataDic.allKeys[indexPath.row];
    return cell;
}

-(NSDictionary *)dataDic
{
    if (!_dataDic) {
        _dataDic = @{@"基础动画":@"BasicViewController",
                     @"提示动画":@"TipsViewController",
                     @"页面缩进动画":@"PageScaleViewController",
                     @"UIViewAnimation实现波浪":@"WaveViewController",
                     @"facebook基础":@"PopBasicViewController"
                     };
    }
    return _dataDic;
}


- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *key = self.dataDic.allKeys[indexPath.row];
    Class vcClass = NSClassFromString([self.dataDic objectForKey:key]);
    UIViewController *vc = [[vcClass alloc]init];
    vc.title = key;
    [self.navigationController pushViewController:vc animated:YES];
}
@end
