//
//  LZQuartzRectView.m
//  Quartz2D
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzRectView.h"

@implementation LZQuartzRectView

- (void)drawInContext:(CGContextRef)context {
    CGContextAddRect(context, CGRectMake(30.0, 80.0, 60.0, 60.0));
    CGContextStrokePath(context);
    
    CGContextStrokeRect(context, CGRectMake(30.0, 160.0, 60.0, 60.0));
    
    
    CGContextStrokeRectWithWidth(context, CGRectMake(30.0, 240.0, 60.0, 60.0), 10);
    CGContextSaveGState(context);
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextStrokeRectWithWidth(context, CGRectMake(30.0, 240.0, 60.0, 60.0), 2.0);
    CGContextRestoreGState(context);
    
    CGRect rects[] = {
        CGRectMake(120.0, 80.0, 60.0, 60.0),
        CGRectMake(120.0, 160.0, 60.0, 60.0),
        CGRectMake(120.0, 240.0, 60.0, 60.0),
    };
    
    CGContextAddRects(context, rects, 3);
    CGContextStrokePath(context);
    
    CGContextAddRect(context, CGRectMake(210.0, 80.0, 60.0, 60.0));
    CGContextFillPath(context);
    
    CGContextFillRect(context, CGRectMake(210.0, 160.0, 60.0, 60.0));
    
    CGRect fillRects[] = {
        CGRectMake(280.0, 80.0, 60.0, 60.0),
        CGRectMake(280.0, 160.0, 60.0, 60.0),
        CGRectMake(280.0, 240.0, 60.0, 60.0),
    };
    
    CGContextFillRects(context, fillRects, 3);
}

@end
