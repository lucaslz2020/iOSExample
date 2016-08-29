//
//  LZCALayerView.m
//  Quartz2D
//
//  Created by lucas on 16/8/29.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZCALayerView.h"

@implementation LZCALayerView

- (void)drawRect:(CGRect)rect {
    
    UIView *redView = [[UIView alloc] initWithFrame:CGRectMake(100, 100, 100, 100)];
    redView.backgroundColor = [UIColor redColor];

    redView.layer.shadowColor = [UIColor redColor].CGColor;
    redView.layer.shadowOffset = CGSizeZero; // 四边都有
    redView.layer.shadowOpacity = 0.5;
    redView.layer.shadowRadius = 10;
    [self addSubview:redView];

    UIView *blueView = [[UIView alloc] initWithFrame:CGRectMake(100, 300, 100, 100)];
    blueView.backgroundColor = [UIColor blueColor];
    
    blueView.layer.shadowColor = [UIColor blueColor].CGColor;
    blueView.layer.shadowOffset = CGSizeMake(10, -10); // 两边
    blueView.layer.shadowOpacity = 0.5;
    blueView.layer.shadowRadius = 10;

    [self addSubview:blueView];
}

@end
