//
//  LZQuartzTextView.m
//  Quartz2D
//
//  Created by lucas on 16/8/27.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzTextView.h"

@implementation LZQuartzTextView

//- (void)drawInContext:(CGContextRef)context {
//    
//    NSString *title = @"Hello Quartz.";
//    
//    NSDictionary *attributes = @{
//        NSFontAttributeName: [UIFont systemFontOfSize:30],
//        NSForegroundColorAttributeName: [UIColor redColor],
//        NSStrokeColorAttributeName: [UIColor blueColor],
//        NSStrokeWidthAttributeName: @2
//    };
//    
////    [title drawAtPoint:CGPointZero withAttributes:attributes];
//    
//    [title drawInRect:CGRectMake(0, 0, 100, 150) withAttributes:attributes];
//}

- (void)drawInContext:(CGContextRef)context {
    
    const char * title = "Hello Quartz.";
    size_t lenght = strlen(title);
    
    // 已过时...
    CGContextShowTextAtPoint(context, 10.0, 110.0, title, lenght);

}

@end
