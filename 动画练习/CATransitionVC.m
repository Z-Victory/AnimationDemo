//
//  CATransitionVC.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/20.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "CATransitionVC.h"

@interface CATransitionVC ()<CAAnimationDelegate>
{
    NSArray * transitionArray;
    UILabel * transitionLab;
    UIButton * btn;
    int index;
}
@end

@implementation CATransitionVC

- (void)viewDidLoad {
    [super viewDidLoad];
    index = 0;
    transitionArray = @[@"cube", @"suckEffect", @"rippleEffect", @"pageCurl", @"pageUnCurl", @"oglFlip", @"cameraIrisHollowOpen", @"cameraIrisHollowClose", @"spewEffect", @"genieEffect", @"unGenieEffect", @"twist", @"tubey", @"swirl", @"charminUltra", @"zoomyIn", @"zoomyOut", @"oglApplicationSuspend"];
    
    self.view.backgroundColor = [UIColor whiteColor];
    transitionLab = [[UILabel alloc]initWithFrame:CGRectMake(0,0,200,300)];
    transitionLab.center = CGPointMake(375/2,667/2);
    transitionLab.backgroundColor = [UIColor redColor];
    transitionLab.font = [UIFont systemFontOfSize:20];
    transitionLab.numberOfLines = 0;
    transitionLab.textColor = [UIColor blueColor];
    transitionLab.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:transitionLab];
    
    btn = [[UIButton alloc]init];
    btn.backgroundColor = [UIColor blueColor];
    btn.frame = CGRectMake(0,0,50,40);
    btn.center = CGPointMake(375/2,640);
    [btn setTitle:@"动画" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(btnAction) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
}
- (void)btnAction{
    
    CATransition * pageCurlAnim = [[CATransition alloc]init];
    
    pageCurlAnim.delegate = self;
    pageCurlAnim.duration = 1.0;
    pageCurlAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
    pageCurlAnim.type = transitionArray[index];
    pageCurlAnim.subtype = kCATransitionFromLeft;
    pageCurlAnim.repeatCount = 1;
    [pageCurlAnim setValue:@"transitionAnim" forKey:@"anim"];
    [transitionLab.layer addAnimation:pageCurlAnim forKey:@"transition"];
    transitionLab.text = [NSString stringWithFormat:@"动画效果：%@",transitionArray[index]];
}

- (void)animationDidStop:(CAAnimation *)anim finished:(BOOL)flag{
    index = (index < transitionArray.count - 1) ? index + 1 : 0;
//    if (flag) {
//        CATransition * pageCurlAnim = [[CATransition alloc]init];
//        pageCurlAnim.delegate = self;
//        pageCurlAnim.duration = 1.0;
//        pageCurlAnim.timingFunction = [CAMediaTimingFunction functionWithName:kCAMediaTimingFunctionEaseInEaseOut];
//        pageCurlAnim.type = transitionArray[index];
//        pageCurlAnim.subtype = kCATransitionFromLeft;
//        pageCurlAnim.autoreverses = true;
//        pageCurlAnim.repeatCount = 1;
//        [pageCurlAnim setValue:@"transitionAnim" forKey:@"anim"];
//        [transitionLab.layer addAnimation:pageCurlAnim forKey:@"transition"];
//        transitionLab.text = [NSString stringWithFormat:@"动画效果：%@",transitionArray[index]];
//    }
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
