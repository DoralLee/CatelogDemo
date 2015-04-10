//
//  QYSearchViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-23.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//
#import "QYSearchViewController.h"

@interface QYSearchViewController ()
@property (nonatomic, strong) UISearchBar *searchBar;
@property (nonatomic, strong) UISegmentedControl *segment;
@end

@implementation QYSearchViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"SearchBar";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.searchBar = [[UISearchBar alloc] initWithFrame:CGRectMake(0, 64, 320, 44)];
    _searchBar.showsCancelButton = YES;
    _searchBar.showsBookmarkButton = YES;
    self.searchBar.delegate = self;
    _searchBar.searchBarStyle = UISearchBarStyleDefault;
    // [self.searchBar setImage:[UIImage imageNamed:@"bookmarkImageHighlighted"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
    [self.view addSubview:_searchBar];
    NSArray *items = @[@"Normal",@"tinted",@"background"];
    self.segment = [[UISegmentedControl alloc] initWithItems:items];
    _segment.frame = CGRectMake(40, 150, 240, 30);
    _segment.tintColor = [UIColor lightGrayColor];
    [_segment addTarget:self action:@selector(segmentAction:) forControlEvents:UIControlEventValueChanged];
    [self.view addSubview:_segment];
}
- (void)segmentAction:(UISegmentedControl *)sender
{
    //在公共部分置空即可
    self.searchBar.barTintColor = nil;
    self.searchBar.backgroundImage = nil;
    [self.searchBar setImage:nil forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
    switch (sender.selectedSegmentIndex) {
            //        case 0:
            //            self.searchBar.barTintColor = nil;
            //            self.searchBar.backgroundImage = nil;
            //            [self.searchBar setImage:nil forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
            //            self.searchBar.barTintColor = [UIColor lightGrayColor];
            //            break;
            case 1:
            //            self.searchBar.barTintColor = nil;
            //            self.searchBar.backgroundImage = nil;
            //             [self.searchBar setImage:nil forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
            //       self.searchBar.tintColor = [UIColor blueColor];
                self.searchBar.barTintColor = [UIColor redColor];
                break;
            case 2:
            //   self.searchBar.barTintColor = nil;
                [self.searchBar setImage:[UIImage imageNamed:@"bookmarkImage"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateNormal];
                [self.searchBar setImage:[UIImage imageNamed:@"bookmarkImageHighlighted"] forSearchBarIcon:UISearchBarIconBookmark state:UIControlStateHighlighted];
                self.searchBar.backgroundImage = [UIImage imageNamed:@"searchBarBackground"];
            
                break;
                default:
                break;
    }
    
}
- (void)searchBarTextDidBeginEditing:(UISearchBar *)searchBar
{
    
    if (self.navigationController.navigationBarHidden == NO) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        self.searchBar.frame = CGRectMake(0, 20, 320, 44);
    } else {
        
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.searchBar.frame = CGRectMake(0, 64, 320, 44);
    }
}
- (void)searchBarCancelButtonClicked:(UISearchBar *) searchBar
{
    
    [searchBar resignFirstResponder];
    if (self.navigationController.navigationBarHidden == NO) {
        [self.navigationController setNavigationBarHidden:YES animated:YES];
        self.searchBar.frame = CGRectMake(0, 20, 320, 44);
    } else {
        
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.searchBar.frame = CGRectMake(0, 64, 320, 44);
    }
    NSLog(@"%s", __func__);
}
- (void)searchBarSearchButtonClicked:(UISearchBar *)searchBar
{
    
    if ([searchBar resignFirstResponder]) {
        
        [self.navigationController setNavigationBarHidden:NO animated:YES];
        self.searchBar.frame = CGRectMake(0, 64, 320, 44);
        
    }
    NSLog(@"%s", __func__);
}
- (void)searchBarBookmarkButtonClicked:(UISearchBar *)searchBar
{
    
    NSLog(@"%s", __func__);
    
}
@end
