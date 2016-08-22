//
//  NSArray+PQArray.m
//  PQSimpleDrawingBoard
//
//  Created by codepgq on 16/8/22.
//  Copyright © 2016年 PQ. All rights reserved.
//

#import "NSArray+PQArray.h"

@implementation NSArray (PQArray)

@end


@implementation NSMutableArray (PQArray)

- (void)removeObjectFromLastObjectAtIndex:(NSUInteger)index{
    NSInteger count = index;
    for (NSInteger i = self.count -1; count; i--,count--) {
        [self removeObjectAtIndex:i];
        if (count<0) {
            return;
        }
    }
}

- (NSMutableArray *)objectFromLastCount:(NSUInteger)count{
    NSMutableArray * mArray = [NSMutableArray array];
    NSInteger index = count;
    for (NSInteger i = self.count -1; ; i--,index--) {
        [mArray addObject:self[i]];
        if (index<0) {
            break;
        }
    }
    
    return mArray;
}

@end
