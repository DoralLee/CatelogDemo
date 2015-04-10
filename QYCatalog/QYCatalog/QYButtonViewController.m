//
//  QYButtonViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-21.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYButtonViewController.h"


//NSString *identifierF = @"controlsCella";
//NSString *identifierS = @"controlsCellb";
@interface QYButtonViewController ()
@property (nonatomic, strong) NSArray *buttonList;
@property (nonatomic, strong) UIButton *gray;
@property (nonatomic, strong) UIButton *image;
@property (nonatomic, strong) UIButton *rounded;
@property (nonatomic, strong) UIButton *custom;
@property (nonatomic, strong) UIButton *disclosure;
@property (nonatomic, strong) UIButton *infoLight;
@property (nonatomic, strong) UIButton *infoDark;
@end
static NSString *kHeaderKey = @"sectionTitle";
static NSString *kTextLabelKey = @"textLabel";
static NSString *kSourceKey = @"sourceTitle";
static NSString *kButtonKey = @"button";
static NSString *kIdentifier = @"identifierID";
static NSString *kIdentifierF = @"identifierIDf";
static const NSInteger kButtonTag = 100;
@implementation QYButtonViewController

- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        self.title = @"Buttons";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    //self.buttonList = [NSArray array];
    
    self.buttonList = @[@{kHeaderKey:@"UIBUTTON",
                          kTextLabelKey:@"Background Image",
                          kButtonKey:self.gray,
                          kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)grayButton"},
                        @{kHeaderKey:@"UIBUTTON",
                          kButtonKey:self.image,
                          kTextLabelKey:@"Button with Image",
                          kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)imageButton"},
                        @{kHeaderKey:@"UIBUTTONTYPEROUNDEDRECT",
                          kTextLabelKey:@"Rounded Button",
                          kButtonKey:self.rounded,
                          kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)roundedButtonType"},
                        @{kHeaderKey:@"UIBUTTONTYPEROUNDEDRECT",
                          kButtonKey:self.custom,
                          kTextLabelKey:@"Attributed Text",
                          kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)attr TextButton"},
                        @{kHeaderKey:@"UIBUTTONTYPEDETAILDISCLOSURE",
                          kButtonKey:self.disclosure,
                          kTextLabelKey:@"Detail Disclosure",
                          kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)detailDisclosureButton"} ,
                        @{kHeaderKey:@"UIBUTTONTYPEINFOLIGHE",
                          kButtonKey:self.infoLight,
                          kTextLabelKey:@"Info Light",
                          kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)inforLightButtonType"},
                        @{kHeaderKey:@"UIBUTTONTYPEINFODARK",
                          kButtonKey:self.infoDark,
                          kTextLabelKey:@"Info Dark",
                          kSourceKey:@"QYButtonsViewController.m:\n(UIButton *)inforDarkButton"}];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kIdentifier];
    [self.tableView registerClass:[UITableViewCell class] forCellReuseIdentifier:kIdentifierF];
    
}
- (UIButton *)gray
{
    if (_gray == nil) {
        
        CGRect frame = CGRectMake(200, 3, 100, 45);
        [_gray setTitle:@"Gray" forState:UIControlStateNormal];
        UIImage *bgImg = [UIImage imageNamed:@"whiteButton"];
        UIImage *hightbgImg = [UIImage imageNamed:@"blueButton"];
        [_gray setTitleColor:[UIColor blackColor] forState:UIControlStateNormal];
        _gray = [[self class] newButtonWithTitle:@"Gray" frame:frame image:bgImg hightImage:hightbgImg darkTextColor:YES];
        _gray.tag = kButtonTag;
        NSLog(@"%@", _gray.titleLabel);
        
    }
    return _gray;
}
- (UIButton *)image
{
    if (_image == nil) {
        
        CGRect frame = CGRectMake(200, 3, 100, 45);
        UIImage *bgImg = [UIImage imageNamed:@"whiteButton"];
        UIImage *hightbgImg = [UIImage imageNamed:@"blueButton"];
        //        [_image setBackgroundImage:bgImg forState:UIControlStateNormal];
        //        [_image setBackgroundImage:hightbgImg forState:UIControlStateHighlighted];
        
        _image = [[self class] newButtonWithTitle:nil frame:frame image:bgImg hightImage:hightbgImg darkTextColor:NO];
        [self.image setImage:[UIImage imageNamed:@"UIButton_custom"] forState:UIControlStateNormal];
        _image.tag = kButtonTag;
        NSLog(@"%@", _image.titleLabel);
        
    }
    return _image;
}
+ (UIButton *)newButtonWithTitle:(NSString *)title frame:(CGRect)frame image:(UIImage *)image hightImage:(UIImage *)hightImage darkTextColor:(BOOL)darkTextColor
{
    UIButton *button = [[UIButton alloc] initWithFrame:frame];
    button.contentHorizontalAlignment = UIControlContentHorizontalAlignmentCenter;
    button.contentVerticalAlignment = UIControlContentVerticalAlignmentCenter;
    [button setTitle:title forState:UIControlStateNormal];
    UIEdgeInsets edgeInsets = UIEdgeInsetsMake(12, 12, 12, 12);
    [button setBackgroundImage:[image resizableImageWithCapInsets:edgeInsets] forState:UIControlStateNormal];
    [button setBackgroundImage:[hightImage resizableImageWithCapInsets:edgeInsets] forState:UIControlStateHighlighted];
    if (darkTextColor) {
        [button setTitleColor:[UIColor darkTextColor] forState:UIControlStateNormal];
    }
    return button;
}
- (UIButton *)rounded
{
    
    if (_rounded == nil) {
    
        _rounded = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _rounded.frame = CGRectMake(200, 3, 100, 40);
        [_rounded setTitle:@"Rounded" forState:UIControlStateNormal];
        NSLog(@"%@", _rounded.titleLabel);
        _rounded.tag = kButtonTag;
        
    }
    return _rounded;
    
}

- (UIButton *)custom
{
    
    if (_custom == nil) {
        
        _custom = [UIButton buttonWithType:UIButtonTypeRoundedRect];
        _custom.frame = CGRectMake(200, 3, 100, 40);
        [_custom setTitle:@"Rounded" forState:UIControlStateNormal];
        //[btn4 setTitleColor:[UIColor greenColor] forState:UIControlStateHighlighted];
        //   _custom.titleLabel.tag = kLabelTag;
        
        [_custom setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
        NSMutableAttributedString *hight = [[NSMutableAttributedString alloc] initWithString:@"Rounded" attributes:@{NSForegroundColorAttributeName: [UIColor greenColor]}];
        [_custom setAttributedTitle:hight forState:UIControlStateHighlighted];
        NSMutableAttributedString *normal = [[NSMutableAttributedString alloc] initWithString:@"Rounded"];
        [normal addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:2] range:NSMakeRange(2, 5)];
        [normal addAttribute:NSForegroundColorAttributeName value:[UIColor grayColor] range:NSMakeRange(1, 5)];
        [_custom setAttributedTitle:normal forState:UIControlStateNormal];
        _custom.tag = kButtonTag;
        NSLog(@"%@", _custom.titleLabel);
        
    }
    
    return _custom;
}
- (UIButton *)disclosure
{
    
    if (_disclosure == nil) {
        
        
        _disclosure = [UIButton buttonWithType:UIButtonTypeDetailDisclosure];
        _disclosure.frame = CGRectMake(200, 3, 100, 35);
        _disclosure.backgroundColor = [UIColor grayColor];
        _disclosure.tag = kButtonTag;
        NSLog(@"%@", _disclosure.titleLabel.text);
        
    }
    
    return _disclosure;
}
- (UIButton *)infoLight
{
    if (_infoLight == nil) {
        _infoLight = [UIButton buttonWithType:UIButtonTypeInfoLight];
        _infoLight.frame = CGRectMake(200, 3, 100, 35);
        _infoLight.tag = kButtonTag;
        NSLog(@"%@", _infoLight.titleLabel);
        
    }
    
    return _infoLight;
}

- (UIButton *)infoDark
{
    if (_infoDark == nil) {
        
        
        _infoDark = [UIButton buttonWithType:UIButtonTypeInfoDark];
        _infoDark.frame = CGRectMake(200, 3, 100, 35);
        _infoDark.tag = kButtonTag;
        NSLog(@"%@", _infoDark.titleLabel);
    }
    
    return _infoDark;
}


- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    
    return self.buttonList.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    
    return 2;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    
    // NSString *identifier = @"identify";
    UITableViewCell *cell = nil;
    if (indexPath.row == 0) {
        cell = [tableView dequeueReusableCellWithIdentifier:kIdentifier];
        UIView *view = [cell.contentView viewWithTag:kButtonTag];
        if (view != nil) {
            [view removeFromSuperview];
        }
        [cell.contentView addSubview:self.buttonList[indexPath.section][kButtonKey]];
        cell.textLabel.text = self.buttonList[indexPath.section][kTextLabelKey];
    } else {
        cell = [tableView dequeueReusableCellWithIdentifier:kIdentifierF];
        cell.textLabel.text =  self.buttonList[indexPath.section][kSourceKey];
        cell.textLabel.font = [UIFont systemFontOfSize:10];
        cell.textLabel.textColor = [UIColor grayColor];
        cell.textLabel.textAlignment = NSTextAlignmentCenter;
        cell.textLabel.numberOfLines = 2;
        
    }
    cell.selectionStyle = UITableViewCellSelectionStyleNone;
    
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section
{
    
    return self.buttonList[section][kHeaderKey];
    
}

- (CGFloat )tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return indexPath.row ? 35 : 50;
    
}

@end
