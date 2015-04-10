//
//  QYCustomView.m
//  QYCatalog
//
//  Created by qingyun on 14-8-29.
//  Copyright (c) 2014年 FULLUSERNAME. All rights reserved.
//

#import "QYCustomView.h"

@interface QYCustomView ()
@property (nonatomic, strong) UIImageView *imageView;
@property (nonatomic, strong) UILabel *label;
@end



@implementation QYCustomView

- (id)initWithFrame:(CGRect)frame
{
    self = [super initWithFrame:frame];
    if (self) {
        // Initialization code
    }
    return self;
}

- (id)initWithTitle:(NSString *)title image:(UIImage *)image
{

    self = [super initWithFrame:CGRectMake(0, 0, 200, 40)];
    if (self) {
        _imageView = [[UIImageView alloc] initWithFrame:CGRectMake(0, 5, 40, 30)];
        _imageView.image = image;
        [self addSubview:_imageView];
        _label = [[UILabel alloc] initWithFrame:CGRectMake(CGRectGetMaxX(self.imageView.frame) + 30, 5, 160, 30)];
        _label.text = title;
        [self addSubview:_label];
    }
    return self;
}
@end
