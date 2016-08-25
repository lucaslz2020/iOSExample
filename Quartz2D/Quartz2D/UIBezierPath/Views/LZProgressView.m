//
//  LZProgressView.m
//  Quartz2D
//
//  Created by lucas on 16/8/21.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZProgressView.h"

@implementation LZProgressView

- (void)drawRect:(CGRect)rect {
    CGFloat centerX = (rect.size.width - rect.origin.x) * 0.5;
    CGFloat centerY = (rect.size.height - rect.origin.y) * 0.5;

    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:10 startAngle:0 endAngle:2 * M_PI clockwise:YES];
    path.lineWidth = 2;
    [[UIColor lightGrayColor] setStroke];
    [path stroke];

    CGFloat startAngle = -M_PI_2;

    CGFloat endAngle = startAngle + self.progressValue * M_PI * 2;
    UIBezierPath *progreePath = [UIBezierPath bezierPathWithArcCenter:CGPointMake(centerX, centerY) radius:10 startAngle:startAngle endAngle:endAngle clockwise:YES];
    progreePath.lineWidth = 2;
    [[UIColor blueColor] setStroke];
    [progreePath stroke];
}

- (void)setProgressValue:(CGFloat)progressValue {
    if (progressValue != _progressValue) {
        _progressValue = progressValue;
        [self setNeedsDisplay];
    }
}

@end
