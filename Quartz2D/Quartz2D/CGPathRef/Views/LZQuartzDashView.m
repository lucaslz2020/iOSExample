//
//  LZQuartzDashView.m
//  Quartz2D
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzDashView.h"

@implementation LZQuartzDashView

- (void)drawInContext:(CGContextRef)context {
    
    CGContextSaveGState(context);
    
    CGFloat lengths[] = {10, 10};
    CGContextSetLineDash(context, 0, lengths, 2);

    CGContextMoveToPoint(context, 10, 100);
    CGContextAddLineToPoint(context, 300, 100);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
    
    // ------------
    CGContextSaveGState(context);

    CGFloat lengths10_30[] = {10, 30};
    CGContextSetLineDash(context, 0, lengths10_30, 2);
    
    CGContextMoveToPoint(context, 10, 120);
    CGContextAddLineToPoint(context, 300, 120);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
    
    // ------------
    CGContextSaveGState(context);
    
    CGFloat lengths10_30_20[] = {10, 30, 20};
    CGContextSetLineDash(context, 0, lengths10_30_20, 3);
    
    CGContextMoveToPoint(context, 10, 140);
    CGContextAddLineToPoint(context, 300, 140);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
    
    // ------------
    CGContextSaveGState(context);
    
    CGFloat phase30_10[] = {30, 10};
    CGContextSetLineDash(context, 10, phase30_10, 2);
    
    CGContextMoveToPoint(context, 10, 160);
    CGContextAddLineToPoint(context, 300, 160);
    CGContextStrokePath(context);
    
    CGContextRestoreGState(context);
    
    // ------------
    CGContextSaveGState(context);
    
    CGFloat phase30_20[] = {30, 10};
    CGContextSetLineDash(context, 20, phase30_20, 2);
    
    CGContextMoveToPoint(context, 10, 180);
    CGContextAddLineToPoint(context, 300, 180);
    CGContextStrokePath(context);
    
}

@end
