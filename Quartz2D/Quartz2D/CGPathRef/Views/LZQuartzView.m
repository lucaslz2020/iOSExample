//
//  LZQuartzView.m
//  Quartz2D
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzView.h"

@implementation LZQuartzView

- (void)drawInContext:(CGContextRef)context {
    NSAssert(NO, @"子类必须实现");
}

- (void)drawRect:(CGRect)rect {
    [self drawInContext:UIGraphicsGetCurrentContext()];
}

@end
