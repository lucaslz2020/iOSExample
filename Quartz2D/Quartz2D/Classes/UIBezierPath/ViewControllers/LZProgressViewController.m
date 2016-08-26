//
//  LZProgressViewController.m
//  Quartz2D
//
//  Created by lucas on 16/8/21.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZProgressViewController.h"
#import "LZProgressView.h"

@interface LZProgressViewController ()

@property (weak, nonatomic) IBOutlet LZProgressView *progressView;

@end

@implementation LZProgressViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (IBAction)takeProgressFrom:(UISlider *)sender {
    self.progressView.progressValue = sender.value;
}

@end
