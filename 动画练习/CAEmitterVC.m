//
//  CAEmitterVC.m
//  动画练习
//
//  Created by 刘亚和 on 2018/12/24.
//  Copyright © 2018 刘亚和. All rights reserved.
//

#import "CAEmitterVC.h"

@interface CAEmitterVC ()

@end

@implementation CAEmitterVC

- (void)viewDidLoad {
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    CAEmitterCell * cell = [[CAEmitterCell alloc]init];
    //展示的图片
    cell.contents = (__bridge id _Nullable)([UIImage imageNamed:@"snowflake.png"].CGImage);
    
    //每秒粒子产生个数的乘数因子，会和layer的birthRate相乘，然后确定每秒产生的粒子个数
    cell.birthRate = 10;
    //每个粒子存活时长
    cell.lifetime = 5.0;
    //粒子生命周期范围
    cell.lifetimeRange = 0.3;
    //粒子透明度变化，设置为－0.4，就是每过一秒透明度就减少0.4，这样就有消失的效果,一般设置为负数。
    cell.alphaSpeed = -0.2;
    cell.alphaRange = 0.5;
    //粒子的速度
    cell.velocity = 20;
    //粒子的速度范围
    cell.velocityRange = 10;
    //周围发射的角度，如果为M_PI*2 就可以从360度任意位置发射
    //cell.emissionRange = M_PI*2;
    //粒子内容的颜色
    //    cell.color = [[UIColor whiteColor] CGColor];
    
    //设置了颜色变化范围后每次产生的粒子的颜色都是随机的
//    cell.redRange = 0.5;
//    cell.blueRange = 0.5;
//    cell.greenRange = 0.5;
    
    //缩放比例
    cell.scale = 0.3;
    //缩放比例范围
    cell.scaleRange = 0.25;
    
    //粒子的初始发射方向
    cell.emissionLongitude = M_PI;
    //Y方向的加速度
    cell.yAcceleration = 70.0;
    //X方向加速度
    //    cell.xAcceleration = 20.0;
    cell.spin = 1;
    
    CAEmitterLayer * _emitterLayer = [CAEmitterLayer layer];
    
    //发射位置
    _emitterLayer.emitterPosition = CGPointMake(SCREEN_WIDTH/2.0, 0);
    //粒子产生系数，默认为1
    _emitterLayer.birthRate = 1;
    //发射器的尺寸
    _emitterLayer.emitterSize = CGSizeMake(SCREEN_WIDTH, 0);
    //发射的形状
    _emitterLayer.emitterShape = kCAEmitterLayerLine;
    //发射的模式
    _emitterLayer.emitterMode = kCAEmitterLayerLine;
    //渲染模式
    _emitterLayer.renderMode = kCAEmitterLayerOldestFirst;
    _emitterLayer.masksToBounds = NO;
    //_emitterLayer.zPosition = -1;
    _emitterLayer.emitterCells = @[cell];
    //emitterView是自己创建的一个View
    [self.view.layer addSublayer:_emitterLayer];
    
    
    
    
    //火焰🔥
    
    // 发射器在xy平面的中心位置
    CAEmitterLayer * fireEmitter = [CAEmitterLayer layer];
//    fireEmitter.emitterPosition = self.view.center;
    fireEmitter.emitterPosition = CGPointMake(self.view.center.x, self.view.center.y + 300);
    // 发射器的尺寸大小
    //        fireEmitter.emitterSize = CGSize(width: 20, height: 60)
    // 发射器的发射模式
    //        fireEmitter.emitterMode = kCAEmitterLayerOutline
    //        // 发射器的形状
    fireEmitter.emitterShape = kCAEmitterLayerCircle;
    // 发射器渲染模式
    fireEmitter.renderMode = kCAEmitterLayerAdditive;
    
    // 发射单元 - 火焰
    CAEmitterCell * fire = [[CAEmitterCell alloc]init];
    // 粒子的创建速率，默认为1/s。
    fire.birthRate = 200;
    // 粒子存活时间
    fire.lifetime = 0.2;
    // 粒子的生存时间容差
    fire.lifetimeRange = 0.5;
    fire.color = [UIColor colorWithRed:0.8 green:0.4 blue:0.2 alpha:0.1].CGColor;
    fire.contents = (__bridge id _Nullable)([UIImage imageNamed:@"fire.png"].CGImage);
    fire.name = @"fire";
    // 粒子的速度
    fire.velocity = 35;
    // 粒子动画的速度容差
    fire.velocityRange = 10;
    // 粒子在xy平面的发射角度
    fire.emissionLongitude = M_PI + M_PI_2;
    // 粒子发射角度的容差
    fire.emissionRange = M_PI_2;
    // 缩放速度
    fire.scaleSpeed = 0.3;
    // 旋转度
    //        fire.spin = 0.2;
    
    fireEmitter.emitterCells = @[fire];
    [self.view.layer addSublayer:fireEmitter];
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
