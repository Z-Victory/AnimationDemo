//
//  ViewController.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/19.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "ViewController.h"
#import "LYHHeader.h"
#import "CABasicAnimationVC.h"

@interface ViewController ()<UITableViewDelegate,UITableViewDataSource>
{
    UITableView * lyhTableView; //tableview
    NSArray * titleArray;       //tableview数据
    NSArray * classNameArray;   //控制器名字
}
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.title = @"核心动画";
    classNameArray = @[@"CABasicAnimationVC",@"CAKeyframeAnimationVC",@"DrawLineController",@"CATransitionVC",@"CASpringAnimationVC",@"CAGradientLayerVC",@"CAEmitterVC",@"WaterLineVC"];
    titleArray = @[@"基础动画CABasicAnimation",@"帧动画CAKeyframeAnimation",@"画线动画DrawLine",@"转场动画CATransitionVC",@"弹簧动画CASpringAnimationVC",@"渐变色CAGradientLayerVC",@"粒子动画CAEmitterVC(下雪+火焰)",@"水波纹"];
    lyhTableView = [[UITableView alloc] initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT) style:UITableViewStyleGrouped];
    lyhTableView.delegate = self;
    lyhTableView.dataSource = self;
    [self.view addSubview:lyhTableView];
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return titleArray.count;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    return @"动画基础示例";
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    static NSString * cellid = @"cell";
    UITableViewCell * cell = [lyhTableView dequeueReusableCellWithIdentifier:cellid];
    if (cell == nil) {
        cell = [[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:cellid];
    }
    cell.textLabel.text = titleArray[indexPath.row];
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    if (indexPath.row == 0) {
        CABasicAnimationVC * vc = [[CABasicAnimationVC alloc]init];
        [self.navigationController pushViewController:vc animated:YES];
    } else {
        NSString * classString = classNameArray[indexPath.row];
        Class  classNamee = NSClassFromString(classString);
        UIViewController * controller = [[classNamee alloc] init];
        [self.navigationController pushViewController:controller animated:YES];
    }
    
}

@end
