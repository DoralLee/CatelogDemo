//
//  QYTextFieldsViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-22.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYTextFieldsViewController.h"

NSString * const kSection = @"sectionTitle";
NSString * const kTextFieldsKey = @"view";
NSString * const kTCellTitleKey = @"sCellTitle";

@interface QYTextFieldsViewController ()
@property (nonatomic, strong) NSArray *textFieldsData;
@property (nonatomic, strong) UITextField *textFieldNormal;
@property (nonatomic, strong) UITextField *textFieldRounded;
@property (nonatomic, strong) UITextField *textFieldSecure;
@property (nonatomic, strong) UITextField *textFieldLeftView;
@end

@implementation QYTextFieldsViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"TextFields";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    self.textFieldsData = @[@{kSection: @"UITEXTFIELD",
                              kTextFieldsKey:self.textFieldNormal,
                              kTCellTitleKey:@"QYTextFieldController.m:textFieldNormal"},
                            @{kSection: @"UITEXTFIELD ROUNDED",
                              kTextFieldsKey:self.textFieldRounded,
                              kTCellTitleKey:@"QYTextFieldController.m:textFieldRounded"},
                            @{kSection: @"UITEXTFIELD SECURE",
                              kTextFieldsKey:self.textFieldSecure,
                              kTCellTitleKey:@"QYTextFieldController.m:textFieldSecure"},
                            @{kSection: @"TEXTFIELD(WITH LEFTVIEW)",
                              kTextFieldsKey:self.textFieldLeftView,
                              kTCellTitleKey:@"QYTextFieldController.m:textFieldLeftView"}];
    
}
- (UITextField *)textFieldNormal
{
    if (nil == _textFieldNormal){
        self.textFieldNormal = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
        _textFieldNormal.borderStyle = UITextBorderStyleBezel;
        _textFieldNormal.placeholder = @"<enter text>";
        _textFieldNormal.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textFieldNormal.returnKeyType =  UIReturnKeyDone;
        
        _textFieldNormal.font = [UIFont systemFontOfSize:12];
        _textFieldNormal.textColor = [UIColor redColor];
        _textFieldNormal.delegate = self;
        //   NSLog(@"%d",_textFieldNormal.returnKeyType);
    }
    return _textFieldNormal;
}

- (UITextField *)textFieldRounded
{
    if (nil == _textFieldRounded){
        self.textFieldRounded = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
        _textFieldRounded.borderStyle = UITextBorderStyleRoundedRect;
        _textFieldRounded.placeholder = @"<enter text>";
        _textFieldRounded.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textFieldRounded.returnKeyType = UIReturnKeyDone;
        _textFieldRounded.delegate = self;
    }
    return _textFieldRounded;
}
- (UITextField *)textFieldSecure
{
    if (nil == _textFieldSecure){
        self.textFieldSecure = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
        _textFieldSecure.borderStyle = UITextBorderStyleBezel;
        _textFieldSecure.placeholder = @"<enter password>";
        _textFieldSecure.secureTextEntry = YES;
        _textFieldSecure.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textFieldSecure.returnKeyType = UIReturnKeyDone;
        _textFieldSecure.keyboardType = UIKeyboardTypeASCIICapable;
        _textFieldSecure.delegate = self;
    }
    return _textFieldSecure;
}
- (UITextField *)textFieldLeftView
{
    if (nil == _textFieldLeftView){
        self.textFieldLeftView = [[UITextField alloc] initWithFrame:CGRectMake(20, 10, 280, 30)];
        _textFieldLeftView.borderStyle = UITextBorderStyleBezel;
        _textFieldLeftView.placeholder = @"<enter text>";
        _textFieldLeftView.clearButtonMode = UITextFieldViewModeWhileEditing;
        _textFieldLeftView.returnKeyType = UIReturnKeyDone;
        //  UIImageView *leftView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 24, 24)];
        UIImageView *leftView = [[UIImageView alloc] initWithImage:[UIImage imageNamed:@"segment_check"]];
        //  leftView.image = [UIImage imageNamed:@"segment_check.png"];
        _textFieldLeftView.leftView = leftView;
        _textFieldLeftView.leftViewMode = UITextFieldViewModeAlways;
        _textFieldLeftView.delegate = self;
    }
    return _textFieldLeftView;
}

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    
    [textField resignFirstResponder];
    return YES;
}
#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    return 4;
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
        
        [cell.contentView addSubview:[self.textFieldsData[indexPath.section] objectForKey:kTextFieldsKey]];
        NSLog(@"%@", cell);
    } else {
        
        cell.textLabel.text = [self.textFieldsData[indexPath.section] objectForKey:kTCellTitleKey];
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
    
    return [self.textFieldsData[section] objectForKey:kSection];
}

@end
