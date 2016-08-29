//
//  LZQuartzImageView.m
//  Quartz2D
//
//  Created by lucas on 16/8/27.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzImageView.h"

@implementation LZQuartzImageView {
    CGImageRef _image;
}

//- (void)drawInContext:(CGContextRef)context {
//
//    CGContextTranslateCTM(context, 0.0, self.bounds.size.height);
//    CGContextScaleCTM(context, 1.0, -1.0);
//
//    
//    CGRect imageRect = CGRectMake(10, 100, 80, 80);
//    imageRect.origin.y = self.bounds.size.height - imageRect.origin.y - imageRect.size.height;
//    
//    CGContextDrawImage(context, imageRect, self.image);
//}


- (void)drawRect:(CGRect)rect {
    
    // 按照给定Rect绘制。
    [[UIImage imageNamed:@"quartz"] drawInRect:CGRectMake(10, 100, 80, 80)];
    
    // 原始大小
    [[UIImage imageNamed:@"quartz"] drawAtPoint:CGPointZero];
    
    // 平铺
    [[UIImage imageNamed:@"quartz"] drawAsPatternInRect:rect];

    UIRectClip(CGRectMake(100, 100, 100, 100));

}

- (void)drawInContext:(CGContextRef)context {
    CGRect imageRect = CGRectMake(10, 100, 80, 80);
//    CGContextDrawImage(context, imageRect, self.image);
    
    drawTiledImage(context, imageRect, self.image);
    
}

void drawTiledImage(CGContextRef context, CGRect rect, CGImageRef image){
    CGContextSaveGState(context);
    
    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);
    
    CGContextClipToRect(context, CGRectMake(100, 100, 100, 100));

    CGContextDrawTiledImage(context, rect, image);

    
    CGContextRestoreGState(context);
}

void drawImage(CGContextRef context, CGRect rect, CGImageRef image){
    CGContextSaveGState(context);

    CGContextTranslateCTM(context, rect.origin.x, rect.origin.y);
    CGContextTranslateCTM(context, 0, rect.size.height);
    CGContextScaleCTM(context, 1.0, -1.0);
    CGContextTranslateCTM(context, -rect.origin.x, -rect.origin.y);

    CGContextDrawImage(context, rect, image);

    CGContextRestoreGState(context);
}

- (CGImageRef)image {
    if (_image == NULL) {
        UIImage *image = [UIImage imageNamed:@"quartz"];
        _image = CGImageRetain(image.CGImage);
    }
    return _image;
}

- (void)dealloc {
    CGImageRelease(_image);
}

@end
