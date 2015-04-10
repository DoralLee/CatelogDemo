//
//  QYWebViewController.m
//  QYCatalog
//
//  Created by qingyun on 14-8-25.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYWebViewController.h"

@interface QYWebViewController ()
@property (nonatomic, strong) UIActivityIndicatorView *activity;
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

- (void)viewDidLoad
{
    [super viewDidLoad];
    UIWebView *webView = [[UIWebView alloc] initWithFrame:CGRectMake(10, 44, 300, 50)];
    [self.view addSubview:webView];
    webView.delegate = self;
    NSURL *url = [[NSURL alloc] initWithString:@"http://www.apple.com"];
    NSURLRequest *request = [[NSURLRequest alloc] initWithURL:url];
    [webView loadRequest:request];
    [webView reload];
}

- (BOOL)webView:(UIWebView *)webView shouldStartLoadWithRequest:(NSURLRequest *)request navigationType:(UIWebViewNavigationType)navigationType
{

    return YES;

}
- (void)webViewDidStartLoad:(UIWebView *)webView
{
    self.activity = [[UIActivityIndicatorView alloc] init];
    _activity.activityIndicatorViewStyle = UIActivityIndicatorViewStyleGray;
    [self.view addSubview:_activity];
    [_activity startAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:YES];
    

}
- (void)webViewDidFinishLoad:(UIWebView *)webView
{
    [_activity stopAnimating];
    [[UIApplication sharedApplication] setNetworkActivityIndicatorVisible:NO];
    NSLog(@"%s",__func__);
}
- (void)webView:(UIWebView *)webView didFailLoadWithError:(NSError *)error;
{

    NSLog(@"%s",__func__);
}


@end
