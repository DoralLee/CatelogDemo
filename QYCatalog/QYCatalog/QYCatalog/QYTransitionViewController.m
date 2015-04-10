//
//  QYTransitionViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-23.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYTransitionViewController.h"

@interface QYTransitionViewController ()
@property (nonatomic, strong) UIImageView *imageView1;
@property (nonatomic, strong) UIButton *btn;
@property (nonatomic, strong) UIButton *btn1;
@end

@implementation QYTransitionViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Transition";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.view.backgroundColor = [UIColor blackColor];
    self.imageView1 = [[UIImageView alloc] initWithFrame:CGRectMake(30, 120, 260, 200)];
    _imageView1.image = [UIImage imageNamed:@"scene1.jpg"];
    _imageView1.tag = 101;
   [self.view addSubview:_imageView1];
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 518, 160, 50)];
    [_btn setTitle:@"Flip Image" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor lightGrayColor];
    _btn.titleLabel.textAlignment = NSTextAlignmentRight;
    _btn.tag = 101;
    [self.view addSubview:_btn];
    [_btn addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(160, 518, 160, 50)];
    [_btn1 setTitle:@"Curl Image" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _btn1.backgroundColor = [UIColor lightGrayColor];
    _btn1.tag = 101;
    [self.view addSubview:_btn1];
    [_btn1 addTarget:self action:@selector(tappedCurl:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)tapped:(UIButton *)sender
{
   
    if (_imageView1.tag == 101) {
    [UIView animateWithDuration:0.5 animations:^{
        [UIView setAnimationTransition:(UIViewAnimationTransitionFlipFromLeft) forView:self.imageView1 cache:NO];
        self.imageView1.image = [UIImage imageNamed:@"scene2.jpg"];
    }];
        _imageView1.tag -= 1;
    } else if (_imageView1.tag == 100)
    {
        [UIView animateWithDuration:0.5 animations:^{
            [UIView setAnimationTransition:(UIViewAnimationTransitionFlipFromRight) forView:self.imageView1 cache:NO];
            self.imageView1.image = [UIImage imageNamed:@"scene1.jpg"];
        }];
        _imageView1.tag += 1;
    
    }
}

- (void)tappedCurl:(UIButton *)sender
{


    if (_imageView1.tag == 101) {
        [UIView animateWithDuration:0.5 animations:^{
            [UIView setAnimationTransition:(UIViewAnimationTransitionCurlUp) forView:self.imageView1 cache:NO];
            self.imageView1.image = [UIImage imageNamed:@"scene2.jpg"];
        }];
        _imageView1.tag -= 1;
    } else if (_imageView1.tag == 100)
    {
        [UIView animateWithDuration:0.5 animations:^{
            [UIView setAnimationTransition:(UIViewAnimationTransitionCurlDown) forView:self.imageView1 cache:NO];
            self.imageView1.image = [UIImage imageNamed:@"scene1.jpg"];
        }];
        _imageView1.tag += 1;
        
    }

}
@end
