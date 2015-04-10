//
//  QYCustomController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-29.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYCustomController.h"
#import "QYCustomView.h"

@interface QYCustomController ()
@property (nonatomic, strong) NSMutableArray *dataSource;
@end

@implementation QYCustomController

- (id)init
{
    self = [super init];
    if (self) {
        _dataSource = [[NSMutableArray alloc] init];
        QYCustomView *earlyMorningView = [[QYCustomView alloc] initWithTitle:@"Early Morning" image:[UIImage imageNamed:@"12-6AM"]];
        [self.dataSource addObject:earlyMorningView];
        QYCustomView *lateMorningView = [[QYCustomView alloc] initWithTitle:@"Late Morning" image:[UIImage imageNamed:@"6-12AM"]];
        [self.dataSource addObject:lateMorningView];
        QYCustomView *afternoonView = [[QYCustomView alloc] initWithTitle:@"Afternoon" image:[UIImage imageNamed:@"12-6PM"]];
        [self.dataSource addObject:afternoonView];
        QYCustomView *eveningView = [[QYCustomView alloc] initWithTitle:@"Evening" image:[UIImage imageNamed:@"6-12PM"]];
        [self.dataSource addObject:eveningView];
        
    }
    return self;
}
- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{
    return 1;
}

- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    return self.dataSource.count;
}
- (UIView *)pickerView:(UIPickerView *)pickerView viewForRow:(NSInteger)row forComponent:(NSInteger)component reusingView:(UIView *)view
{

    return self.dataSource[row];

}
@end
