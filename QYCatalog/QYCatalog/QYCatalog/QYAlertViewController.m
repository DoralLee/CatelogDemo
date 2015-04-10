//
//  QYAlertViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-25.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYAlertViewController.h"

NSString * const kSectionNameKey = @"sectin";
NSString * const kFirstKey = @"btn";
NSString * const kSecondKey = @"secondName";

@interface QYAlertViewController ()
@property (nonatomic, strong) NSArray *alertsData;

@end

@implementation QYAlertViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Alerts";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.clearsSelectionOnViewWillAppear = NO;

    self.alertsData = @[@{kSectionNameKey: @"UIACTIONSHEET",
                          kFirstKey:@"Show Simple",
                          kSecondKey:@"AlertsViewController.m - dialogSimpleAction"},
                        @{kSectionNameKey: @"UIACTIONSHEET",
                          kFirstKey:@"Show OK-Cancel",
                          kSecondKey:@"AlertsViewController.m - dialogOKCancelAction"},
                        @{kSectionNameKey: @"UIACTIONSHEET",
                          kFirstKey:@"Show Customized",
                          kSecondKey:@"AlertsViewController.m - dialogOtherAction"},
                        @{kSectionNameKey: @"UIALERTVIEW",
                          kFirstKey:@"Show Simple",
                          kSecondKey:@"AlertsViewController.m - alertSimpleAction"},
                        @{kSectionNameKey: @"UIALERTVIEW",
                          kFirstKey:@"Show OK-Cancel",
                          kSecondKey:@"AlertsViewController.m - alertOKCancelAction"},
                        @{kSectionNameKey: @"UIALERTVIEW",
                          kFirstKey:@"Show Custom",
                          kSecondKey:@"AlertsViewController.m - alertOtherAction"},
                        @{kSectionNameKey: @"UIALERTVIEW",
                          kFirstKey:@"Secure Text Input",
                          kSecondKey:@"AlertsViewController.m - alertSecureTextAction"}];
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
    } else {
        
        cell.accessoryView = nil;
    }
    if (indexPath.row == 0) {
        
        cell.textLabel.text = [self.alertsData[indexPath.section] objectForKey:kFirstKey];
        
    } else {
        
        cell.textLabel.text = [self.alertsData[indexPath.section] objectForKey:kSecondKey];
        cell.textLabel.font = [UIFont systemFontOfSize:12];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.numberOfLines = 2;
        
    }

    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return [self.alertsData[section] objectForKey:kSectionNameKey];
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row == 0 ? 50 :30;

}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
    UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"OK" otherButtonTitles:nil, nil];
     UIActionSheet *actionSheet2 = [[UIActionSheet alloc] initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"Button1" otherButtonTitles:@"Button2", nil];
    UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
     UIAlertView *alert4 = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
     UIAlertView *alert5 = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button1", @"Button2", nil];
     UIAlertView *alert6 = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
    alert6.alertViewStyle = UIAlertViewStyleSecureTextInput;
    if (indexPath.row == 0) {
        switch (indexPath.section) {
            case 0:
                [actionSheet showInView:self.view];
                break;
            case 1:
                [actionSheet1 showInView:self.view];
                break;
            case 2:
                [actionSheet2 showInView:self.view];
                break;
            case 3:
                [alert3 show];
                break;
            case 4:
                [alert4 show];
                break;
            case 5:
                [alert5 show];
                break;
            case 6:
                [alert6 show];
                break;
            default:
                break;
        }
        
        
    }


}

@end
