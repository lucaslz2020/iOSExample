//
//  LZTableViewController.m
//  UINavigationBar
//
//  Created by lucas on 16/8/24.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZTableViewController.h"
#import "UINavigationBar+LZ.h"

@interface LZTableViewController () <UIScrollViewDelegate>

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic, assign) CGFloat headerHeight;

@property (weak, nonatomic) IBOutlet UIImageView *backgroundImageView;

@property (weak, nonatomic) IBOutlet UIView *headerView;

@property (nonatomic, strong) UIImage *shadowImage;

@end

@implementation LZTableViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    self.headerHeight = 100;
    
    self.title = @"标题";
    
    [self.navigationController.navigationBar lz_setBackgroundColor:[UIColor clearColor]];
}

- (void)click:(UIBarButtonItem *)sender {
    NSLog(@"点击...");
}

- (void)scrollViewDidScroll:(UIScrollView *)scrollView {
    CGFloat offsetY = scrollView.contentInset.top + scrollView.contentOffset.y;
    CGFloat progress = offsetY / (self.headerHeight - 20);
    
    if (progress <= 0) {
        CGRect frame = self.backgroundImageView.frame;
        frame.origin.y = offsetY - 64;
        frame.size.height = self.headerHeight - offsetY + 64;
        self.backgroundImageView.frame = frame;
        if (frame.size.height > 160) {
            self.backgroundImageView.contentMode = UIViewContentModeScaleAspectFill;
        }
    }
    
    
    UIColor *color = [UIColor whiteColor];
    if (offsetY > 32) {
        CGFloat alpha = MIN(1, 1 - ((32 + 64 - offsetY) / 64));
        if (alpha == 1.0) {
            [self.navigationController.navigationBar setShadowImage:self.shadowImage];
            self.tableView.scrollIndicatorInsets = UIEdgeInsetsZero;
        }
        [self.navigationController.navigationBar lz_setBackgroundColor:[color colorWithAlphaComponent:alpha]];
    } else {
        [self.navigationController.navigationBar lz_setBackgroundColor:[color colorWithAlphaComponent:0]];
        [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
        self.tableView.scrollIndicatorInsets = UIEdgeInsetsMake(-64, 0, 0, 0);
    }
}

- (void)viewWillAppear:(BOOL)animated {
    [super viewWillAppear:animated];
    self.shadowImage = self.navigationController.navigationBar.shadowImage;
    [self.navigationController.navigationBar setShadowImage:[[UIImage alloc] init]];
}

- (void)viewWillDisappear:(BOOL)animated {
    [super viewWillDisappear:animated];
    [self.navigationController.navigationBar lz_reset];
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cellIdentifier" forIndexPath:indexPath];
    return cell;
}

@end
