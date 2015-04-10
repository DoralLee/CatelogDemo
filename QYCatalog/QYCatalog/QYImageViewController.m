//
//  QYImageViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-23.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYImageViewController.h"
float anitimation;
@interface QYImageViewController ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UISlider *slider;
@end

@implementation QYImageViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Image";
        
        
        
        
        
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor= [UIColor blackColor];
    _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(30, 100, 260, 200)];
    UIImage *img1 = [UIImage imageNamed:@"scene1.jpg"];
    UIImage *img2 = [UIImage imageNamed:@"scene2.jpg"];
    UIImage *img3 = [UIImage imageNamed:@"scene3.jpg"];
    UIImage *img4 = [UIImage imageNamed:@"scene4.jpg"];
    UIImage *img5 = [UIImage imageNamed:@"scene5.jpg"];
    NSArray *imgs = @[img1, img2, img3, img4, img5];
    _imageView.animationImages = imgs;
    [self.view addSubview:_imageView];
    self.slider = [[UISlider alloc] initWithFrame:CGRectMake(20, 400, 280, 20)];
    _slider.minimumValue = 1;
    _slider.maximumValue = 5;
    _slider.value = 2;
    _imageView.animationDuration = _slider.value;
    [self.view addSubview:_slider];
    [_slider addTarget:self action:@selector(sliderAction:) forControlEvents:UIControlEventValueChanged];
    [_imageView startAnimating];
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(110, 430, 100, 50)];
    label.text = @"Duration";
    label.textColor = [UIColor whiteColor];
    [self.view addSubview:label];
    
}

- (void) sliderAction:(UISlider *)sender
{
    _imageView.animationDuration = sender.value;
    if (!_imageView.isAnimating) {
        [_imageView startAnimating];
    }
}
- (void) viewDidDisappear:(BOOL)animated
{
    [super viewDidDisappear:animated];
    if (_imageView.isAnimating) {
        [_imageView stopAnimating];
    }
    NSLog(@"%s", __func__);
}
- (void) viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    if (!_imageView.isAnimating) {
        [_imageView startAnimating];
    }
    NSLog(@"%s", __func__);
}


@end
