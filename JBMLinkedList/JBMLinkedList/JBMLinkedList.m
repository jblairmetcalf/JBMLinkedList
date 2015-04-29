//
//  JBMLinkedList.m
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMLinkedList.h"

@implementation JBMLinkedList

#pragma mark - Override Methods

- (instancetype)init {
    self = [super init];
    if (self) {
        self.head = [[JBMLinkedItem alloc] initWithObject:nil];
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
        self.head = [[JBMLinkedItem alloc] initWithNext:[self addWithArray:[NSMutableArray arrayWithArray:array]]];
    }
    return self;
}

- (JBMLinkedList *)initWithHead:(JBMLinkedItem *)head {
    self = [super init];
    if (self) {
        if (head.next) {
            self.head = [[JBMLinkedItem alloc] initWithNext:[self addWithItem:head.next]];
        }
    }
    return self;
}

- (NSInteger)count {
    return [self countWithItem:self.head withIndex:0];
}

- (NSArray *)itemAsArray:(JBMLinkedItem *)item {
    return [self asArray:[NSMutableArray new] withItem:item];
}

- (void)removeObjectAtIndex:(NSInteger)index {
    [self recursiveRemoveObjectAtIndex:index currentItem:self.head currentIndex:0];
}

- (void)addObject:(NSString *)value atIndex:(NSInteger)index {
    [self addObject:value atIndex:index withItem:self.head itemIndex:0];
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

- (JBMLinkedItem *)addWithArray:(NSMutableArray *)array {
    NSString *value = [array firstObject];
    if ([array count] > 1) {
        [array removeObjectAtIndex:0];
        JBMLinkedItem *next = [self addWithArray:array];
        return [[JBMLinkedItem alloc] initWithObject:value next:next];
    } else {
        return [[JBMLinkedItem alloc] initWithObject:value];
    }
}

- (NSArray *)asArray:(NSMutableArray *)array withItem:(JBMLinkedItem *)item {
    if (item.object) {
        [array addObject:item.object];
    }
    if (item.next) {
        return [self asArray:array withItem:item.next];
    } else {
        return [NSArray arrayWithArray:array];
    }
}

- (JBMLinkedItem *)addWithItem:(JBMLinkedItem *)item {
    if (item.next) {
        return [[JBMLinkedItem alloc] initWithObject:item.object next:[self addWithItem:item.next]];
    } else {
        return [[JBMLinkedItem alloc] initWithObject:item.object];
    }
}

- (void)recursiveRemoveObjectAtIndex:(NSInteger)removeIndex currentItem:(JBMLinkedItem *)currentItem currentIndex:(NSInteger)currentIndex {
    if (currentIndex < removeIndex) {
        [self recursiveRemoveObjectAtIndex:removeIndex currentItem:currentItem.next currentIndex:currentIndex+1];
    } else {
        if (currentItem.next.next) {
            currentItem.next = currentItem.next.next;
        } else {
            currentItem.next = nil;
        }
    }
}

- (void)addObject:(NSString *)object atIndex:(NSInteger)index withItem:(JBMLinkedItem *)item itemIndex:(NSInteger)itemIndex {
    if (itemIndex < index) {
        [self addObject:object atIndex:index withItem:item.next itemIndex:itemIndex+1];
    } else {
        JBMLinkedItem *new = [[JBMLinkedItem alloc] initWithObject:object next:item.next];
        new.next = item.next;
        item.next = new;
    }
}

- (NSInteger)countWithItem:(JBMLinkedItem *)item withIndex:(NSInteger)index {
    if (item.next) {
        return [self countWithItem:item.next withIndex:index+1];
    } else {
        return index;
    }
}

- (NSString *)objectAtIndex:(NSInteger)index {
    return [self objectAtIndex:index withItem:self.head withIndex:0];
}

- (NSString *)objectAtIndex:(NSInteger)index withItem:(JBMLinkedItem *)item withIndex:(NSInteger)currentIndex {
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
