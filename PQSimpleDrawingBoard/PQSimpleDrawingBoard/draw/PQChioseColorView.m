//
//  PQChioseColorView.m
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQChioseColorView.h"
#import "UIView+pgqViewExtension.h"
@implementation PQChioseColorView
//添加颜色选择器
- (void)awakeFromNib{
    [self setUp];
}

- (instancetype)init
{
    self = [super init];
    if (self) {
        [self setUp];
    }
    return self;
}

- (void)setUp{
    NSArray * colors = @[[UIColor blackColor],[UIColor blueColor],[UIColor brownColor],[UIColor cyanColor],[UIColor magentaColor],[UIColor orangeColor],[UIColor redColor],[UIColor purpleColor],[UIColor yellowColor],[UIColor whiteColor],[UIColor grayColor]];
    //间距
    CGFloat padding = 5;
    
    for (NSInteger i = 0; i < colors.count; i++) {
        UIButton * button = [UIButton buttonWithType:UIButtonTypeCustom];
        button.frame = CGRectMake(i * (self.height + padding) + padding, self.height * 0.1, self.height * 0.8, self.height * 0.8);
        button.backgroundColor = colors[i];
        [button addTarget:self action:@selector(colorClick:) forControlEvents:UIControlEventTouchUpInside];
        button.layer.cornerRadius = self.height * 0.4;
        button.clipsToBounds = YES;
        [self addSubview:button];
    }
    //设置滚动范围
    self.contentSize = CGSizeMake((self.height + padding) * colors.count + padding, 0);
}

- (void)colorClick:(UIButton *)button{
    self.color(button.backgroundColor);
}

- (void)chioseColor:(PQChioseColor)color{
    self.color = color;
}

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
