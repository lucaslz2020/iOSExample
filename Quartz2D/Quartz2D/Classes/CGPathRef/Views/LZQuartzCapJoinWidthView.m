//
//  LZQuartzCapJoinWidthView.m
//  Quartz2D
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzCapJoinWidthView.h"

@implementation LZQuartzCapJoinWidthView

- (void)drawInContext:(CGContextRef)context {

    CGContextSaveGState(context);

    CGContextMoveToPoint(context, 40.0, 30.0);
    CGContextAddLineToPoint(context, 280.0, 30.0);

    CGContextSetLineWidth(context, self.width);
    CGContextSetLineCap(context, self.cap);
    CGContextStrokePath(context);

    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);

    CGContextMoveToPoint(context, 40.0, 190.0);
    CGContextAddLineToPoint(context, 160.0, 70.0);
    CGContextAddLineToPoint(context, 280.0, 190.0);
    
    CGContextSetLineWidth(context, self.width);
    CGContextSetLineJoin(context, self.join);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);

    
    if (self.width >= 4.0) {
        CGContextSetRGBStrokeColor(context, 1.0, 1.0, 1.0, 1.0);
        CGContextMoveToPoint(context, 40.0, 30.0);
        CGContextAddLineToPoint(context, 280.0, 30.0);
        
        CGContextMoveToPoint(context, 40.0, 190.0);
        CGContextAddLineToPoint(context, 160.0, 70.0);
        CGContextAddLineToPoint(context, 280.0, 190.0);
        CGContextSetLineWidth(context, 2.0);
        CGContextStrokePath(context);
    }
}

- (void)setCap:(CGLineCap)cap {
    if (cap != _cap) {
        _cap = cap;
        [self setNeedsDisplay];
    }
}

- (void)setJoin:(CGLineJoin)join {
    if (join != _join) {
        _join = join;
        [self setNeedsDisplay];
    }
}

- (void)setWidth:(CGFloat)width {
    if (width != _width) {
        _width = width;
        [self setNeedsDisplay];
    }
}

@end
