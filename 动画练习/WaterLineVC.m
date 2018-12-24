//
//  tViewController.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/24.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "WaterLineVC.h"

@interface WaterLineVC ()
@end

@implementation WaterLineVC

- (void)viewDidLoad {
    [super viewDidLoad];
    WaterRippleView * waterView = [[WaterRippleView alloc]initWithFrame:CGRectMake(0, 100, SCREEN_WIDTH, 100) mainRippleColor:[UIColor whiteColor] minorRippleColor:[UIColor blueColor]];
    [self.view addSubview:waterView];
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
