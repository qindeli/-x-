//
//  DLCircleProgessView.h
//  运动类-环形进度Demo
//
//  Created by vera on 16/3/16.
//  Copyright © 2016年 vera. All rights reserved.
//  @deli
//

#import <UIKit/UIKit.h>

@interface DLCircleProgessView : UIView

/**
 *  线宽
 */
@property (nonatomic, assign) CGFloat lineWidth;

/**
 *  当前值,默认是0
 */
@property (nonatomic, assign) CGFloat value;

/**
 *  最大值，默认是100
 */
@property (nonatomic, assign) CGFloat maximumValue;

/**
 *  默认线的颜色
 */
@property (nonatomic, strong) UIColor *lineColor;

/**
 *  线的填充颜色(轨迹颜色)
 */
@property (nonatomic, strong) UIColor *fillLineColor;


@end
