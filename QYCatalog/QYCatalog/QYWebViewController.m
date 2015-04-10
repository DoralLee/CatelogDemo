//
//  QYWebViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-25.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYWebViewController.h"

@interface QYWebViewController ()
@property (nonatomic, strong) UIWebView *webView;
@end

@implementation QYWebViewController

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        self.title = @"Web";
    }
    return self;
    
}

- (void)loadRequestWithURL:(NSURL *)url
{
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [_webView loadRequest:request];
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    UITextField *textField = [[UITextField alloc] initWithFrame:CGRectMake(10, 64, 300, 40)];
    textField.borderStyle = UITextBorderStyleBezel;
    [self.view addSubview:textField];
    textField.delegate = self;
    _webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 104, 320, 454)];
    [self.view addSubview:_webView];
    _webView.backgroundColor = [UIColor whiteColor];
    _webView.delegate = self;
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.baidu.com"];
    [self loadRequestWithURL:url];
    _webView.scalesPageToFit = YES;
  //  [webView reload];
}
- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
    NSURL *url = [[NSURL alloc] initWithString:textField.text];
    [self loadRequestWithURL:url];
    [textField resignFirstResponder];
    return YES;
}
- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{

    return YES;

}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
//    self.activity = [[UIActivityIndicatorView alloc] init];
//    _activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
//    [self.view addSubview:_activity];
//    [_activity startAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
   
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSLog(@"%s",__func__);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSLog(@"%@",error);
}


@end
