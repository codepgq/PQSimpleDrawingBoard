//
//  PQToolBarTop.h
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef NS_ENUM(NSInteger,ToolBarType){
    ToolBarTypePen = 0,
    ToolBarTypeRect,
    ToolBarTypeCircle,
    ToolBarTypesquare,
    ToolBarTypeFiveStar,
    ToolBarTypeImportImage,
};

@interface PQToolBarTop : UIToolbar
/**
 *  画笔
 *
 *  @param block <#block description#>
 */
- (void)toolBarWithPen:(void(^)(ToolBarType type))block;
/**
 *  矩形
 *
 *  @param block <#block description#>
 */
- (void)toolBarWithRect:(void(^)(ToolBarType type,UIView * view))block;
/**
 *  圆形
 *
 *  @param block <#block description#>
 */
- (void)toolBarWithCircle:(void(^)(ToolBarType type,UIView * view))block;
/**
 *  三角形
 *
 *  @param block <#block description#>
 */
- (void)toolBarWithSquare:(void(^)(ToolBarType type,UIView * view))block;
/**
 *  五角星型
 *
 *  @param block <#block description#>
 */
- (void)toolBarWithFiveStar:(void(^)(ToolBarType type,UIView * view))block;
/**
 *  图片
 *
 *  @param block <#block description#>
 */
- (void)toolBarWithImportImage:(void(^)(ToolBarType type,UIView * view))block;
/**
 *  更新线宽
 *
 *  @param lineW <#lineW description#>
 */
- (void)updateLineW:(CGFloat)lineW;
/**
 *  更新线颜色
 *
 *  @param lineColor <#lineColor description#>
 */
- (void)updateLineColor:(UIColor *)lineColor;

@end
