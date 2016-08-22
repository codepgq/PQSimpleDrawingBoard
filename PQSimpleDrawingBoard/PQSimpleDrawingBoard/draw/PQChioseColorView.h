//
//  PQChioseColorView.h
//  PQSimpleDrawingBoard
//
//  Created by ios on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef void(^PQChioseColor)(UIColor * color);

@interface PQChioseColorView : UIScrollView

@property (nonatomic,copy) PQChioseColor color;

- (void)chioseColor:(PQChioseColor)color;

@end
