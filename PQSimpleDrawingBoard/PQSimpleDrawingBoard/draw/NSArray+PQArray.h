//
//  NSArray+PQArray.h
//  PQSimpleDrawingBoard
//
//  Created by codepgq on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import <Foundation/Foundation.h>


@interface NSArray (PQArray)

@end



@interface NSMutableArray (PQArray)

- (void)removeObjectFromLastObjectAtIndex:(NSUInteger)index;

- (NSMutableArray *)objectFromLastCount:(NSUInteger)count;
@end
