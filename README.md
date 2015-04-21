LinkedList
==========

How to create a linked list in Objective-C.
----------

JBMLinkedList public methods/properties:
- (instancetype)initWithArray:(NSArray *)array;
- (instancetype)initWithHead:(JBMLinkedModel *)item;
- (NSInteger)count;
- (NSString *)description;
- (NSString *)objectAtIndex:(NSInteger)index;
- (void)removeObjectAtIndex:(NSInteger)index;
- (void)addObject:(NSString *)value atIndex:(NSInteger)index;
- (void)reverse;
- (void)pop;
- (void)shift;
