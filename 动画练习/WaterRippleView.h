//
//  WaterRippleView.h
//  WaterRipple
//
//  Created by Liyn on 2018/12/24.
//  Copyright © 2018年 刘亚和. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface WaterRippleView : UIView
@property (nonatomic, strong)UIColor *mainRippleColor;//主波填充颜色
@property (nonatomic, strong)UIColor *minorRippleColor;//次波填充颜色
@property (nonatomic, assign)CGFloat mainRippleoffsetX;//主波偏移量
@property (nonatomic, assign)CGFloat minorRippleoffsetX;//次波偏移量
@property (nonatomic, assign)CGFloat rippleSpeed;//波浪速度
@property (nonatomic, assign)CGFloat ripplePosition;//波浪Y轴位置
@property (nonatomic, assign)float rippleAmplitude;//波浪振幅
//设置frame 主波填充颜色  次波填充颜色
- (instancetype)initWithFrame:(CGRect)frame mainRippleColor:(UIColor *)mainRippleColor minorRippleColor:(UIColor *)minorRippleColor;
//设置frame 主波填充颜色  次波填充颜色 主波偏移量 次波偏移量 波浪速度 波浪Y轴位置 波浪振幅
- (instancetype)initWithFrame:(CGRect)frame mainRippleColor:(UIColor *)mainRippleColor minorRippleColor:(UIColor *)minorRippleColor mainRippleoffsetX:(float)mainRippleoffsetX minorRippleoffsetX:(float)minorRippleoffsetX rippleSpeed:(float)rippleSpeed ripplePosition:(float)ripplePosition rippleAmplitude:(float)rippleAmplitude;
@end
