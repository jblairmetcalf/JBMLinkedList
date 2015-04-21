//
//  ViewController.m
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "ViewController.h"

#import "JBMLinkedList.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    JBMLinkedList *linkedList = [[JBMLinkedList alloc] initWithArray:[[NSArray alloc] initWithObjects:@"zero", @"one", @"two", @"three", @"four", @"five", @"six", @"seven", @"eight", @"nine", nil]];
    
    NSLog(@"linkedList: %@", linkedList);
    
    NSLog(@"linkedList.count: %li", (long)linkedList.count);
    
    
    NSLog(@"[linkedList objectAtIndex:5]: %@", [linkedList objectAtIndex:5]);
    
    NSLog(@"linkedList: %@", linkedList);
    
    
    [linkedList removeObjectAtIndex:8];
    
    NSLog(@"[linkedList removeObjectAtIndex:8];");
    
    NSLog(@"linkedList: %@", linkedList);
    
    
    [linkedList addObject:@"eleven" atIndex:3];
    
    NSLog(@"[linkedList addObject:@\"eleven\" atIndex:3];");
    
    NSLog(@"linkedList: %@", linkedList);
    
    
    [linkedList reverse];
    
    NSLog(@"[linkedList reverse];");
    
    NSLog(@"linkedList: %@", linkedList);
    
    
    
    [linkedList pop];
    
    NSLog(@"[linkedList pop];");
    
    NSLog(@"linkedList: %@", linkedList);
    
    
    [linkedList shift];
    
    NSLog(@"[linkedList shift];");
    
    NSLog(@"linkedList: %@", linkedList);
}

@end
