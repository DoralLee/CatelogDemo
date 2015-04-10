//
//  QYPickerViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-25.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYPickerViewController.h"
#import "QYCustomController.h"

@interface QYPickerViewController ()
@property (nonatomic, strong) UISegmentedControl *segment;
@property (nonatomic, strong) NSArray *pickTitle;
@property (nonatomic, strong) NSArray *pickCount;
@property (nonatomic, strong) UIPickerView *pickView;
@property (nonatomic, strong) UIDatePicker *datePickView;
@property (nonatomic, strong) UIPickerView *customPickerView;
@property (nonatomic, strong) UILabel *label;
@property (nonatomic, strong) UISegmentedControl *segmentLittle;
@property (nonatomic, strong) QYCustomController *custom;
@property (nonatomic, strong) NSString *text;
@property (nonatomic, strong) NSString *textL;
@end
static NSString *title = @"John Appleseed";
static NSString *count = @"0";
@implementation QYPickerViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Pickers";
    }
    return self;
}

- (void)creatSegment
{
    NSArray *items = @[@"UIPicker", @"UIDatePicker", @"Custom"];
    self.segment = [[UISegmentedControl alloc] initWithItems:items];
    _segment.frame = CGRectMake(10, 528, 300, 30);
    _segment.tintColor = [UIColor darkGrayColor];
    [self.view addSubview:_segment];
    [_segment addTarget:self action:@selector(tapped:) forControlEvents:UIControlEventValueChanged];
}

- (void)creatPickView
{
    self.pickTitle = @[@"John Appleseed", @"Chris Armstrong", @"Serena Auroux", @"Susan Bean", @"Luis Becerra", @"Kate Bell", @"Alain Briere"];
    self.pickCount = @[@"0", @"1", @"2", @"3", @"4", @"5", @"6"];
    self.pickView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 64, 320, 216)];
    _pickView.delegate = self;
    _pickView.dataSource = self;
    [self.view addSubview:_pickView];
    _label = [[UILabel alloc] initWithFrame:CGRectMake(20, 300, 280, 50)];
    _label.textAlignment = NSTextAlignmentCenter;
  //  _label.text = [NSString stringWithFormat:@"%@ - %@",title, count];
    _text = [NSString stringWithFormat:@"%@ - %@",title, count];
    [self.view addSubview:_label];
}

- (void)creatDatePickView
{
    _datePickView = [[UIDatePicker alloc] initWithFrame:CGRectMake(0, 64, 320, 216)];
    _datePickView.datePickerMode = UIDatePickerModeTime;
    _textL = @"UIDatePickerModeTime";
    [self.view addSubview:_datePickView];
    _datePickView.hidden = YES;
    NSArray *itemsL = @[@"1", @"2", @"3", @"4"];
    _segmentLittle = [[UISegmentedControl alloc] initWithItems:itemsL];
    self.segmentLittle.frame = CGRectMake(60, 350, 200, 30);
    [_segmentLittle addTarget:self action:@selector(tappedAction:) forControlEvents:UIControlEventValueChanged];
    _segmentLittle.hidden = YES;
    [self.view addSubview:_segmentLittle];
}

- (void)creatCustomPickView
{
    _custom = [[QYCustomController alloc] init];
    _customPickerView = [[UIPickerView alloc] initWithFrame:CGRectMake(0, 64, 320, 216)];
    self.customPickerView.dataSource = _custom;
    self.customPickerView.delegate = _custom;
    _customPickerView.hidden = YES;
    [self.view addSubview:_customPickerView];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    self.view.backgroundColor = [UIColor lightGrayColor];
    UIView *view = [[UIView alloc] initWithFrame:CGRectMake(0, 518, 320, 50)];
    view.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:view];
    
    
    [self creatSegment];
    
    [self creatPickView];
    _label.text = [NSString stringWithFormat:@"%@ - %@",title, count];
    [self creatDatePickView];
    
    [self creatCustomPickView];
    
}
- (void)tapped:(UISegmentedControl *)sender
{
    switch (sender.selectedSegmentIndex) {
        case 0:
            
            self.pickView.hidden = NO;
            self.datePickView.hidden = YES;
            self.customPickerView.hidden = YES;
            self.segmentLittle.hidden = YES;
            self.label.hidden = NO;
            self.label.text = _text;
            break;
        case 1:
            self.datePickView.hidden = NO;
            self.pickView.hidden = YES;
            self.customPickerView.hidden = YES;
            self.label.hidden = NO;
            self.label.text = _textL;
            self.segmentLittle.hidden = NO;
            self.segmentLittle.selectedSegmentIndex = 0;
            break;
        case 2:
            self.customPickerView.hidden = NO;
            self.pickView.hidden = YES;
            self.datePickView.hidden = YES;
            self.label.hidden = YES;
            self.segmentLittle.hidden = YES;
            break;
        default:
            break;
    }
    
}
- (void)tappedAction:(UISegmentedControl *)sender
{
    
    switch (sender.selectedSegmentIndex) {
        case 0:
            self.datePickView.datePickerMode = UIDatePickerModeTime;
            self.label.text = @"UIDatePickerModeTime";
            break;
        case 1:
            self.datePickView.datePickerMode = UIDatePickerModeDate;
            self.label.text = @"UIDatePickerModeDate";
            break;
        case 2:
            self.datePickView.datePickerMode = UIDatePickerModeDateAndTime;
            self.label.text = @"UIDatePickerModeDateAndTime";
            break;
        case 3:
            self.datePickView.datePickerMode = UIDatePickerModeCountDownTimer;
            self.label.text = @"UIDatePickerModeCountDownTimer";
            break;
        default:
            break;
    }
    _textL = _label.text;
}

- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 2;
}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{
    return self.pickTitle.count;
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


- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    if (component == 0) {
        title = _pickTitle[row] ;
    } else {
    
        count = _pickCount[row] ;
    }
    
    _label.text = [NSString stringWithFormat:@"%@ - %@",title, count];
//    NSString *tempStr = _label.text;
//    NSArray *value = [tempStr componentsSeparatedByString:@"-"];
//    NSString *leftV = value[0];
//    NSString *rightV = value[1];
//    if (0 == component) {
//        //对leftV修改
//    }else {
//        
//    
//    }
    
    _text = _label.text;
}
@end
