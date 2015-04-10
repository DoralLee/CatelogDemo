//
//  QYTransitionViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-23.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYTransitionViewController.h"

@interface QYTransitionViewController ()
@property (nonatomic, strong) UIView *containView;
@property (nonatomic, strong) UIImageView *flipImage;
@property (nonatomic, strong) UIImageView *mainImage;
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
    CGRect frame = CGRectMake(10, 94, 300, 250);
    _containView = [[UIView alloc] initWithFrame:frame];
    [self.view addSubview:_containView];
    
    frame = CGRectMake(0, 0, 300, 250);
    _mainImage = [[UIImageView alloc] initWithFrame:frame];
    _mainImage.image = [UIImage imageNamed:@"scene1.jpg"];
   [self.containView addSubview:_mainImage];
    _flipImage = [[UIImageView alloc] initWithFrame:frame];
    _flipImage.image = [UIImage imageNamed:@"scene2.jpg"];
    
    self.btn = [[UIButton alloc] initWithFrame:CGRectMake(0, 518, 160, 50)];
    [_btn setTitle:@"Flip Image" forState:UIControlStateNormal];
    [_btn setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _btn.backgroundColor = [UIColor lightGrayColor];
    _btn.titleLabel.textAlignment = NSTextAlignmentRight;
  
    [self.view addSubview:_btn];
    [_btn addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventTouchUpInside];
    
    self.btn1 = [[UIButton alloc] initWithFrame:CGRectMake(160, 518, 160, 50)];
    [_btn1 setTitle:@"Curl Image" forState:UIControlStateNormal];
    [_btn1 setTitleColor:[UIColor blueColor] forState:UIControlStateNormal];
    _btn1.backgroundColor = [UIColor lightGrayColor];
 
    [self.view addSubview:_btn1];
    [_btn1 addTarget:self action:@selector(tappedCurl:) forControlEvents:UIControlEventTouchUpInside];
    
}
- (void)tapped:(UIButton *)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:[self.mainImage superview]?   UIViewAnimationTransitionFlipFromLeft :UIViewAnimationTransitionFlipFromRight forView:self.containView cache:YES];
    if ([self.mainImage superview]) {
        [self.mainImage removeFromSuperview];
        [self.containView addSubview:self.flipImage];
    } else {
        [self.flipImage removeFromSuperview];
        [self.containView addSubview:self.mainImage];
    }
    [UIView commitAnimations];
}

- (void)tappedCurl:(UIButton *)sender
{
    [UIView beginAnimations:nil context:NULL];
    [UIView setAnimationDuration:0.75];
    [UIView setAnimationTransition:[self.mainImage superview]?  UIViewAnimationTransitionCurlUp:UIViewAnimationTransitionCurlDown forView:self.containView cache:YES];
    if ([self.mainImage superview]) {
        [self.mainImage removeFromSuperview];
        [self.containView addSubview:self.flipImage];
    } else {
        [self.flipImage removeFromSuperview];
        [self.containView addSubview:_mainImage];
    }
    [UIView commitAnimations];
}
@end
