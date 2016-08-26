//
//  LZQuartzEllipseArcView.m
//  Quartz2D
//
//  Created by lucas on 16/8/26.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzEllipseArcView.h"

@implementation LZQuartzEllipseArcView

- (void)drawInContext:(CGContextRef)context {
    
    CGContextSetFillColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetRGBFillColor(context, .09, 0.0, 0.0, 1.0);
    
    
    
    CGContextSetStrokeColorWithColor(context, [UIColor redColor].CGColor);
    CGContextSetRGBStrokeColor(context, 0.5, 0.7, 1.0, 1.0);
    
    CGContextSetLineWidth(context, 2.0);
    CGContextAddEllipseInRect(context, CGRectMake(30.0, 130.0, 120.0, 100.0));
    CGContextStrokePath(context);
    
    CGContextStrokeEllipseInRect(context, CGRectMake(30.0, 260.0, 100.0, 100.0));
    
    CGContextFillEllipseInRect(context, CGRectMake(30.0, 370.0, 100.0, 100.0));
    
    
    CGContextAddArc(context, 210.0, 150.0, 30.0, 0, M_PI_2, false);
    CGContextAddArc(context, 210.0, 150.0, 30.0, 3.0 * M_PI_2, M_PI, true);
    CGContextStrokePath(context);
    
    CGContextAddArc(context, 210.0, 240.0, 30.0, 0.0, M_PI_2, false);
    CGContextAddArc(context, 210.0, 240.0, 30.0, M_PI, 3.0 * M_PI_2, false);
    CGContextStrokePath(context);
    
    CGPoint p[3] = {
        CGPointMake(210.0, 390.0),
        CGPointMake(210.0, 450.0),
        CGPointMake(270.0, 450.0),
    };
    CGContextMoveToPoint(context, p[0].x, p[0].y);
    CGContextAddArcToPoint(context, p[1].x, p[1].y, p[2].x, p[2].y, 60.0);
    CGContextStrokePath(context);
    
    CGContextSetRGBStrokeColor(context, 1.0, 0.0, 0.0, 1.0);
    CGContextAddLines(context, p, 3);
    CGContextStrokePath(context);
    
    
    CGRect rrect = CGRectMake(280, 130.0, 160.0, 160.0);
    CGFloat radius = 20.0;
   
    CGFloat minx = CGRectGetMinX(rrect);
    CGFloat midx = CGRectGetMidX(rrect);
    CGFloat maxx = CGRectGetMaxX(rrect);
    
    CGFloat miny = CGRectGetMinY(rrect);
    CGFloat midy = CGRectGetMidY(rrect);
    CGFloat maxy = CGRectGetMaxY(rrect);

    CGContextMoveToPoint(context, minx, midy);
    CGContextAddArcToPoint(context, minx, miny, midx, miny, radius);
    CGContextAddArcToPoint(context, maxx, miny, maxx, midy, 0);
    CGContextAddArcToPoint(context, maxx, maxy, midx, maxy, radius);
    CGContextAddArcToPoint(context, minx, maxy, minx, midy, radius);
    CGContextClosePath(context);
    CGContextDrawPath(context, kCGPathFillStroke);
}

@end
