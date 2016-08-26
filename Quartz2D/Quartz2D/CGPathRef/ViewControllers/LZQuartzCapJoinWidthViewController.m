//
//  LZQuartzCapJoinWidthViewController.m
//  Quartz2D
//
//  Created by lucas on 16/8/25.
//  Copyright © 2016年 三只小猪. All rights reserved.
//

#import "LZQuartzCapJoinWidthViewController.h"
#import "LZQuartzCapJoinWidthView.h"

@interface LZQuartzCapJoinWidthViewController ()

@property (strong, nonatomic) IBOutlet LZQuartzCapJoinWidthView *capJoinWidthView;

@property (nonatomic, weak) IBOutlet UISegmentedControl *capSegmentedControl;

@property (nonatomic, weak) IBOutlet UISegmentedControl *joinSegmentedControl;

@property (nonatomic, weak) IBOutlet UISlider *widthSlider;

@end

@implementation LZQuartzCapJoinWidthViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.capJoinWidthView.cap = (CGLineCap)self.capSegmentedControl.selectedSegmentIndex;
    self.capJoinWidthView.join = (CGLineJoin)self.joinSegmentedControl.selectedSegmentIndex;
    self.capJoinWidthView.width = self.widthSlider.value;
}

- (IBAction)takeLineCapFrom:(UISegmentedControl *)sender {
    self.capJoinWidthView.cap = (CGLineCap)sender.selectedSegmentIndex;
}

- (IBAction)takeLineJoinFrom:(UISegmentedControl *)sender {
    self.capJoinWidthView.join = (CGLineJoin)sender.selectedSegmentIndex;
}

- (IBAction)takeLineWidthFrom:(UISlider *)sender {
    self.capJoinWidthView.width = sender.value;
}


@end
