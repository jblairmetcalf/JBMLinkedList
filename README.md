LinkedList
==========

How to create a linked list in Objective-C.
----------

JBMLinkedList public methods/properties:
- (instancetype)initWithArray:(NSArray *)array;
- (instancetype)initWithHead:(JBMLinkedItem *)item;
- (NSInteger)count;
- (NSString *)description;
- (id)objectAtIndex:(NSInteger)index;
- (void)removeObjectAtIndex:(NSInteger)index;
- (void)addObject:(id)object atIndex:(NSInteger)index;
- (void)reverse;
- (void)pop;
- (void)shift;
