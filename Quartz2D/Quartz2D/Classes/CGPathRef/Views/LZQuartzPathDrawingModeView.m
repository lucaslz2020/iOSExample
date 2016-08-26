//
//  LZQuartzPathDrawingModeView.m
//  Quartz2D
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzPathDrawingModeView.h"

@implementation LZQuartzPathDrawingModeView

- (void)drawInContext:(CGContextRef)context {
    
    CGContextSetRGBFillColor(context, 0.9, 0.1, 0.1, 1.0);
    CGContextSetRGBStrokeColor(context, 0.0, 0.0, 1.0, 1.0);
    CGContextSetLineWidth(context, 2.0);

    CGPoint center = CGPointMake(130.0, 130.0);
    CGFloat radius = 60.0;
    CGContextMoveToPoint(context, center.x + radius, center.y);
    for (int i = 1; i < 5; ++i) {
        CGFloat x = center.x + radius * cosf(i * 4 * M_PI / 5);
        CGFloat y = center.y - radius * sinf(i * 4 * M_PI / 5);
        CGContextAddLineToPoint(context, x, y);
    }
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathEOFillStroke);
    
//    kCGPathFill,
//    kCGPathEOFill,
//    kCGPathStroke,
//    kCGPathFillStroke,
//    kCGPathEOFillStroke
}

@end
