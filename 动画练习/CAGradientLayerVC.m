//
//  CASpringAnimationViewController.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/24.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "CAGradientLayerVC.h"

@interface CAGradientLayerVC ()

@end

@implementation CAGradientLayerVC

- (void)viewDidLoad {
    [super viewDidLoad];
    //渐变色
    CAGradientLayer *gradientLayer = [CAGradientLayer layer];
    gradientLayer.frame = self.view.bounds;
    [self.view.layer addSublayer:gradientLayer];
    
    UIColor *lightColor = [UIColor colorWithRed:40.0 / 255.0 green:150.0 / 255.0 blue:200.0 / 255.0 alpha:1.0];
    
//    UIColor *whiteColor = [UIColor colorWithRed:255.0 / 255.0 green:250.0 / 255.0 blue:250.0 / 255.0 alpha:1.0];
    UIColor * blueColor = [UIColor blueColor];
    UIColor *pinkColor = [UIColor colorWithRed:219.0 / 255.0 green:118.0 / 255.0 blue:95.0 / 255.0 alpha:1.0];
    
    UIColor *purpleColor = [UIColor colorWithRed:186.0 / 255.0 green:124.0 / 255.0 blue:214.0 / 255.0 alpha:1.0];
    //可以设置多个colors,
    gradientLayer.colors = @[(__bridge id)lightColor.CGColor,(__bridge id)blueColor.CGColor,(__bridge id)pinkColor.CGColor,(__bridge id)purpleColor.CGColor];
    //45度变色(由lightColor－>white)
    gradientLayer.startPoint = CGPointMake(0, 0);
    gradientLayer.endPoint = CGPointMake(1, 1);
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
