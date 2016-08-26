//
//  LZArcView.m
//  Quartz2D
//
//  Created by lucas on 16/8/21.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZArcView.h"

@implementation LZArcView

/**
 *  使用方法画弧。
 */
//- (void)drawRect:(CGRect)rect {
//    UIBezierPath *path = [UIBezierPath bezierPath];
//    [path addArcWithCenter:CGPointMake(100, 100) radius:100 startAngle:0 endAngle:M_PI_2 clockwise:YES];
//    [path stroke];
//}

/**
 *  使用类方法画弧
 */
- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(100, 100)
                                                        radius:100
                                                    startAngle:0
                                                      endAngle:M_PI_2
                                                     clockwise:YES];
    [path stroke];
}

@end
