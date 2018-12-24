//
//  CASpringAnimationVC.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/24.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "CASpringAnimationVC.h"

@interface CASpringAnimationVC ()

@end

@implementation CASpringAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(10, 80, 50, 50)];
    view1.backgroundColor = [UIColor redColor];
    [self.view addSubview:view1];
    
    CASpringAnimation * springAnimation = [CASpringAnimation animationWithKeyPath:@"position.x"];
    //mass:质量，影响图层运动时的弹簧惯性，质量越大，弹簧拉伸和压缩的幅度越大，动画的速度变慢，并且波动幅度变大
    springAnimation.mass = 0.5;
    //stiffness:刚度系数(劲度系数/弹性系数)，刚度系数越大，形变产生的力就越大，运动越快
    springAnimation.stiffness = 100;
    //damping:阻尼系数，阻止弹簧伸缩的系数，阻尼系数越大，停止越快
    springAnimation.damping = 0.1;
    //initialVelocity:初始速率，动画视图的初始速度大小速率为正数时，速度方向与运动方向一致，速率为负数时，速度方向与运动方向相反
    springAnimation.initialVelocity = 0;
    //settlingDuration:结算时间 返回弹簧动画到停止时的估算时间，根据当前的动画参数估算通常弹簧动画的时间使用结算时间比较准确
    NSLog(@"%f",springAnimation.settlingDuration);
//    springAnimation.fromValue =
    springAnimation.toValue = [NSValue valueWithCGPoint:CGPointMake(view1.center.x + 100, view1.center.y)];
    springAnimation.duration = springAnimation.settlingDuration;
    [view1.layer addAnimation:springAnimation forKey:@"springAnimation"];
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
