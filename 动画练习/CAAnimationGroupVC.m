//
//  CAAnimationGroupVC.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/25.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "CAAnimationGroupVC.h"

@interface CAAnimationGroupVC ()

@end

@implementation CAAnimationGroupVC

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    /* 组动画有两种方式，1.一个动画一个动画的添加上去；2.使用group整组添加 */
    
    //第一种方式
    UIView * subView = [[UIView alloc]initWithFrame:CGRectMake(0, 100, 100, 100)];
    subView.backgroundColor = [UIColor redColor];
    [self.view addSubview:subView];
    
    CABasicAnimation * animation1 = [CABasicAnimation animationWithKeyPath:@"position.y"];
    animation1.duration = 2;
    animation1.repeatCount = 3;
//    animation1.beginTime = 1;
    animation1.fromValue = @(subView.center.y);
    animation1.toValue = @(subView.center.y + 200);
    animation1.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    animation1.removedOnCompletion = NO;
    animation1.autoreverses = YES;
    animation1.fillMode = kCAFillModeForwards;
//    [subView.layer addAnimation:animation1 forKey:@"animation1"];
    
    
    CABasicAnimation * animation2 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    animation2.duration = 2;
    animation2.repeatCount = HUGE_VALF;
    //    animation2.beginTime = 1;
    //    animation2.fromValue = [NSValue valueWithCGPoint:CGPointMake(0, 200)];
    animation2.toValue = @(M_PI);
    animation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    animation1.removedOnCompletion = NO;
    animation2.fillMode = kCAFillModeForwards;
    animation2.autoreverses = YES;
//    [subView.layer addAnimation:animation2 forKey:@"animation2"];
    
    //第2种方式，也是推荐的方式
    CAAnimationGroup * groupAnimation = [[CAAnimationGroup alloc]init];
    groupAnimation.animations = @[animation1,animation2];
    groupAnimation.duration = 2;
    groupAnimation.repeatCount = HUGE_VALF;
    groupAnimation.autoreverses = YES;
    [subView.layer addAnimation:groupAnimation forKey:@"groupAnimation"];
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
