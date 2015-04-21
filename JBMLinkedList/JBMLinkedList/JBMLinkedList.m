//
//  JBMLinkedList.m
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMLinkedList.h"

@interface JBMLinkedList ()

@end

@implementation JBMLinkedList

#pragma mark - Override Methods

- (instancetype)init {
    self = [super init];
    if (self) {
        self.head = [[JBMLinkedModel alloc] initWithObject:nil];
    }
    return self;
}

- (NSString *)description {
    return [[NSString alloc] initWithFormat:@"%@", [self itemAsArray:self.head]];// !!! write differently
}

#pragma mark - Public Methods

- (instancetype)initWithArray:(NSArray *)array {
    self = [super init];
    if (self) {
        self.head = [[JBMLinkedModel alloc] initWithNext:[self addWithArray:[NSMutableArray arrayWithArray:array]]];
    }
    return self;
}

- (JBMLinkedList *)initWithHead:(JBMLinkedModel *)head {
    self = [super init];
    if (self) {
        if (head.next) {
            self.head = [[JBMLinkedModel alloc] initWithNext:[self addWithModel:head.next]];
        }
    }
    return self;
}

- (NSInteger)count {
    return [self countWithItem:self.head withIndex:0];
}

- (NSArray *)itemAsArray:(JBMLinkedModel *)model {
    return [self asArray:[NSMutableArray new] withModel:model];
}

- (void)removeObjectAtIndex:(NSInteger)index {
    [self recursiveRemoveObjectAtIndex:index currentModel:self.head currentIndex:0];
}

- (void)addObject:(NSString *)value atIndex:(NSInteger)index {
    [self addObject:value atIndex:index withModel:self.head modelIndex:0];
}

- (void)reverse {
    JBMLinkedList *new = [JBMLinkedList new];
    for (int i = 0; i < [self count]; i++) {
        NSString *value = [self objectAtIndex:[self count] - i - 1];
        [new addObject:value atIndex:i];
    }
    self.head = new.head;
}

- (void)pop {
    NSInteger index = self.count-1;
    if (index >= -1) {
        [self removeObjectAtIndex:index];
    }
}

- (void)shift {
    [self removeObjectAtIndex:0];
}

#pragma mark - Private Methods

- (JBMLinkedModel *)addWithArray:(NSMutableArray *)array {
    NSString *value = [array firstObject];
    if ([array count] > 1) {
        [array removeObjectAtIndex:0];
        JBMLinkedModel *next = [self addWithArray:array];
        return [[JBMLinkedModel alloc] initWithObject:value next:next];
    } else {
        return [[JBMLinkedModel alloc] initWithObject:value];
    }
}

- (NSArray *)asArray:(NSMutableArray *)array withModel:(JBMLinkedModel *)model {
    if (model.object) {
        [array addObject:model.object];
    }
    if (model.next) {
        return [self asArray:array withModel:model.next];
    } else {
        return [NSArray arrayWithArray:array];
    }
}

- (JBMLinkedModel *)addWithModel:(JBMLinkedModel *)model {
    if (model.next) {
        return [[JBMLinkedModel alloc] initWithObject:model.object next:[self addWithModel:model.next]];
    } else {
        return [[JBMLinkedModel alloc] initWithObject:model.object];
    }
}

- (void)recursiveRemoveObjectAtIndex:(NSInteger)removeIndex currentModel:(JBMLinkedModel *)currentModel currentIndex:(NSInteger)currentIndex {
    if (currentIndex < removeIndex) {
        [self recursiveRemoveObjectAtIndex:removeIndex currentModel:currentModel.next currentIndex:currentIndex+1];
    } else {
        if (currentModel.next.next) {
            currentModel.next = currentModel.next.next;
        } else {
            currentModel.next = nil;
        }
    }
}

- (void)addObject:(NSString *)object atIndex:(NSInteger)index withModel:(JBMLinkedModel *)model modelIndex:(NSInteger)modelIndex {
    if (modelIndex < index) {
        [self addObject:object atIndex:index withModel:model.next modelIndex:modelIndex+1];
    } else {
        JBMLinkedModel *new = [[JBMLinkedModel alloc] initWithObject:object next:model.next];
        new.next = model.next;
        model.next = new;
    }
}

- (NSInteger)countWithItem:(JBMLinkedModel *)item withIndex:(NSInteger)index {
    if (item.next) {
        return [self countWithItem:item.next withIndex:index+1];
    } else {
        return index;
    }
}

- (NSString *)objectAtIndex:(NSInteger)index {
    return [self objectAtIndex:index withItem:self.head withIndex:0];
}

- (NSString *)objectAtIndex:(NSInteger)index withItem:(JBMLinkedModel *)item withIndex:(NSInteger)currentIndex {
    if (index == currentIndex - 1) {
        return item.object;
    } else {
        if (item.next) {
            return [self objectAtIndex:index withItem:item.next withIndex:currentIndex+1];
        } else {
            return nil;
        }
    }
}

@end
