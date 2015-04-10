//
//  QYToolBarViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-26.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYToolBarViewController.h"

@interface QYToolBarViewController ()
@property (strong, nonatomic) IBOutlet UIToolbar *toolBar;
@property (strong, nonatomic) IBOutlet UIPickerView *pickView;
@property (strong, nonatomic) IBOutlet UISwitch *switch1;
@property (strong, nonatomic) IBOutlet UISwitch *switch2;
@property (strong, nonatomic) IBOutlet UISegmentedControl *segment;
@property (nonatomic, strong) NSArray *data;
@property (nonatomic, strong) UIBarButtonItem *flexible;
@property (nonatomic, strong) UIBarButtonItem *item1;
@property (nonatomic, strong) UIBarButtonItem *item2;
@property (nonatomic, strong) UIBarButtonItem *imageItem;
@end

@implementation QYToolBarViewController

static NSInteger count ;

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
    _toolBar = [[UIToolbar alloc] initWithFrame:CGRectMake(0, 524, 320, 44)];
    
    UIBarButtonItem *systerm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:count target:self action:nil];
    
    _flexible = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemFlexibleSpace target:self action:nil];
    
    _item1 = [[UIBarButtonItem alloc] initWithTitle:@"Item1" style:UIBarButtonItemStyleBordered target:self action:nil];
    UIImage *image = [[UIImage imageNamed:@"whiteButton"] resizableImageWithCapInsets:UIEdgeInsetsMake(10, 10, 10, 10) resizingMode:UIImageResizingModeStretch];
    [_item1 setBackgroundImage:image forState:UIControlStateNormal barMetrics:UIBarMetricsDefault];
    
    _imageItem = [[UIBarButtonItem alloc] initWithImage:[UIImage imageNamed:@"segment_tools"] style:UIBarButtonItemStyleBordered target:self action:nil];
    
    _item2 = [[UIBarButtonItem alloc] initWithTitle:@"Item2" style:UIBarButtonItemStyleBordered target:self action:nil];
   
    self.toolBar.items = @[systerm,_flexible,_item1,_item2,_imageItem];
    [self.view addSubview:_toolBar];
    
    _switch1.on = NO;
    _switch2.on = NO;
    
    self.pickView.delegate = self;
    self.pickView.dataSource = self;
    self.data = @[@"Done", @"Cancel", @"Edit", @"Save", @"Add", @"FlexibleSpace",
                  @"FixedSpace", @"Compose", @"Reply", @"Action", @"Organize",
                  @"Bookmark", @"Search", @"Refresh", @"Stop", @"Camera", @"Trash",
                  @"Play", @"Pause", @"Rewind",@"FastForward", @"Undo", @"Redo", @"PageCurl"];
}
- (IBAction)changeBackgroundImage:(UISwitch *)sender
{

    if (sender.on ){
        
        [self.toolBar setBackgroundImage:[UIImage imageNamed:@"searchBarBackground"] forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
    
    } else {
    
        [self.toolBar setBackgroundImage:nil forToolbarPosition:UIBarPositionBottom barMetrics:UIBarMetricsDefault];
      
    }
    
}
- (IBAction)changeTintColor:(UISwitch *)sender
{

    if (sender.on){
        self.toolBar.tintColor = [UIColor redColor];
        
    } else {
    
        self.toolBar.tintColor = nil;
        
    }
    
}
- (IBAction)segment:(UISegmentedControl *)sender
{

    switch (sender.selectedSegmentIndex) {
        case 0:
            self.toolBar.barStyle = UIBarStyleDefault;
            break;
        case 1:
            self.toolBar.barStyle = UIBarStyleBlack;
            break;
        case 2:
            self.toolBar.barStyle = UIBarStyleBlackTranslucent;
            break;
        default:
            break;
    }

}


- (NSInteger)numberOfComponentsInPickerView:(UIPickerView *)pickerView
{

    return 1;

}
- (NSInteger)pickerView:(UIPickerView *)pickerView numberOfRowsInComponent:(NSInteger)component
{

    return self.data.count;

}
- (NSString *)pickerView:(UIPickerView *)pickerView titleForRow:(NSInteger)row forComponent:(NSInteger)component
{

    return self.data[row];
    

}
- (void)pickerView:(UIPickerView *)pickerView didSelectRow:(NSInteger)row inComponent:(NSInteger)component
{
    count = row;
    UIBarButtonItem *systerm = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:count target:self action:nil];
//    NSLog(@"%@",systerm);
    self.toolBar.items = @[systerm,_flexible,_item1,_item2,_imageItem];
}
@end
