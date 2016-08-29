//
//  LZQuartzShadowView.m
//  Quartz2D
//
//  Created by lucas on 16/8/29.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzShadowView.h"

@implementation LZQuartzShadowView

- (void)drawInContext:(CGContextRef)context {
    
    CGContextSaveGState(context);

    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    
    CGContextSetShadow(context, CGSizeMake(10.0, 10.0), 0.1);
    CGContextFillRect(context, CGRectMake(10.0, 100.0, 100.0, 100.0));
    CGContextRestoreGState(context);
    
    CGContextSaveGState(context);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    
    CGContextSetShadow(context, CGSizeMake(10.0, 10.0), 0.9);
    CGContextFillRect(context, CGRectMake(10.0, 250.0, 100.0, 100.0));
    CGContextRestoreGState(context);
    
    
    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetShadowWithColor (context, CGSizeMake(10.0, 10.0), 20, [UIColor redColor].CGColor);
    CGContextFillRect(context, CGRectMake(10.0, 400.0, 100.0, 100.0));
    CGContextRestoreGState(context);

    CGContextSaveGState(context);
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);

    const CGFloat components[] = {1.0, 0.0, 0.0, 0.6};
    CGColorSpaceRef colorSpace = CGColorSpaceCreateDeviceRGB();
    CGColorRef color = CGColorCreate(colorSpace, components);
    CGContextSetShadowWithColor(context, CGSizeMake(10.0, 10.0), 5, color);

    CGContextFillRect(context, CGRectMake(210.0, 100.0, 100.0, 100.0));
    
    CGColorRelease (color);
    CGColorSpaceRelease (colorSpace);

    CGContextRestoreGState(context);    
}

@end
