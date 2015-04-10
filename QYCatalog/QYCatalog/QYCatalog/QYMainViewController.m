//
//  QYMainViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-21.
//  Copyright (c) 2014年 FULLUSERNAME. All rights r∂eserved.
//

#import "QYMainViewController.h"
#import "QYButtonViewController.h"
#import "QYControlsViewController.h"
#import "QYTextFieldsViewController.h"
#import "QYSearchViewController.h"
#import "QYTextViewController.h"
#import "QYImageViewController.h"
#import "QYTransitionViewController.h"
#import "QYSegmentViewController.h"
#import "QYAlertViewController.h"
#import "QYWebViewController.h"
#import "QYPickerViewController.h"
#import "QYToolBarViewController.h"
NSString *identifier = @"cellID";
static NSString * const kTitleKey = @"title";
static NSString * const kDetailTitleKey = @"detailTitle";
static NSString * const kViewControllerKey = @"viewController";

@interface QYTableViewCell : UITableViewCell

@end
@implementation QYTableViewCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{

    return [super initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
}

@end

@interface QYMainViewController ()
@property (nonatomic, strong) NSMutableArray *menuList;
@end

@implementation QYMainViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Catalog";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.menuList = [NSMutableArray array];
    QYButtonViewController *buttonVC = [[QYButtonViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.menuList addObject:@{kTitleKey:@"Buttons",
                               kDetailTitleKey:@"Various uses of UIButton",kViewControllerKey:buttonVC}];
    QYControlsViewController *controlsVC = [[QYControlsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.menuList addObject:@{kTitleKey:@"Controls",
                               kDetailTitleKey:@"Various uses of UIControl",
                               kViewControllerKey:controlsVC}];
    QYTextFieldsViewController *textFieldVC = [[QYTextFieldsViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.menuList addObject:@{kTitleKey: @"TextFields",
                               kDetailTitleKey:@"Various uses of UISearchBar",
                               kViewControllerKey:textFieldVC}];
    QYSearchViewController *searchBarVC = [[QYSearchViewController alloc] init];
    [self.menuList addObject:@{kTitleKey: @"SearchBar",
                               kDetailTitleKey:@"Various uses of UISearchBar",
                               kViewControllerKey:searchBarVC}];

    QYTextViewController *textViewVC = [[QYTextViewController alloc] init];
    [self.menuList addObject:@{kTitleKey: @"TextView",
                               kDetailTitleKey:@"Use of UITextView",
                               kViewControllerKey:textViewVC}];
    QYImageViewController *imageVC = [[QYImageViewController alloc] init];
    [self.menuList addObject:@{kTitleKey: @"Image",
                               kDetailTitleKey:@"Use of UIImageView",
                               kViewControllerKey:imageVC}];
    QYTransitionViewController *transitionVC = [[QYTransitionViewController alloc] init];
    [self.menuList addObject:@{kTitleKey: @"Transition",
                               kDetailTitleKey:@"Shows UIViewAnimationTransitions",
                               kViewControllerKey:transitionVC}];
    QYSegmentViewController *segmentVC = [[QYSegmentViewController alloc] init];
    [self.menuList addObject:@{kTitleKey: @"Segment",
                               kDetailTitleKey:@"Various uses of UISegmentedControl",
                               kViewControllerKey:segmentVC}];
    QYAlertViewController *alertVC = [[QYAlertViewController alloc] initWithStyle:UITableViewStyleGrouped];
    [self.menuList addObject:@{kTitleKey: @"Alerts",
                               kDetailTitleKey:@"Various uses of UIAlertView, UIActionSheet",
                               kViewControllerKey:alertVC}];
    QYWebViewController *webVC = [[QYWebViewController alloc] init];
    [self.menuList addObject:@{kTitleKey: @"Webs",
                               kDetailTitleKey:@"Use of UIWebView",
                               kViewControllerKey:webVC}];
    QYPickerViewController *pickerVC = [[QYPickerViewController alloc] init];
    [self.menuList addObject:@{kTitleKey: @"Pickers",
                               kDetailTitleKey:@"Uses of UIDatePicker,UIPickerView",
                               kViewControllerKey:pickerVC}];
    QYToolBarViewController *toolBarVC = [[QYToolBarViewController alloc] init];
    [self.menuList addObject:@{kTitleKey: @"Toolbar",
                               kDetailTitleKey:@"Uses of UIToolbar",
                               kViewControllerKey:toolBarVC}];
    self.clearsSelectionOnViewWillAppear = YES;
    UIBarButtonItem  *tempBarButton = [[UIBarButtonItem alloc] init];
    tempBarButton.title = @"Back";
    [self.navigationController.navigationBar setTintColor:[UIColor grayColor]];
    tempBarButton.tintColor = [UIColor grayColor];
    self.navigationItem.backBarButtonItem = tempBarButton;
    [self.tableView registerClass:[QYTableViewCell class] forCellReuseIdentifier:identifier];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.menuList.count;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSString *identifier = @"cellID";
    /*
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier];
    if (nil == cell) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:identifier];
        cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    }
    cell.textLabel.text = [self.menuList[indexPath.row] objectForKey:kTitleKey];
    cell.detailTextLabel.text = [self.menuList[indexPath.row] objectForKey:kDetailTitleKey];*/
    
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:identifier forIndexPath:indexPath];
    cell.accessoryType = UITableViewCellAccessoryDisclosureIndicator;
    cell.textLabel.text = [self.menuList[indexPath.row] objectForKey:kTitleKey];
    cell.detailTextLabel.text = [self.menuList[indexPath.row] objectForKey:kDetailTitleKey];
    
    return cell;
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{

    UIViewController *viewController = [self.menuList[indexPath.row] objectForKey:kViewControllerKey];
    [self.navigationController pushViewController:viewController animated:NO];

}
@end
