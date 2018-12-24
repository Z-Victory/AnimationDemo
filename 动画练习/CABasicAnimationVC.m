//
//  CABasicAnimationVC.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/20.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "CABasicAnimationVC.h"

@interface CABasicAnimationVC ()

@end

@implementation CABasicAnimationVC

- (void)viewDidLoad {
    [super viewDidLoad];
    lyhScrollView = [[UIScrollView alloc]initWithFrame:CGRectMake(0, 0, SCREEN_WIDTH, SCREEN_HEIGHT)];
    [self.view addSubview:lyhScrollView];
    //
    UIView * view1 = [[UIView alloc]initWithFrame:CGRectMake(10, 10, 40, 40)];
    view1.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view1];
    CABasicAnimation *moveAnimation = [CABasicAnimation animationWithKeyPath:@"position.x"];
    moveAnimation.duration = 2;//动画时间
    //动画起始值和终止值的设置
    moveAnimation.fromValue = @(view1.center.x);
    moveAnimation.toValue = @(view1.center.x+200);
    //一个时间函数，表示它以怎么样的时间运行
    moveAnimation.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseIn];
    moveAnimation.repeatCount = HUGE_VALF;
    //    moveAnimation.repeatDuration = 10;
    moveAnimation.removedOnCompletion = YES;
    /*
     kCAFillModeForwards :
     动画开始之后layer的状态将保持在动画的最后一帧，而removedOnCompletion的默认属性值是 YES，所以为了使动画结束之后layer保持结束状态，应将removedOnCompletion设置为NO。
     kCAFillModeBackwards :
     将会立即执行动画的第一帧，不论是否设置了 beginTime属性。观察发现，设置该值，刚开始视图不见，还不知道应用在哪里。
     kCAFillModeBoth
     该值是 kCAFillModeForwards 和 kCAFillModeBackwards的组合状态
     kCAFillModeRemoved
     动画将在设置的 beginTime 开始执行（如没有设置beginTime属性，则动画立即执行），动画执行完成后将会layer的改变恢复原状。
     */
    moveAnimation.fillMode = kCAFillModeForwards;
    //添加动画，后面有可以拿到这个动画的标识
    [view1.layer addAnimation:moveAnimation forKey:@"moveAnimation"];
    
    //kCAMediaTimingFunctionLinear
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view1) + 10, 40, 40)];
    view2.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view2];
    CABasicAnimation * moveAnimation2 = [CABasicAnimation animationWithKeyPath:@"position.x"];
    moveAnimation2.duration = 2;
    moveAnimation2.fromValue = @(view2.center.x);
    moveAnimation2.toValue = @(view2.center.x+200);
    moveAnimation2.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionLinear];
    moveAnimation2.repeatCount = HUGE_VALF;
    moveAnimation2.removedOnCompletion = YES;
    [view2.layer addAnimation:moveAnimation2 forKey:@"moveAnimation2"];
    
    //kCAMediaTimingFunctionEaseOut
    UIView * view3 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view2) + 10, 40, 40)];
    view3.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view3];
    CABasicAnimation * moveAnimation3 = [CABasicAnimation animationWithKeyPath:@"position.x"];
    moveAnimation3.duration = 2;
    moveAnimation3.fromValue = @(view3.center.x);
    moveAnimation3.toValue = @(view3.center.x+200);
    moveAnimation3.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseOut];
    moveAnimation3.repeatCount = HUGE_VALF;
    moveAnimation3.removedOnCompletion = YES;
    [view3.layer addAnimation:moveAnimation3 forKey:@"moveAnimation3"];
    
    //kCAMediaTimingFunctionEaseInEaseOut
    UIView * view4 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view3) + 10, 40, 40)];
    view4.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view4];
    CABasicAnimation * moveAnimation4 = [CABasicAnimation animationWithKeyPath:@"position.x"];
    moveAnimation4.duration = 2;
    moveAnimation4.fromValue = @(view4.center.x);
    moveAnimation4.toValue = @(view4.center.x+200);
    moveAnimation4.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    moveAnimation4.repeatCount = HUGE_VALF;
    moveAnimation4.removedOnCompletion = YES;
    [view4.layer addAnimation:moveAnimation4 forKey:@"moveAnimation4"];
    
    //kCAMediaTimingFunctionDefault
    UIView * view5 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view4) + 10, 40, 40)];
    //解决有时视图会闪动一下的问题，我们可以将layer的属性值设置为我们的动画最后要达到的值，然后再给我们的视图添加layer动画。
    view5.center = CGPointMake(230, DEF_BOTTOM(view4)+30);
    view5.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view5];
    CABasicAnimation * moveAnimation5 = [CABasicAnimation animationWithKeyPath:@"position.x"];
    moveAnimation5.duration = 2;
    moveAnimation5.fromValue = @(30);
    moveAnimation5.toValue = @(230);
    moveAnimation5.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    moveAnimation5.repeatCount = HUGE_VALF;
    // 以下两句 控制View动画结束后，停留在动画结束的位置
    moveAnimation5.removedOnCompletion = YES;
    //    moveAnimation6.removedOnCompletion = false;
    //    moveAnimation6.fillMode = kCAFillModeForwards;
    [view5.layer addAnimation:moveAnimation5 forKey:@"moveAnimation5"];
    
    //kCAMediaTimingFunctionDefault
    UIView * view6 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view5) + 10, 40, 40)];
    view6.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view6];
    CABasicAnimation * moveAnimation6 = [CABasicAnimation animationWithKeyPath:@"position.x"];
    moveAnimation6.duration = 2;
    moveAnimation6.fromValue = @(view6.center.x);
    moveAnimation6.toValue = @(view6.center.x+200);
    moveAnimation6.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionDefault];
    moveAnimation6.repeatCount = HUGE_VALF;
    moveAnimation6.fillMode = kCAFillModeRemoved;
    moveAnimation6.autoreverses = YES;
    moveAnimation6.removedOnCompletion = YES;
    [view6.layer addAnimation:moveAnimation6 forKey:@"moveAnimation6"];
    
    //transform.rotation.x
    UIView * view7 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view6) + 10, 40, 40)];
    view7.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view7];
    CABasicAnimation * moveAnimation7 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.x"];
    moveAnimation7.duration = 2;
    moveAnimation7.fromValue = @(0);
    moveAnimation7.toValue = @(2 * M_PI);
    moveAnimation7.repeatCount = HUGE_VALF;
    moveAnimation7.removedOnCompletion = YES;
    [view7.layer addAnimation:moveAnimation7 forKey:@"moveAnimation7"];
    
    //transform.rotation.y
    UIView * view8 = [[UIView alloc]initWithFrame:CGRectMake(DEF_RIGHT(view7) + 10, DEF_BOTTOM(view6) + 10, 40, 40)];
    view8.backgroundColor = [UIColor redColor];
    UILabel * label8 = [[UILabel alloc]initWithFrame:CGRectMake(0, 0, 40, 40)];
    label8.text = @"test";
    [view8 addSubview:label8];
    [lyhScrollView addSubview:view8];
    CABasicAnimation * moveAnimation8 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.y"];
    moveAnimation8.duration = 2;
    moveAnimation8.fromValue = @(0);
    moveAnimation8.toValue = @(M_PI);
    moveAnimation8.removedOnCompletion = YES;
//    moveAnimation8.repeatCount = HUGE_VALF;
    [view8.layer addAnimation:moveAnimation8 forKey:@"moveAnimation8"];
    
    //transform.rotation.z
    UIView * view9 = [[UIView alloc]initWithFrame:CGRectMake(DEF_RIGHT(view8) + 10, DEF_BOTTOM(view6) + 10, 40, 40)];
    view9.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view9];
    CABasicAnimation * moveAnimation9 = [CABasicAnimation animationWithKeyPath:@"transform.rotation.z"];
    moveAnimation9.duration = 2;
    moveAnimation9.fromValue = @(0);
    moveAnimation9.toValue = @(2 * M_PI);
    moveAnimation9.repeatCount = HUGE_VALF;
    moveAnimation9.removedOnCompletion = YES;
    [view9.layer addAnimation:moveAnimation9 forKey:@"moveAnimation9"];
    
    //背景颜色
    UIView * view10 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view9) + 10, 40, 40)];
    view10.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view10];
    CABasicAnimation * moveAnimation10 = [CABasicAnimation animationWithKeyPath:@"backgroundColor"];
    moveAnimation10.duration = 2;
    moveAnimation10.fromValue = (__bridge id _Nullable)([UIColor yellowColor].CGColor);
    moveAnimation10.toValue = (__bridge id _Nullable)([UIColor redColor].CGColor);
    moveAnimation10.repeatCount = HUGE_VALF;
    moveAnimation10.autoreverses = YES;
    moveAnimation10.removedOnCompletion = YES;
    [view10.layer addAnimation:moveAnimation10 forKey:@"moveAnimation10"];
    
    //内容变化
    UIImageView * view11 = [[UIImageView alloc]initWithFrame:CGRectMake(DEF_RIGHT(view10) + 10, DEF_BOTTOM(view9) + 10, 40, 40)];
    view11.image = [UIImage imageNamed:@"from"];
    [lyhScrollView addSubview:view11];
    CABasicAnimation * moveAnimation11 = [CABasicAnimation animationWithKeyPath:@"contents"];
    moveAnimation11.duration = 1;
    moveAnimation11.toValue = (__bridge id _Nullable)([UIImage imageNamed:@"to"].CGImage);
    moveAnimation11.repeatCount = HUGE_VALF;
    moveAnimation11.autoreverses = YES;
    moveAnimation11.removedOnCompletion = YES;
    [view11.layer addAnimation:moveAnimation11 forKey:@"moveAnimation11"];
    
    //圆角变化
    UIView * view12 = [[UIView alloc]initWithFrame:CGRectMake(DEF_RIGHT(view11) + 10, DEF_BOTTOM(view9) + 10, 40, 40)];
    view12.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view12];
    CABasicAnimation * moveAnimation12 = [CABasicAnimation animationWithKeyPath:@"cornerRadius"];
    moveAnimation12.duration = 2;
    moveAnimation12.toValue = @(20);
    moveAnimation12.repeatCount = HUGE_VALF;
    moveAnimation12.autoreverses = YES;
    [view12.layer addAnimation:moveAnimation12 forKey:@"moveAnimation12"];
    
    //比例缩放 transform.scale
    UIView * view13 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view12) + 10, 40, 40)];
    view13.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view13];
    CABasicAnimation * moveAnimation13 = [CABasicAnimation animationWithKeyPath:@"transform.scale"];
    moveAnimation13.duration = 2;
    moveAnimation13.fromValue = @(0.3);
    moveAnimation13.toValue = @(1.3);
    moveAnimation13.repeatCount = HUGE_VALF;
    moveAnimation13.autoreverses = YES;
    [view13.layer addAnimation:moveAnimation13 forKey:@"moveAnimation13"];
    
    
    //比例缩放 transform.scale.x
    UIView * view14 = [[UIView alloc]initWithFrame:CGRectMake(DEF_RIGHT(view13) + 30, DEF_BOTTOM(view12) + 10, 40, 40)];
    view14.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view14];
    CABasicAnimation * moveAnimation14 = [CABasicAnimation animationWithKeyPath:@"transform.scale.x"];
    moveAnimation14.duration = 2;
    moveAnimation14.fromValue = @(0.5);
    moveAnimation14.toValue = @(1.5);
    moveAnimation14.repeatCount = HUGE_VALF;
    moveAnimation14.autoreverses = YES;
    [view14.layer addAnimation:moveAnimation14 forKey:@"moveAnimation14"];
    
    
    //比例缩放 transform.scale.y
    UIView * view15 = [[UIView alloc]initWithFrame:CGRectMake(DEF_RIGHT(view14) + 30, DEF_BOTTOM(view12) + 10, 40, 40)];
    view15.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view15];
    CABasicAnimation * moveAnimation15 = [CABasicAnimation animationWithKeyPath:@"transform.scale.y"];
    moveAnimation15.duration = 2;
    moveAnimation15.fromValue = @(0.5);
    moveAnimation15.toValue = @(1.5);
    moveAnimation15.repeatCount = HUGE_VALF;
    moveAnimation15.autoreverses = YES;
    [view15.layer addAnimation:moveAnimation15 forKey:@"moveAnimation15"];
    
    
    //指定大小缩放
    UIView * view16 = [[UIView alloc]initWithFrame:CGRectMake(10, DEF_BOTTOM(view15) + 10, 40, 40)];
    view16.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view16];
    CABasicAnimation * moveAnimation16 = [CABasicAnimation animationWithKeyPath:@"bounds"];
    moveAnimation16.duration = 2;
//    moveAnimation16.fromValue = @(0.5);
    moveAnimation16.toValue = [NSValue valueWithCGRect:CGRectMake(0, 0, 70, 20)];
    moveAnimation16.repeatCount = HUGE_VALF;
    moveAnimation16.autoreverses = YES;
    [view16.layer addAnimation:moveAnimation16 forKey:@"moveAnimation16"];
    
    //透明度
    UIView * view17 = [[UIView alloc]initWithFrame:CGRectMake(DEF_RIGHT(view16) + 50, DEF_BOTTOM(view15) + 10, 40, 40)];
    view17.backgroundColor = [UIColor redColor];
    [lyhScrollView addSubview:view17];
    CABasicAnimation * moveAnimation17 = [CABasicAnimation animationWithKeyPath:@"opacity"];
    moveAnimation17.duration = 2;
    moveAnimation17.toValue = @(0.3);
    moveAnimation17.repeatCount = HUGE_VALF;
    moveAnimation17.autoreverses = YES;
    [view17.layer addAnimation:moveAnimation17 forKey:@"moveAnimation17"];
    
    lyhScrollView.contentSize = CGSizeMake(SCREEN_WIDTH, DEF_BOTTOM(view16));
    
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
