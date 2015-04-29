//
//  JBMLinkedItem.h
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBMLinkedItem : NSObject

@property (nonatomic, strong) id object;
@property (nonatomic, strong) JBMLinkedItem *next;

- (instancetype)initWithObject:(id)object;
- (instancetype)initWithNext:(JBMLinkedItem *)next;
- (instancetype)initWithObject:(id)object next:(JBMLinkedItem *)next;

@end
