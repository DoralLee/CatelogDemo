//
//  QYToolBarViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-26.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYToolBarViewController.h"

@interface QYToolBarViewController ()

@end

@implementation QYToolBarViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Toolbar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view from its nib.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
