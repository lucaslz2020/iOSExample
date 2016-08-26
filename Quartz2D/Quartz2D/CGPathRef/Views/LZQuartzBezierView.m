//
//  LZQuartzBezierView.m
//  Quartz2D
//
//  Created by lucas on 16/8/26.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzBezierView.h"

@implementation LZQuartzBezierView

- (void)drawInContext:(CGContextRef)context {
    
    CGContextSetLineWidth(context, 2.0);
    
    CGPoint start = CGPointMake(30, 150);
    CGPoint end = CGPointMake(250, 150);
    CGPoint cp1 = CGPointMake(85, 60);
    CGPoint cp2 = CGPointMake(140, 240);
    
    CGContextMoveToPoint(context, start.x, start.y);
    CGContextAddCurveToPoint(context, cp1.x, cp1.y, cp2.x, cp2.y, end.x, end.y);
    CGContextStrokePath(context);
    
    start = CGPointMake(30.0, 300.0);
    end = CGPointMake(270.0, 300.0);
    cp1 = CGPointMake(150.0, 180.0);
    CGContextMoveToPoint(context, start.x, start.y);
    CGContextAddQuadCurveToPoint(context, cp1.x, cp1.y, end.x, end.y);
    CGContextStrokePath(context);

}

@end
