//
//  LZQuartzTransparencyLayersView.m
//  Quartz2D
//
//  Created by lucas on 16/8/31.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzTransparencyLayersView.h"

@implementation LZQuartzTransparencyLayersView

- (void)drawInContext:(CGContextRef)context {
    
    CGContextSetShadowWithColor(context, CGSizeZero, 10, [UIColor yellowColor].CGColor);

//    CGContextBeginTransparencyLayer(context, NULL);
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(100, 150, 100, 100));
    
    CGContextSetFillColorWithColor(context, [UIColor greenColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(150, 100, 100, 100));

    CGContextSetFillColorWithColor(context, [UIColor blueColor].CGColor);
    CGContextFillEllipseInRect(context, CGRectMake(150, 150, 100, 100));

//    CGContextEndTransparencyLayer(context);
}

@end
