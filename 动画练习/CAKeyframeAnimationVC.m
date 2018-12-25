//
//  CAKeyframeAnimationVC.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/20.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "CAKeyframeAnimationVC.h"

@interface CAKeyframeAnimationVC ()

@end

@implementation CAKeyframeAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    UIView * view = [[UIView alloc]initWithFrame:CGRectMake(0, 0, 50, 50)];
    view.backgroundColor = [UIColor redColor];
    [self.view addSubview:view];
    
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithOvalInRect:CGRectMake(100, 100, 100, 300)];
    
    CAKeyframeAnimation * keyAnimation = [CAKeyframeAnimation animationWithKeyPath:@"position"];
    keyAnimation.duration = 5;
    keyAnimation.path = bezierPath.CGPath;
    keyAnimation.calculationMode = kCAAnimationPaced;
    keyAnimation.fillMode = kCAFillModeForwards;
    keyAnimation.repeatCount = HUGE_VALF;
    keyAnimation.rotationMode = kCAAnimationRotateAutoReverse;
    [view.layer addAnimation:keyAnimation forKey:@"keyAnimation"];
    
    CAShapeLayer * shalayer = [[CAShapeLayer alloc]init];
    shalayer.strokeColor = [UIColor purpleColor].CGColor;
    shalayer.fillColor = [UIColor clearColor].CGColor;
    shalayer.lineWidth = 0.5;
    shalayer.lineJoin = kCALineJoinRound;
    shalayer.lineCap = kCALineCapRound;
    shalayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shalayer];
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
