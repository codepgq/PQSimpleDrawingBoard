//
//  PQToolView.m
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQToolView.h"

@interface PQToolView ()

@property (nonatomic,weak) IBOutlet UILabel * numLabel;


@property (nonatomic,copy) void(^penBlock)(CGFloat value);
@property (nonatomic,copy) void(^eraserBlock)();
@end

@implementation PQToolView

- (void)awakeFromNib{
    self.numLabel.textAlignment = NSTextAlignmentCenter;
}

- (IBAction)sliderValueChange:(UISlider *)sender{
    self.numLabel.text = [NSString stringWithFormat:@"%.0f",sender.value];
    self.penBlock(sender.value);
}

- (IBAction)eraser:(UIButton *)sender{
    self.eraserBlock();
}

- (void)toolViewWithPen:(void(^)(CGFloat))penBlock eraser:(void(^)())eraserBlock{
    self.penBlock = [penBlock copy];
    self.eraserBlock = [eraserBlock copy];
}


/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end
