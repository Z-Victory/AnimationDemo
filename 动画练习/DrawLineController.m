//
//  DrawLineController.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/20.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "DrawLineController.h"
@interface DrawLineController ()

@end

#define kLineW SCREEN_WIDTH-10*2
#define kMargin 120
@implementation DrawLineController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor whiteColor];
    UIView * tempView = [[UIView alloc]initWithFrame:CGRectMake(50,60,200,100)];
    UIBezierPath * bezierPath = [UIBezierPath bezierPathWithOvalInRect:tempView.frame];
    
    CAShapeLayer * shapeLayer = [[CAShapeLayer alloc]init];
    shapeLayer.strokeColor = [UIColor purpleColor].CGColor;
    shapeLayer.fillColor = [UIColor clearColor].CGColor;
    shapeLayer.lineWidth = 10;
    shapeLayer.lineJoin = kCALineJoinRound;
    shapeLayer.lineCap = kCALineCapRound;
    shapeLayer.path = bezierPath.CGPath;
    [self.view.layer addSublayer:shapeLayer];
    
    CABasicAnimation * pathAnim = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    pathAnim.duration = 2.0;
    pathAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    pathAnim.fromValue = @(0);
    pathAnim.toValue = @(1);
    //    pathAnim.autoreverses = true;
    pathAnim.fillMode = kCAFillModeForwards;
    //    [pathAnim setRemovedOnCompletion:false];
    pathAnim.repeatCount = HUGE_VALF;
    [shapeLayer addAnimation:pathAnim forKey:@"pathAnim"];
    
    
    
    
    //透明度
    UIView * view17 = [[UIView alloc]initWithFrame:CGRectMake(50, 200, 200, 300)];
    view17.backgroundColor = [UIColor redColor];
    view17.alpha = 0;
    [self.view addSubview:view17];
    CABasicAnimation * moveAnimation17 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    moveAnimation17.duration = 0.5;
    moveAnimation17.toValue = @(1);
    moveAnimation17.repeatCount = HUGE_VALF;
    moveAnimation17.autoreverses = YES;
    [view17.layer addAnimation:moveAnimation17 forKey:@"moveAnimation17"];
    
    
    // 示例代码:
    // 1. 绘制一条直线,即一次贝塞尔曲线
    UIBezierPath *path = [[UIBezierPath alloc] init];
    path.lineWidth = 1.f;
    path.lineCapStyle = kCGLineCapRound;
    path.lineJoinStyle = kCGLineCapRound;
    path.miterLimit = 10.f;
    path.flatness = 10.f;
    path.usesEvenOddFillRule = YES;
    // 设置起始点
    [path moveToPoint:CGPointMake(30, 120)];
    // 添加子路径
    [path addLineToPoint:CGPointMake(70, 170)];//添加一条子路径
    [path addLineToPoint:CGPointMake(150, 70)]; // 再添加一条路径
    // 根据坐标点连线
    [path stroke];

    CAShapeLayer * yesShape = [[CAShapeLayer alloc]init];
    yesShape.strokeColor = [UIColor blueColor].CGColor;
    yesShape.fillColor = [UIColor clearColor].CGColor;
    yesShape.lineJoin = kCALineJoinRound;
    yesShape.lineCap = kCALineCapRound;
    yesShape.path = path.CGPath;
    yesShape.lineWidth = 20;
    [view17.layer addSublayer:yesShape];
    
    CABasicAnimation * yesAnimation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    yesAnimation.duration = 1;
    yesAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    yesAnimation.fromValue = @(0);
    yesAnimation.toValue = @(1);
    yesAnimation.fillMode = kCAFillModeForwards;
    yesAnimation.repeatCount = HUGE_VALF;
    [yesShape addAnimation:yesAnimation forKey:@"yesAnimation"];
    
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
