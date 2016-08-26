//
//  LZQuartzCapJoinWidthView.h
//  Quartz2D
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzView.h"

IB_DESIGNABLE
@interface LZQuartzCapJoinWidthView : LZQuartzView

IBInspectable
@property (nonatomic, assign, readwrite) CGLineCap cap;

@property (nonatomic, assign, readwrite) CGLineJoin join;

@property (nonatomic, assign, readwrite) CGFloat width;

@end
