//
//  JBMLinkedList.h
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JBMLinkedModel.h"

@interface JBMLinkedList : NSObject

@property (nonatomic, strong) JBMLinkedModel *head;
@property (nonatomic) NSInteger count;

- (instancetype)initWithArray:(NSArray *)array;
- (instancetype)initWithHead:(JBMLinkedModel *)item;

- (NSString *)objectAtIndex:(NSInteger)index;

- (void)removeObjectAtIndex:(NSInteger)index;
- (void)addObject:(NSString *)value atIndex:(NSInteger)index;
- (void)reverse;
- (void)pop;
- (void)shift;

@end
