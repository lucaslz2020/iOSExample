//
//  LZLineView.m
//  Quartz2D
//
//  Created by lucas on 16/8/21.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZLineView.h"

@implementation LZLineView

- (void)drawRect:(CGRect)rect {
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(100, 100)];
    [path addLineToPoint:CGPointMake(200, 100)];
    [path stroke];
}

@end
