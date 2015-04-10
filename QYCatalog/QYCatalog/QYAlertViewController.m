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
    
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
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
    if (indexPath.row == 0) {
        switch (indexPath.section) {
            case 0:
            {
                UIActionSheet *actionSheet = [[UIActionSheet alloc] initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:@"OK" destructiveButtonTitle:nil otherButtonTitles:nil, nil];
                [actionSheet showInView:self.view];
            }
                break;
            case 1:
            { UIActionSheet *actionSheet1 = [[UIActionSheet alloc] initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:@"Cancel" destructiveButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [actionSheet1 showInView:self.view];
            }
                break;
            case 2:
            {
                UIActionSheet *actionSheet2 = [[UIActionSheet alloc] initWithTitle:@"UIActionSheet<title>" delegate:self cancelButtonTitle:nil destructiveButtonTitle:@"Button1" otherButtonTitles:@"Button2", nil];
                [actionSheet2 showInView:self.view];
            }
                break;
            case 3:
            {
                UIAlertView *alert3 = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"OK" otherButtonTitles:nil, nil];
                [alert3 show];
            }
                break;
            case 4:
            {
                 UIAlertView *alert4 = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                [alert4 show];
            }
                break;
            case 5:
            {
                   UIAlertView *alert5 = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"Button1", @"Button2", nil];
                [alert5 show];
            }
                break;
            case 6:
            {
                UIAlertView *alert6 = [[UIAlertView alloc] initWithTitle:@"UIAlertView" message:@"<Alert message>" delegate:self cancelButtonTitle:@"Cancel" otherButtonTitles:@"OK", nil];
                alert6.alertViewStyle = UIAlertViewStyleLoginAndPasswordInput;
                [alert6 show];
            }
                break;
            default:
                break;
        }
        
        
    }


}
- (void)actionSheet:(UIActionSheet *)actionSheet clickedButtonAtIndex:(NSInteger)buttonIndex
{

    NSLog(@"%d",buttonIndex);

}
- (void)alertView:(UIAlertView *)alertView clickedButtonAtIndex:(NSInteger)buttonIndex
{
    
    NSLog(@"%d",buttonIndex);
    UITextField *username = [alertView textFieldAtIndex:0];
    UITextField *password = [alertView textFieldAtIndex:1];
    NSLog(@"%@ %@",username.text,password.text);
    
}
@end
