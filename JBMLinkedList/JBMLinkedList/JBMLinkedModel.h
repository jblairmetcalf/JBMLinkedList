//
//  JBMLinkedModel.h
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface JBMLinkedModel : NSObject

@property (nonatomic, strong) NSString *object;
@property (nonatomic, strong) JBMLinkedModel *next;

- (instancetype)initWithObject:(NSString *)object;
- (instancetype)initWithNext:(JBMLinkedModel *)next;
- (instancetype)initWithObject:(NSString *)value next:(JBMLinkedModel *)next;

@end
