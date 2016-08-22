//
//  PQDrawingBoardView.m
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQDrawingBoardView.h"
#import "PQChioseColorView.h"
#import "PQToolView.h"
#import "PQToolBarTop.h"
#import "PQToolBarBottom.h"
#import "NSArray+PQArray.h"
@interface PQDrawingBoardView ()
/**
 *  颜色选择器
 */
@property (nonatomic,weak) IBOutlet PQChioseColorView *chioseColor;
/**
 *  工具栏
 */
@property (nonatomic,weak) IBOutlet PQToolView *toolView;
/**
 *  工具栏
 */
@property (nonatomic,weak) IBOutlet PQToolBarTop *toolBarTop;

/**
 *  工具栏
 */
@property (nonatomic,weak) IBOutlet PQToolBarBottom *toolBarBottom;
/**
 *  当前的颜色
 */
@property (nonatomic,strong) UIColor *nColor;

/**
 *  路径
 */
@property (nonatomic,strong) UIBezierPath * path;
/**
 *  线宽
 */
@property (nonatomic,assign) CGFloat lineW;
/**
 *  路径数组
 */
@property (nonatomic,strong) NSMutableArray * pathsArray;
/**
 *  颜色数组
 */
@property (nonatomic,strong) NSMutableArray * colorsArray;
/**
 *  路径恢复数组
 */
@property (nonatomic,strong) NSMutableArray *redoPathsArray;
/**
 *  颜色恢复数组
 */
@property (nonatomic,strong) NSMutableArray *redoColorsArray;
@end

@implementation PQDrawingBoardView{
    CGPoint _startP;
    NSInteger _redoCount;
}

- (IBAction)panGestureEvent:(UIPanGestureRecognizer *)pan{
    switch (pan.state) {
        case UIGestureRecognizerStateBegan:
            //开始位置
            _startP = [pan locationInView:self];
            self.path = [UIBezierPath bezierPath];
            [self.path moveToPoint:_startP];
            //添加路径
            [self.pathsArray addObject:self.path];
            //添加颜色
            [self.colorsArray addObject:self.nColor];
            
            
            //删除多余缓存
            [self.redoPathsArray removeObjectFromLastObjectAtIndex:_redoCount];
            [self.redoColorsArray removeObjectFromLastObjectAtIndex:_redoCount];
            _redoCount = 0;
            break;
        case UIGestureRecognizerStateChanged:
            //移动时位置
            [self.path addLineToPoint:[pan locationInView:self]];
            self.path.lineWidth = self.lineW;
            [self setNeedsDisplay];
            
            break;
        case UIGestureRecognizerStateEnded:
            //结束位置
            
            [self setNeedsDisplay];
            break;
        default:
            break;
    }
}


#pragma mark - lasy method
- (UIColor *)nColor{
    if (!_nColor) {
        _nColor = [UIColor blackColor];
    }
    return _nColor;
}

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
    
    //*******************  颜色  ******************
    [self color];
    
    //*******************  橡皮擦和画笔大小  ******************
    [self lineAndEraser];
    
    //*******************  画笔选择  ******************
    [self chiosePenType];
    
    //*******************  工具栏  ******************
    [self toolBar];
    
    //初始化路径地址
    self.pathsArray = [NSMutableArray array];
    self.redoPathsArray = [NSMutableArray array];
    
    //初始化颜色
    self.colorsArray = [NSMutableArray array];
    self.redoColorsArray = [NSMutableArray array];
    
    //初始化线宽 颜色
    self.lineW = 1;
    self.nColor = [UIColor blackColor];
}

- (void)color{
    //1、设置默认颜色为黑色 使用懒方法
    //监听颜色回调
    [self.chioseColor chioseColor:^(UIColor *color) {
        //2、需要保存好当前颜色
        self.nColor = color;
    }];
}

- (void)lineAndEraser{
    [self.toolView toolViewWithPen:^(CGFloat value) {
        self.lineW = value;
    } eraser:^{
        self.nColor = self.backgroundColor;
    }];
}

- (void)chiosePenType{
    //画笔
    [self.toolBarTop toolBarWithPen:^(ToolBarType type) {
        
    }];
    //矩形
    [self.toolBarTop toolBarWithRect:^(ToolBarType type, UIView *view) {
        
    }];
    //圆形
    [self.toolBarTop toolBarWithCircle:^(ToolBarType type, UIView *view) {
        
    }];
    //三角形
    [self.toolBarTop toolBarWithSquare:^(ToolBarType type, UIView *view) {
        
    }];
    //五角星
    [self.toolBarTop toolBarWithFiveStar:^(ToolBarType type, UIView *view) {
        
    }];
    //导入图片
    [self.toolBarTop toolBarWithImportImage:^(ToolBarType type, UIView *view) {
        
    }];
}

- (void)toolBar{
    //保存
    self.toolBarBottom.ToolbarSave = ^(){
        
    };
    //放弃
    self.toolBarBottom.ToolbarGiveUp = ^(){
        
    };
    //撤销
    [self.toolBarBottom toolBarUndo:^{
        
        if (self.colorsArray.count && self.pathsArray.count) {
            //把最后一项的颜色先存入到恢复数组中，在删除
            [self.redoColorsArray addObject:[self.colorsArray lastObject]];
            [self.colorsArray removeLastObject];
            
            //把最后一项的颜色先存入到恢复数组中，在删除
            [self.redoPathsArray addObject:[self.pathsArray lastObject]];
            [self.pathsArray removeLastObject];
            
            _redoCount++;
            
            //重绘
            [self setNeedsDisplay];
        }
        else{
            NSLog(@"你都还没开始画");
        }
        
        
       
    }];
    
    //恢复
    [self.toolBarBottom toolBarRedo:^{
        
        if (self.redoColorsArray.count && self.redoPathsArray.count) {
            
            [self.pathsArray addObject:[self.redoPathsArray lastObject]];
            [self.redoPathsArray removeLastObject];
            
            [self.colorsArray addObject:[self.redoColorsArray lastObject]];
            [self.redoColorsArray removeLastObject];
            _redoCount--;
            //重绘
            [self setNeedsDisplay];
        }
        else{
            NSLog(@"啥都没有，没得恢复！！！！");
            [self.redoPathsArray removeAllObjects];
            [self.redoColorsArray removeAllObjects];
        }
    }];
    
    //清除
    [self.toolBarBottom toolBarClear:^{
        
        [self.redoColorsArray removeAllObjects];
        [self.redoPathsArray removeAllObjects];
        [self.pathsArray removeAllObjects];
        [self.colorsArray removeAllObjects];
        
        //重绘
        [self setNeedsDisplay];
    }];
}


- (void)drawRect:(CGRect)rect {
//    for (UIBezierPath * path in self.pathsArray) {
//        [self.nColor set];
//        [path stroke];
//    }
    
    for (NSInteger i = 0; i<self.pathsArray.count; i++) {
        UIBezierPath * path = self.pathsArray[i];
        [(UIColor *)self.colorsArray[i] set];
        [path stroke];
    }
}


@end
