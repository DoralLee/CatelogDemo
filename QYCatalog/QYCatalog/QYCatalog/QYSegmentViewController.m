//
//  QYSegmentViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-25.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYSegmentViewController.h"

@interface QYSegmentViewController ()

@end

@implementation QYSegmentViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Segments";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor lightGrayColor];
    CGRect temp1 = self.segmentOne.frame;
    temp1.size.height = 40;
    self.segmentOne.frame = temp1;
    _segmentOne.selectedSegmentIndex = 1;
    CGRect temp2 = self.segmentTwo.frame;
    temp2.size.height = 40;
    self.segmentTwo.frame = temp2;
    CGRect temp3 = self.segmentThree.frame;
    temp3.size.height = 40;
    self.segmentThree.frame = temp3;
    _segmentThree.selectedSegmentIndex = 1;
    CGRect temp4 = self.segmentFour.frame;
    temp4.size.height = 40;
    self.segmentFour.frame = temp4;
    _segmentFour.tintColor = [UIColor redColor];
    CGRect temp5 = self.segmentFive.frame;
    temp5.size.height = 40;
    self.segmentFive.frame = temp5;
    _segmentFive.selectedSegmentIndex = 2;
    [_segmentFive setBackgroundImage:[UIImage imageNamed:@"searchBarBackground"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
