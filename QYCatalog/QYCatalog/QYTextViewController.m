//
//  QYTextViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-25.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYTextViewController.h"

@interface QYTextViewController ()
@property (nonatomic, strong) UITextView *textView;
@end

@implementation QYTextViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"TextView";
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    _textView = [[UITextView alloc] initWithFrame:self.view.frame];
    self.textView.font = [UIFont systemFontOfSize:20];
    self.textView.font = [UIFont fontWithName:@"Arial" size:20];
    self.textView.text = @"Now is the time for all good developers to come serve their country.\nNow is the time for all good developers to come to their country.\nThis text view can also use attributed strings.";
    self.textView.backgroundColor = [UIColor lightGrayColor];
    self.textView.backgroundColor = [UIColor whiteColor];
    self.textView.autoresizingMask = UIViewAutoresizingFlexibleHeight | UIViewAutoresizingFlexibleWidth;
    //属性
    NSMutableAttributedString *attribuString = [[NSMutableAttributedString alloc] initWithString:self.textView.text];
    [attribuString addAttribute:NSForegroundColorAttributeName value:[UIColor blueColor] range:NSMakeRange(self.textView.text.length - 19, 10)];
    [attribuString addAttribute:NSUnderlineStyleAttributeName value:[NSNumber numberWithInt:4] range:NSMakeRange(self.textView.text.length - 19, 10)];
    [attribuString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:25.0f] range:NSMakeRange(self.textView.text.length - 19, 10)];
    [attribuString addAttribute:NSFontAttributeName value:[UIFont systemFontOfSize:20.0f] range:NSMakeRange(0, self.textView.text.length)];
    [self.textView setAttributedText:attribuString];
    self.textView.returnKeyType = UIReturnKeyDone;
    self.textView.keyboardAppearance = UIKeyboardAppearanceLight;
    self.textView.keyboardType = UIKeyboardTypeDefault;
    [self.view addSubview:_textView];
    //加了一个手势来使键盘消失
    UITapGestureRecognizer *tapGesture = [[UITapGestureRecognizer alloc] initWithTarget:self action:@selector(hideKeyBoard)];
    tapGesture.numberOfTapsRequired = 2;
    [self.textView addGestureRecognizer:tapGesture];
}
- (void)hideKeyBoard
{
    [_textView resignFirstResponder];

}
//在通知中心注册我们关心的通知。在这里指的是键盘的弹出和消失
//在界面消失，需要销毁注册的通知
//当通知来的时候处理程序的逻辑错误
- (void)viewWillAppear:(BOOL)animated
{
    //通知
    //注册
    [super viewWillAppear:animated];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillShow:) name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillHide:) name:UIKeyboardWillHideNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardWillChange:) name:UIKeyboardWillChangeFrameNotification object:nil];
//    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(keyboardDidChange:) name:UIKeyboardDidChangeFrameNotification object:nil];

}
- (void)viewDidDisappear:(BOOL)animated
{
    //取消通知
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillShowNotification object:nil];
    [[NSNotificationCenter defaultCenter] removeObserver:self name:UIKeyboardWillHideNotification object:nil];
    

}
- (void)adjustViewForKeyboardReveal:(BOOL)showKeyboard notification:(NSDictionary*)notificationInfo
{
    NSDictionary *useInfo = notificationInfo;
   // NSDictionary *useInfo = notification.userInfo;
    CGRect keyboardRect = [[useInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue];
    NSTimeInterval animationDuration = [[useInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue];
    CGRect frame = self.textView.frame;
    if (showKeyboard) {
      
        frame.size.height -= CGRectGetHeight(keyboardRect);
        [UIView setAnimationDuration:animationDuration + 4.5];
    } else{
    
        frame.size.height += CGRectGetHeight(keyboardRect);
        [UIView setAnimationDuration:animationDuration - 0.5];
    }
    [UIView beginAnimations:@"resizeForKeyboard" context:nil];
  //  [UIView setAnimationDuration:animationDuration + 0.5];
    self.textView.frame = frame;
    [UIView commitAnimations];
}


- (void)keyboardWillShow:(NSNotification *)notification
{

    NSLog(@"%s :%@",__func__,notification);
    [self adjustViewForKeyboardReveal:YES notification:notification.userInfo];

}


- (void)keyboardWillHide:(NSNotification *)notification
{

     NSLog(@"%s :%@",__func__,notification);
    [self adjustViewForKeyboardReveal:NO notification:notification.userInfo];

}
- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
