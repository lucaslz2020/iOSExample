//
//  LZQuartzGradientsView.m
//  Quartz2D
//
//  Created by lucas on 16/9/1.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzGradientsView.h"

@interface LZQuartzGradientsView ()

@property (nonatomic, readonly) CGGradientRef gradient;

@end

@implementation LZQuartzGradientsView {
    CGGradientRef _gradient;
}

CGPoint startPoint(CGRect bounds) {
    return CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.25);
}

CGPoint endPoint(CGRect bounds) {
    return CGPointMake(bounds.origin.x, bounds.origin.y + bounds.size.height * 0.75);
}

CGPoint startCenter(CGRect bounds) {
    return CGPointMake(CGRectGetMidX(bounds), CGRectGetMidY(bounds));
}

CGPoint endCenter(CGRect bounds) {
    return startCenter(bounds);
}

CGFloat startRadius(CGRect bounds) {
    CGFloat radius = bounds.size.width < bounds.size.height ? bounds.size.width : bounds.size.height;
    return radius * 0.125;
}

CGFloat endRadius(CGRect bounds) {
    CGFloat radius = bounds.size.width < bounds.size.height ? bounds.size.width : bounds.size.height;
    return radius * 0.5;
}

- (void)drawInContext:(CGContextRef)context {
    
    CGContextDrawLinearGradient(context,
                                self.gradient,
                                startPoint(self.bounds),
                                endPoint(self.bounds),
                                kCGGradientDrawsBeforeStartLocation |kCGGradientDrawsAfterEndLocation);

    
//    CGContextDrawRadialGradient(context,
//                                self.gradient,
//                                startCenter(self.bounds),
//                                startRadius(self.bounds),
//                                endCenter(self.bounds),
//                                endRadius(self.bounds),
//                                kCGGradientDrawsBeforeStartLocation);
    
}

- (CGGradientRef)gradient {
    if (_gradient == NULL) {
        CGColorSpaceRef rgb = CGColorSpaceCreateDeviceRGB();
//        CGFloat colors[] = {
//            204.0 / 255.0, 224.0 / 255.0, 244.0 / 255.0, 1.00,
//            29.0 / 255.0, 156.0 / 255.0, 215.0 / 255.0, 1.00,
//            0.0 / 255.0,  50.0 / 255.0, 126.0 / 255.0, 1.00,
//        };
//        _gradient = CGGradientCreateWithColorComponents(rgb, colors, NULL, sizeof(colors)/(sizeof(colors[0]) * 4));
    
        CFMutableArrayRef array = CFArrayCreateMutable(NULL, 0, NULL);
        CFArrayAppendValue(array, [UIColor redColor].CGColor);
        CFArrayAppendValue(array, [UIColor blueColor].CGColor);
        _gradient = CGGradientCreateWithColors(rgb, array, NULL);
        CFRelease(array);
        
        CGColorSpaceRelease(rgb);
    }
    return _gradient;
}

@end
