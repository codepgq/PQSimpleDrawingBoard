//
//  PQToolBarBottom.m
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "PQToolBarBottom.h"

@interface PQToolBarBottom ()

@property (nonatomic,copy) void(^undoBlock)();
@property (nonatomic,copy) void(^redoBlock)();
@property (nonatomic,copy) void(^clearBlock)();

@end

@implementation PQToolBarBottom

- (IBAction)undo:(id)sender{
    self.undoBlock();
}

- (IBAction)redo:(id)sender{
    self.redoBlock();
}

- (IBAction)clear:(id)sender{
    self.clearBlock();
}

- (IBAction)giveup:(id)sender{
    self.ToolbarGiveUp();
}

- (IBAction)save:(id)sender{
    self.ToolbarSave();
}

- (void)toolBarUndo:(void(^)())block{
    self.undoBlock = [block copy];
}
- (void)toolBarRedo:(void(^)())block{
    self.redoBlock = [block copy];
}
- (void)toolBarClear:(void(^)())block{
    self.clearBlock = [block copy];
}

@end
