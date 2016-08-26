//
//  LZQuartzLineView.m
//  Quartz2D
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzLineView.h"

@implementation LZQuartzLineView

- (void)drawInContext:(CGContextRef)context {
    
    CGContextSetLineWidth(context, 2);
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextMoveToPoint(context, 10, 150);
    CGContextAddLineToPoint(context, 100, 150);
    CGContextStrokePath(context);
    
    
    CGPoint addLines[] = {
        CGPointMake(10, 120),
        CGPointMake(70, 80),
        CGPointMake(130, 120),
        CGPointMake(190, 80),
        CGPointMake(250, 120),
        CGPointMake(310, 80),
    };
//    CGContextAddLines(context, addLines, 6);
//    CGContextStrokePath(context);
    
    // equals
    CGContextMoveToPoint(context, addLines[0].x, addLines[0].y);
    for (int i = 1; i < 6; ++i) {
        CGContextAddLineToPoint(context, addLines[i].x, addLines[i].y);
    }
    CGContextStrokePath(context);

    
    CGPoint strokeSegments[] = {
        CGPointMake(10.0, 250.0),
        CGPointMake(70.0, 220.0),
        CGPointMake(130.0, 250.0),
        CGPointMake(190.0, 220.0),
        CGPointMake(250.0, 250.0),
        CGPointMake(310.0, 220.0)
    };
//    CGContextStrokeLineSegments(context, strokeSegments, 6);
    
    // equals
    for (int i = 0; i < 6; i +=2) {
        CGContextMoveToPoint(context, strokeSegments[i].x, strokeSegments[i].y);
        CGContextAddLineToPoint(context, strokeSegments[i+1].x, strokeSegments[i+1].y);
        CGContextStrokePath(context);
    }
}

@end
