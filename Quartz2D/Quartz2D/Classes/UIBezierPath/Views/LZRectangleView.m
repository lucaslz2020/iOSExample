//
//  LZRectangleView.m
//  Quartz2D
//
//  Created by lucas on 16/8/21.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZRectangleView.h"

@implementation LZRectangleView

- (void)drawRect:(CGRect)rect {
    [[UIBezierPath bezierPathWithRect:CGRectMake(10, 100, 100, 100)] stroke];
    
    [[UIBezierPath bezierPathWithOvalInRect:CGRectMake(10, 320, 50, 90)] stroke];
    
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 420, 100, 100) cornerRadius:50] stroke];
    
    [[UIBezierPath bezierPathWithRoundedRect:CGRectMake(10, 210, 100, 100)
                           byRoundingCorners:UIRectCornerTopLeft
                                 cornerRadii:CGSizeMake(20, 0)] stroke];
    
    
    [[UIBezierPath bezierPathWithRect:CGRectMake(300, 100, 50, 60)] stroke];
    [[UIBezierPath bezierPathWithRect:CGRectMake(400, 100, 50, 60)] fill];
}

@end
