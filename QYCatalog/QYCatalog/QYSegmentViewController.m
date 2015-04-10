//
//  QYSegmentViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-25.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYSegmentViewController.h"

static const NSInteger kSegmentControlHeight = 40.0f;
static const NSInteger kLabelHeight = 20.0f;
static const NSInteger kLeftMargin = 20.0f;
static const NSInteger kTopMargin = 10.0f + 20.0f + 44.0f;
static const NSInteger kTweenMargin = 10.0f;

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
+ (UILabel *)labelWithFrame:(CGRect)frame title:(NSString *)title
{

    UILabel *label = [[UILabel alloc] initWithFrame:frame];
    label.text = title;
    label.textColor = [UIColor colorWithRed:76.0/255 green:86.0/255.0 blue:108.0/255.0 alpha:1.0];
    label.font = [UIFont systemFontOfSize:17.0f];
    return label;

}
- (void)viewDidLoad
{
    [super viewDidLoad];
    
    CGFloat yPlacement = kTopMargin;
    CGRect frame = CGRectMake(kLeftMargin, yPlacement, CGRectGetWidth(self.view.frame) - kLeftMargin*2, kLabelHeight);
    [self.view addSubview:[[self class] labelWithFrame:frame title:@"UISegmentedControl:"]];
    UISegmentedControl *segmentControl = [[UISegmentedControl alloc] initWithItems:
                                          @[[UIImage imageNamed:@"segment_check"],
                                            [UIImage imageNamed:@"segment_search"],
                                            [UIImage imageNamed:@"segment_tools"]]];
    yPlacement += kLabelHeight + kTweenMargin;
    segmentControl.frame = CGRectMake(kLeftMargin, yPlacement, CGRectGetWidth(self.view.frame) - kLeftMargin*2, kSegmentControlHeight);
    segmentControl.selectedSegmentIndex = 1;
    [self.view addSubview:segmentControl];
    
    yPlacement += kSegmentControlHeight +kTweenMargin;
    frame = CGRectMake(kLeftMargin, yPlacement, CGRectGetWidth(self.view.frame) - kLeftMargin*2, kLabelHeight);
    [self.view addSubview:[[self class] labelWithFrame:frame title:@"UISegmentControlStyleBordered:"]];
    
    yPlacement += kLabelHeight +kTweenMargin;
    segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"Check", @"Search", @"Tools"]];
    segmentControl.frame = CGRectMake(kLeftMargin, yPlacement, CGRectGetWidth(self.view.frame) - kLeftMargin*2, kSegmentControlHeight);
    segmentControl.selectedSegmentIndex = 1;
    [self.view addSubview:segmentControl];
    
    //label
    yPlacement += kSegmentControlHeight + kTweenMargin;
    frame = CGRectMake(kLeftMargin, yPlacement, CGRectGetWidth(self.view.bounds)-kLeftMargin*2.0, kLabelHeight);
    [self.view addSubview:[QYSegmentViewController labelWithFrame:frame title:@"UISegmentControlStyleBar:"]];
    
    //segment
    yPlacement += kLabelHeight + kTweenMargin;
    segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"Check", @"Search", @"Tools"]];
    frame = CGRectMake(kLeftMargin, yPlacement, CGRectGetWidth(self.view.bounds)-kLeftMargin*2.0, kSegmentControlHeight );
    segmentControl.frame = frame;
    segmentControl.tintColor = [UIColor redColor];
    segmentControl.selectedSegmentIndex = 1;
    //[segmentControl setBackgroundImage:[UIImage imageNamed:@"segmentedBackground"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.view addSubview:segmentControl];
    yPlacement += kSegmentControlHeight + kTweenMargin;
    frame = CGRectMake(kLeftMargin, yPlacement, CGRectGetWidth(self.view.frame), kLabelHeight);
    [self.view addSubview:[QYSegmentViewController labelWithFrame:frame title:@"UISegmentControlStyleBar:image"]];
    
    yPlacement += kLabelHeight + kTweenMargin;
    segmentControl = [[UISegmentedControl alloc] initWithItems:@[@"Check", @"Search", @"Tools"]];
    segmentControl.frame = CGRectMake(kLeftMargin, yPlacement, CGRectGetWidth(self.view.frame) - kLeftMargin*2, kSegmentControlHeight);
    segmentControl.selectedSegmentIndex = 1;
    [segmentControl setBackgroundImage:[UIImage imageNamed:@"segmentedBackground"] forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    [self.view addSubview:segmentControl];

}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
