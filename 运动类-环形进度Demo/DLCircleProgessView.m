//
//  DLCircleProgessView.m
//  运动类-环形进度Demo
//
//  Created by vera on 16/3/16.
//  Copyright © 2016年 vera. All rights reserved.
//  @deli
//

#define kDefaultLineColor [UIColor colorWithRed:225.0/255.0 green:225.0/255.0 blue:225.0/255.0 alpha:1.0]
#define kDefaultFillLineColor [UIColor colorWithRed:0.0/255.0 green:190.0/255.0 blue:90.0/255.0 alpha:1.0]

//进度条距离外部边缘的距离
#define kCompassSpace 40

//开始弧度
#define kStartAngle (-M_PI_2)

//结束弧度
#define kEndAngle (2*M_PI - M_PI_2)

#import "DLCircleProgessView.h"

@interface DLCircleProgessView ()

@property (nonatomic, weak) UILabel *progessLabel;

@end

@implementation DLCircleProgessView

- (instancetype)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.lineColor = kDefaultLineColor;
        self.fillLineColor = kDefaultFillLineColor;
        self.lineWidth = 25;
        self.maximumValue = 100;
    }
    return self;
}

- (UILabel *)progessLabel
{
    if (!_progessLabel)
    {
        UILabel *l = [[UILabel alloc] init];
        l.font = [UIFont systemFontOfSize:20];
        l.textAlignment = NSTextAlignmentCenter;
        l.textColor = self.fillLineColor;
        [self addSubview:l];
        
        _progessLabel = l;
    }
    
    return _progessLabel;
}

- (void)setValue:(CGFloat)value
{
    _value = value;
    
    [self setNeedsDisplay];
}

- (void)setLineWidth:(CGFloat)lineWidth
{
    _lineWidth = lineWidth;
    
    [self setNeedsDisplay];
}

- (void)setLineColor:(UIColor *)lineColor
{
    _lineColor = lineColor;
    
    [self setNeedsDisplay];
}

- (void)setFillLineColor:(UIColor *)fillLineColor
{
    _fillLineColor = fillLineColor;
    
    [self setNeedsDisplay];
}

- (void)layoutSubviews
{
    [super layoutSubviews];
    
    self.progessLabel.frame = CGRectMake(self.bounds.size.width/2 - 40, self.bounds.size.height/2 - 20, 80, 40);
}

// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
    
    CGContextRef context = UIGraphicsGetCurrentContext();
    CGContextSetLineWidth(context, self.lineWidth);
    
    CGFloat lenghts[2] = {3, 3};
    
    CGContextSetStrokeColorWithColor(context, self.lineColor.CGColor);
    
    CGContextSetLineDash(context, 0, lenghts, sizeof(lenghts)/sizeof(lenghts[0]));
    
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, MIN(self.frame.size.width, self.frame.size.height)/2 - kCompassSpace - self.lineWidth/2, kStartAngle, kEndAngle, NO);
    
    CGContextStrokePath(context);
    
    /**
     *  画外形圆圈
     */
    CGContextSetLineWidth(context, 3);
    CGContextSetLineDash(context, 0, NULL, 0);
    CGContextSetStrokeColorWithColor(context, self.fillLineColor.CGColor);
    CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, MIN(self.frame.size.width, self.frame.size.height)/2 - 10, 0, 2*M_PI, YES);
    CGContextStrokePath(context);
    
    CGFloat progess = self.value/self.maximumValue;
    
    self.progessLabel.text = [NSString stringWithFormat:@"%0.1f%%",progess*100];
    
    
    /**
     *  画进度条
     */
    CGContextSetLineWidth(context, self.lineWidth);

    if (self.value <= self.maximumValue)
    {
        CGFloat endArc = M_PI  * 2 * progess;
        
        CGContextSetLineDash(context, 0, lenghts, sizeof(lenghts)/sizeof(lenghts[0]));
        CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, MIN(self.frame.size.width, self.frame.size.height)/2 - kCompassSpace - self.lineWidth/2, kStartAngle, -M_PI_2 + endArc, NO);
    }
    else
    {
        CGContextSetLineDash(context, 0, lenghts, sizeof(lenghts)/sizeof(lenghts[0]));
        CGContextAddArc(context, self.frame.size.width/2, self.frame.size.height/2, MIN(self.frame.size.width, self.frame.size.height)/2 - kCompassSpace - self.lineWidth/2, kStartAngle, kEndAngle, NO);
    }
    
    CGContextStrokePath(context);

    
}


@end
