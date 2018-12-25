//
//  BlockAnimationVC.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/25.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "BlockAnimationVC.h"

@interface BlockAnimationVC ()
@property(nonatomic, strong) NSMutableArray * viewArray;
@end

@implementation BlockAnimationVC
- (UIColor *)RandomColor {
    NSInteger aRedValue = arc4random() % 255;
    NSInteger aGreenValue = arc4random() % 255;
    NSInteger aBlueValue = arc4random() % 255;
    UIColor *randColor = [UIColor colorWithRed:aRedValue / 255.0f green:aGreenValue / 255.0f blue:aBlueValue / 255.0f alpha:1.0f];
    return randColor;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    for (int i = 0; i< 8; i++) {
        UIView * view = [[UIView alloc]init];
        view.backgroundColor = [self RandomColor];
        view.frame = CGRectMake(0,(40 + 10),40,40);
        [self.viewArray addObject:view];
        [self.view addSubview:view];
    }
    
    
    //属性动画
    
    
    [UIView beginAnimations:nil  context:nil];
    [UIView setAnimationDelay:1];
    [UIView setAnimationDuration:2];
    [UIView setAnimationRepeatCount:100];
    [UIView setAnimationRepeatAutoreverses:  YES];                      //  翻转
    [UIView setAnimationCurve:UIViewAnimationCurveEaseInOut];           //  设置动画变化的曲线
    UIView * view = self.viewArray[0];
    view.alpha = 0;
    view.center = CGPointMake(view.center.x  +  300,  view.center.y);
    [UIView setAnimationDelegate:self];                                 //  设置代理  监测动画结束的
    [UIView setAnimationDidStopSelector:@selector(shopAction)];
    [UIView commitAnimations];
    /*
          其中    setAnimationCurve 参数为
       UIViewAnimationCurveEaseInOut：这种曲线的动画开始缓慢，在其持续时间的中间加速，然后在完成之
     前再次减慢。这是大多数动画的默认曲线。
       UIViewAnimationCurveEaseIn：动画开始时缓慢，然后加速，直到动画结束。这里选用这种类型动画曲
     线。
       UIViewAnimationCurveEaseOut：动画开始时速度很快，在结束前开始减速。
       UIViewAnimationCurveLinear：在动画持续时间内，动画匀速运行。
    */
    
    
    
    //闭包动画
    
    // 顺时针旋转
    [UIView animateWithDuration:0.5 animations:^{
        
        UIView *view = self.viewArray[4];
        view.transform = CGAffineTransformRotate(view.transform, M_2_PI);
    }];
    
    //宽高伸缩比例;
    [UIView animateKeyframesWithDuration:2 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        UIView *view = self.viewArray[5];
        view.transform = CGAffineTransformMakeScale(2, 1);
    } completion:^(BOOL finished) {
        if (finished) {
            UIView *view = self.viewArray[5];
            view.backgroundColor = [UIColor colorWithRed: arc4random()%256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256/ 255.0  alpha:1.0];
        }
    }];
    
    //xy移动距离;
    [UIView animateKeyframesWithDuration:5 delay:0 options:UIViewKeyframeAnimationOptionRepeat animations:^{
        UIView *view = self.viewArray[6];
        view.transform = CGAffineTransformMakeTranslation(300, 6);
    } completion:^(BOOL finished) {
        if (finished) {
            UIView *view = self.viewArray[6];
            view.backgroundColor = [UIColor colorWithRed: arc4random()%256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256/ 255.0  alpha:1.0];
        }
    }];
    
    
    [UIView animateWithDuration:0.5 delay:0 options:UIViewAnimationOptionRepeat animations:^{
        UIView *view = self.viewArray[7];
        view.transform = CGAffineTransformMake(1.5, 1, 2, 2, 1,1);//自定义形变,参数自拟;
    } completion:^(BOOL finished) {
        if (finished) {
            UIView *view = self.viewArray[7];
            view.backgroundColor = [UIColor colorWithRed: arc4random()%256 / 255.0 green:arc4random()%256 / 255.0 blue:arc4random()%256/ 255.0  alpha:1.0];
        }
        
    }];
    
    
    // 弹簧效果
    /*
     一  动画执行的时间
     二  动画延迟执行的时间
     三  弹簧震动的频率 0 - 1 值越小频率越高
     四 弹簧的起始抖动的速度
     五 代表动画的效果
     六 具体执行的动画
     七 执行完之后 的操作
     */
    [UIView animateWithDuration:1 delay:0 usingSpringWithDamping:0.1 initialSpringVelocity:10 options:UIViewAnimationOptionCurveLinear animations:^{
        UIView *view = self.viewArray[8];
        if (view.center.x > [UIScreen mainScreen].bounds.size.width) {
            view.center = CGPointMake(0, view.center.y);
        }else{
            view.center = CGPointMake(view.center.x + 10, view.center.y);
        }
    } completion:^(BOOL finished) {
        
    }];
    
    
    
    /*
     转场动画相关的参数
     
     UIViewAnimationOptionTransitionNone            //无转场动画
     UIViewAnimationOptionTransitionFlipFromLeft    //转场从左翻转
     UIViewAnimationOptionTransitionFlipFromRight   //转场从右翻转
     UIViewAnimationOptionTransitionCurlUp          //上卷转场
     UIViewAnimationOptionTransitionCurlDown        //下卷转场
     UIViewAnimationOptionTransitionCrossDissolve   //转场交叉消失
     UIViewAnimationOptionTransitionFlipFromTop     //转场从上翻转
     UIViewAnimationOptionTransitionFlipFromBottom  //转场从下翻转
     */
    UIView * view2 = [[UIView alloc]initWithFrame:CGRectMake(0, 70, 40, 40)];
    UIView * view3 = [[UIView alloc]initWithFrame:CGRectMake(0, 70, 40, 40)];
    [self.view addSubview:view2];
    [self.view addSubview:view3];
    view3.backgroundColor = [UIColor orangeColor];
    [UIView transitionWithView:view3 duration:1 options:UIViewAnimationOptionTransitionFlipFromTop animations:^{
        view2.hidden = NO;
        view3.hidden = YES;
    } completion:^(BOOL finished) {
        
    }];
    
}
- (void)shopAction{
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
