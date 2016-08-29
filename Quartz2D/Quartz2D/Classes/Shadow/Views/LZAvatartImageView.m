//
//  LZAvatartImageView.m
//  Quartz2D
//
//  Created by lucas on 16/8/29.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZAvatartImageView.h"

@implementation LZAvatartImageView

/**
 *  阴影被剪切了
 *
 */
//- (void)drawRect:(CGRect)rect {
//    
//    CGRect avatarImageViewRect = CGRectMake(100, 100, 100, 100);
//    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:avatarImageViewRect];
//    avatarImageView.image = [UIImage imageNamed:@"avatar"];
//    avatarImageView.layer.shadowColor = [UIColor redColor].CGColor;
//    avatarImageView.layer.shadowOffset = CGSizeZero;
//    avatarImageView.layer.shadowOpacity = 0.8;
//    avatarImageView.layer.shadowRadius = 10;
//    avatarImageView.layer.masksToBounds = YES;
//    avatarImageView.layer.cornerRadius = 10.0;
//    [avatarImageView addSubview:avatarImageView];
//    
//    [self addSubview:avatarImageView];
//}

- (void)drawRect:(CGRect)rect {
    
    CGRect viewRect = CGRectMake(100, 100, 100, 100);
    
    UIView *shadowView = [[UIView alloc] initWithFrame:viewRect];
    shadowView.layer.shadowColor = [UIColor redColor].CGColor;
    shadowView.layer.shadowOffset = CGSizeZero;
    shadowView.layer.shadowOpacity = 0.8;
    shadowView.layer.shadowRadius = 10;
    shadowView.clipsToBounds = NO;
    
    UIImageView *avatarImageView = [[UIImageView alloc] initWithFrame:shadowView.bounds];
    avatarImageView.image = [UIImage imageNamed:@"avatar"];
    avatarImageView.layer.masksToBounds = YES;
    avatarImageView.layer.cornerRadius = 10.0;
    [shadowView addSubview:avatarImageView];
    
    [self addSubview:shadowView];
}


@end
