//
//  JBMLinkedList.h
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <Foundation/Foundation.h>

#import "JBMLinkedItem.h"

@interface JBMLinkedList : NSObject

@property (nonatomic, strong) JBMLinkedItem *head;
@property (nonatomic) NSInteger count;

- (instancetype)initWithArray:(NSArray *)array;
- (instancetype)initWithHead:(JBMLinkedItem *)item;

- (id)objectAtIndex:(NSInteger)index;

- (void)removeObjectAtIndex:(NSInteger)index;
- (void)addObject:(id)object atIndex:(NSInteger)index;
- (void)reverse;
- (void)pop;
- (void)shift;

@end
