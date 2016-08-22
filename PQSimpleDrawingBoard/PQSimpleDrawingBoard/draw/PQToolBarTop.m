//
//  PQToolBarTop.m
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQToolBarTop.h"

@interface PQToolBarTop ()

@property (nonatomic,copy) void(^penBlock)(ToolBarType type);
@property (nonatomic,copy) void(^rectBlock)(ToolBarType type, UIView * view);
@property (nonatomic,copy) void(^circleBlock)(ToolBarType type, UIView * view);
@property (nonatomic,copy) void(^squareBlock)(ToolBarType type, UIView * view);
@property (nonatomic,copy) void(^fiveStarBlock)(ToolBarType type, UIView * view);
@property (nonatomic,copy) void(^imageBlock)(ToolBarType type, UIView * view);

@property (nonatomic,assign) CGFloat lineW;
@property (nonatomic) UIColor * lineColor;
@end

@implementation PQToolBarTop


- (void)awakeFromNib{
    self.lineW = 1;
    self.lineColor = [UIColor blackColor];
}

//画笔
- (IBAction)penClick:(UIBarButtonItem *)sender{
    self.penBlock(ToolBarTypePen);
}

//矩形
- (IBAction)rect:(UIBarButtonItem *)sender{
    
}

//圆形
- (IBAction)circle:(UIBarButtonItem *)sender{
    
}

//三角型
- (IBAction)square:(UIBarButtonItem *)sender{
    
}

//五角星
- (IBAction)fiveStar:(UIBarButtonItem *)sender{
    
}

//导入图片
- (IBAction)importImage:(UIBarButtonItem *)sender{
    
}


/**
 *  画笔
 *
 *  @param block
 */
- (void)toolBarWithPen:(void(^)(ToolBarType type))block{
    self.penBlock = [block copy];
}
/**
 *  矩形
 *
 *  @param block
 */
- (void)toolBarWithRect:(void(^)(ToolBarType type,UIView * view))block{
    self.rectBlock = [block copy];
}
/**
 *  圆形
 *
 *  @param block
 */
- (void)toolBarWithCircle:(void(^)(ToolBarType type,UIView * view))block{
    self.circleBlock = [block copy];
}
/**
 *  三角形
 *
 *  @param block
 */
- (void)toolBarWithSquare:(void(^)(ToolBarType type,UIView * view))block{
    self.squareBlock = [block copy];
}
/**
 *  五角星型
 *
 *  @param block
 */
- (void)toolBarWithFiveStar:(void(^)(ToolBarType type,UIView * view))block{
    self.fiveStarBlock = [block copy];
}
/**
 *  图片
 *
 *  @param block
 */
- (void)toolBarWithImportImage:(void(^)(ToolBarType type,UIView * view))block{
    self.imageBlock = [block copy];
}

- (void)updateLineW:(CGFloat)lineW{
    self.lineW = lineW;
}

- (void)updateLineColor:(UIColor *)lineColor{
    self.lineColor = lineColor;
}
@end
