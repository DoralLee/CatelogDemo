//
//  QYPickerViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-25.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYPickerViewController.h"

@interface QYPickerViewController ()
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) NSArray *pickTitle;
@property (nonatomic, strong) NSArray *pickCount;
@property (nonatomic, strong) UIPickerView *pick;
@property (nonatomic, strong) UILabel *label;
@end

@implementation QYPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Pickers";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 518, 320, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    NSArray *items = @[@"UIPicker", @"UIDatePicker", @"Custom"];
    self.segment = [[UISegmentedControl alloc] initWithItems:items];
    _segment.frame = CGRectMake(10, 528, 300, 30);
    _segment.tintColor = [UIColor darkGrayColor];
    [self.view addSubview:_segment];
    [_segment addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventValueChanged];
    
    self.pickTitle = @[@"John Appleseed", @"Chris Armstrong", @"Serena Auroux", @"Susan Bean", @"Luis Becerra", @"Kate Bell", @"Alain Briere"];
    self.pickCount = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6"];
    self.pick = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 64, 320, 216)];
    _pick.delegate = self;
    _pick.dataSource = self;
    [self.view addSubview:_pick];
    
    _label = [[UILabel alloc] initWithFrame:CGRectMake(60, 300, 200, 50)];
    _label.textAlignment = NSTextAlignmentCenter;
    [self.view addSubview:_label];
}
- (void)tapped:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
           
            break;
            
        default:
            break;
    }
    
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return 7;
}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{
    if (component == 0) {
        return self.pickTitle[row];
    } else {
        
        return self.pickCount[row];
    }

}
- (CGFloat)pickerView:(UIPickerView *)pickerView widthForComponent:(NSInteger)component
{

    if (component == 0) {
        return 260;
    } else {
    
        return 60;
    }

}
- (CGFloat)pickerView:(UIPickerView *)pickerView rowHeightForComponent:(NSInteger)component
{
    return 40;
}
static NSString *title = @"John Appleseed";
static NSString *count = @"0";

- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        title = [(UILabel *)_pickTitle[row] text];
    } else {
    
        count = [(UILabel *)_pickCount[row] text];
    }
    _label.text = [NSString stringWithFormat:@"%@ - %@",title, count];
}
@end
