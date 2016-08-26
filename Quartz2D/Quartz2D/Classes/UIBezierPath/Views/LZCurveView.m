//
//  LZCurveView.m
//  Quartz2D
//
//  Created by lucas on 16/8/21.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZCurveView.h"

@implementation LZCurveView

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    
    [path addCurveToPoint:CGPointMake(250, 100)
            controlPoint1:CGPointMake(150, 50)
            controlPoint2:CGPointMake(200, 150)];
    
    [path stroke];
    
    [path moveToPoint:CGPointMake(200, 200)];
    [path addQuadCurveToPoint:CGPointMake(300, 200) controlPoint:CGPointMake(250, 250)];
    [path stroke];
}

@end
