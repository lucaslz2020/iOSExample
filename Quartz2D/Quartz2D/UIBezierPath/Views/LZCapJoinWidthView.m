//
//  LZCapJoinWidthView.m
//  Quartz2D
//
//  Created by lucas on 16/8/21.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZCapJoinWidthView.h"

@implementation LZCapJoinWidthView

- (void)drawRect:(CGRect)rect {
    
    UIBezierPath *path = [UIBezierPath bezierPath];
    [path moveToPoint:CGPointMake(40, 30)];
    [path addLineToPoint:CGPointMake(280, 30)];
    path.lineCapStyle = self.cap;
    path.lineWidth = self.width;
    
    [path moveToPoint:CGPointMake(40, 190)];
    [path addLineToPoint:CGPointMake(160, 70)];
    [path addLineToPoint:CGPointMake(280, 190)];
    path.lineJoinStyle = self.join;
    
    [path stroke];
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
