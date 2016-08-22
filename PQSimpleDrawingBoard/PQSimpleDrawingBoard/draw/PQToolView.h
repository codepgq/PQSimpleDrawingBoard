//
//  PQToolView.h
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQToolView : UIView

- (void)toolViewWithPen:(void(^)(CGFloat))penBlock eraser:(void(^)())eraserBlock;

@end
