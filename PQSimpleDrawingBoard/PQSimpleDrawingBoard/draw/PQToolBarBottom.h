//
//  PQToolBarBottom.h
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface PQToolBarBottom : UIToolbar
@property (nonatomic,copy) void(^ToolbarSave)();
@property (nonatomic,copy) void(^ToolbarGiveUp)();

- (void)toolBarUndo:(void(^)())block;
- (void)toolBarRedo:(void(^)())block;
- (void)toolBarClear:(void(^)())block;


@end
