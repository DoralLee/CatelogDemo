//
//  QYControlsViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-22.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYControlsViewController.h"

#define kTag 101
//NSString *identifierF = @"controlsCella";
//NSString *identifierS = @"controlsCellb";
NSString * const kSectionTitleKey = @"sectonTitle";
NSString * const kFCellTitleKey = @"fCellTitle";
NSString * const kViewKey = @"view";
NSString * const kSCellTitleKey = @"sCellTitle";

@interface QYControlsViewController ()
@property (nonatomic, strong) NSArray *controlsData;
@property (nonatomic, strong) UISwitch *switchCtl;
@property (nonatomic, strong) UISlider *sliderCtl;
@property (nonatomic, strong) UISlider *customSlider;
@property (nonatomic, strong) UIPageControl *pageCtl;
@property (nonatomic, strong) UIActivityIndicatorView *activityInd;
@property (nonatomic, strong) UIProgressView *progressBar;
@property (nonatomic, strong) UIStepper *stepper;
@end

@implementation QYControlsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"controls";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    
    self.controlsData = @[@{kSectionTitleKey:@"UISWITCH",
                            kFCellTitleKey:@"Standard Switch",
                            kViewKey:self.switchCtl,
                            //   kViewKey:@"UISwitch",
                            kSCellTitleKey:@"QYControlsViewController.m:\n-(UISwitch *)switchCtl"},
                          @{kSectionTitleKey:@"UISLIDER",
                            kFCellTitleKey:@"Standard Slider",
                            kViewKey:self.sliderCtl ,
                            kSCellTitleKey:@"QYControlsViewController.m:\n-(sliderCtl *)sliderCtl"},
                          @{kSectionTitleKey:@"UISLIDER",
                            kFCellTitleKey:@"Customized Slider",
                            kViewKey:self.customSlider,
                            kSCellTitleKey:@"QYControlsViewController.m:\n-(sliderCtl *)customSlider"},
                          @{kSectionTitleKey:@"UIPAGECONTROL",
                            kFCellTitleKey:@"Ten Pages",
                            kViewKey:self.pageCtl,
                            kSCellTitleKey:@"QYControlsViewController.m:\n-(UIPageControl *)pageControl"},
                          @{kSectionTitleKey:@"UIACTIVITYYINDICATORVIEW",
                            kFCellTitleKey:@"Style Gray",
                            kViewKey:self.activityInd,
                            kSCellTitleKey:@"QYControlsViewController.m:\n-(UIActivityIndicatorView *)progresslnd"},
                          @{kSectionTitleKey:@"UIPROGRESSVIEW",
                            kFCellTitleKey:@"Style Default",
                            kViewKey:self.progressBar,
                            kSCellTitleKey:@"QYControlsViewController.m:\n-(UIProgressView *)progressBar"},
                          @{kSectionTitleKey:@"UISTEPPER",
                            kFCellTitleKey:@"Stepper 1 to 10",
                            kViewKey:self.stepper,
                            kSCellTitleKey:@"QYControlsViewController.m:\n-(UIStepper *)stepper"}];
    
    UIBarButtonItem *rightBarButton = [[UIBarButtonItem alloc] initWithTitle:@"Tinted" style:UIBarButtonItemStyleBordered target:self action:@selector(tappedAction:)];
    self.navigationItem.rightBarButtonItem = rightBarButton;
    
}
//get方法的实现
- (UISwitch *)switchCtl
{
    if (nil == _switchCtl){
        self.switchCtl = [[UISwitch alloc] initWithFrame:CGRectMake(0.0, 12.0, 94.0, 27.0)];
        _switchCtl.onTintColor = [UIColor greenColor];
        _sliderCtl.tag = kTag;
    }
    return _switchCtl;
}
- (UISlider *)sliderCtl
{
    if (nil == _sliderCtl){
        self.sliderCtl = [[UISlider alloc] initWithFrame:CGRectMake(0.0, 5, 120, 35)];
        _sliderCtl.minimumValue = 0;
        _sliderCtl.maximumValue = 1;
        _sliderCtl.value = 0.5;
        _sliderCtl.tag = kTag;
        _sliderCtl.thumbTintColor = [UIColor greenColor];
    }
    return _sliderCtl;
}
- (UISlider *)customSlider
{
    if (nil == _customSlider){
        self.customSlider = [[UISlider alloc] initWithFrame:CGRectMake(190, 5, 120, 20)];
        UIImage *left = [[UIImage imageNamed:@"orangeslide"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 8, 2, 8) resizingMode:UIImageResizingModeStretch];
        
        UIImage *right = [[UIImage imageNamed:@"yellowslide"] resizableImageWithCapInsets:UIEdgeInsetsMake(2, 8, 2, 8) resizingMode:UIImageResizingModeStretch];
        [_customSlider setThumbImage:[UIImage imageNamed:@"slider_ball"] forState:UIControlStateNormal];
        [_customSlider setMinimumTrackImage:left forState:UIControlStateNormal];
        [_customSlider setMaximumTrackImage:right forState:UIControlStateNormal];
        _customSlider.value = 0.5;
        _customSlider.tag = kTag;
    }
    return _customSlider;
}
- (UIPageControl *)pageCtl
{
    if (nil == _pageCtl){
        self.pageCtl = [[UIPageControl alloc] initWithFrame:CGRectMake(150, 18, 165, 20)];
        _pageCtl.numberOfPages = 10;
        _pageCtl.pageIndicatorTintColor = [UIColor blackColor];
        _pageCtl.backgroundColor = [UIColor darkGrayColor];
        _pageCtl.tag = kTag;
    }
    return _pageCtl;
}
- (UIActivityIndicatorView *)activityInd
{
    if (nil == _activityInd){
        _activityInd = [[UIActivityIndicatorView alloc] initWithFrame:CGRectMake(240, 10, 100, 35)];
        _activityInd.color = [UIColor blackColor];
        _activityInd.backgroundColor = [UIColor blackColor];
        _activityInd.activityIndicatorViewStyle = UIActivityIndicatorViewStyleWhite;
        _activityInd.hidesWhenStopped = NO;
        [_activityInd startAnimating];
        _activityInd.tag = kTag;
    }
    return _activityInd;
}
- (UIProgressView *)progressBar
{
    if (nil == _progressBar){
        self.progressBar = [[UIProgressView alloc] initWithFrame:CGRectMake(150, 23, 160, 20)];
        
        _progressBar.progress = 0.5;
        _progressBar.tag = kTag;
        
    }
    return _progressBar;
}
- (UIStepper *)stepper
{
    if (nil == _stepper){
        self.stepper = [[UIStepper alloc] initWithFrame:CGRectMake(200, 8, 200, 35)];
        _stepper.tag = kTag;
        _stepper.minimumValue = 1;
        _stepper.maximumValue = 10;
        _stepper.stepValue = 4;
        [_stepper addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventValueChanged];
        
    }
    return _stepper;
    
}
- (void)tapped:(UIStepper *)sender
{
    NSLog(@"%f", sender.value);
}
//记得修改成简单的方法
- (void)tappedAction:(UIBarButtonItem *)sender
{
    if (_switchCtl.thumbTintColor != [UIColor blueColor]){
        _switchCtl.onTintColor = [UIColor redColor];
        _switchCtl.thumbTintColor = [UIColor blueColor];
        //      _sliderCtl.minimumTrackTintColor = [UIColor blueColor];
        _activityInd.color = [UIColor blueColor];
        _progressBar.progressTintColor = [UIColor blueColor];
        _progressBar.trackTintColor = [UIColor blueColor];
        //      _stepper.tintColor = [UIColor blueColor];
        self.view.tintColor = [UIColor blueColor];
    } else {
        _switchCtl.onTintColor = nil;
        _switchCtl.thumbTintColor = nil;
        self.view.tintColor = nil;
        _activityInd.color = nil;
        _progressBar.progressTintColor = nil;
        _progressBar.trackTintColor = nil;
        
    }
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return 7;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = [NSString stringWithFormat:@"identify%d",indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleDefault reuseIdentifier:identifier];
    }
    
    if (indexPath.row == 0) {
        
        cell.textLabel.text = [self.controlsData[indexPath.section] objectForKey:kFCellTitleKey];
        cell.accessoryView = [self.controlsData[indexPath.section] objectForKey:kViewKey];
        
    } else {
        
        cell.textLabel.text = [self.controlsData[indexPath.section] objectForKey:kSCellTitleKey];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.numberOfLines = 2;
        
    }
    //直接没有灰色
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    //    [self.tableView performSelector:@selector(deselectItemAtIndexPath:animated:) withObject:indexPath afterDelay:0.5];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    //选择后两秒灰色消失
    [tableView performSelector:@selector(deselectRowAtIndexPath:animated:) withObject:indexPath afterDelay:0.2];
    
}
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return [self.controlsData[section] objectForKey:kSectionTitleKey];
}



@end
