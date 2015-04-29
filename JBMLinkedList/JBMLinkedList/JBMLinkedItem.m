//
//  JBMLinkedItem.m
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "JBMLinkedItem.h"

@implementation JBMLinkedItem

#pragma mark - Public Methods

- (instancetype)initWithObject:(id)object {
    self = [super init];
    if (self) {
        self.object = object;
    }
    return self;
}

- (instancetype)initWithNext:(JBMLinkedItem *)next {
    self = [super init];
    if (self) {
        self.next = next;
    }
    return self;
}

- (instancetype)initWithObject:(id)object next:(JBMLinkedItem *)next {
    self = [self initWithObject:object];
    if (self) {
        self.next = next;
    }
    return self;
}

@end
