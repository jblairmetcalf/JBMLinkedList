//
//  AppDelegate.m
//  JBMLinkedList
//
//  Created by J Blair Metcalf on 4/20/15.
//  Copyright (c) 2015 J Blair Metcalf. All rights reserved.
//

#import "AppDelegate.h"

#import "JBMLinkedList.h"

@implementation AppDelegate

- (BOOL)application:(UIApplication *)application didFinishLaunchingWithOptions:(NSDictionary *)launchOptions {
    
    
    JBMLinkedList *linkedList = [[JBMLinkedList alloc] initWithArray:[[NSArray alloc] initWithObjects:@"zero", @(1), @"two", @(3), @"four", @[@(5)], @"six", @{@"value": @(7)}, @"eight", @(9), nil]];
    
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
    
    
    return YES;
}

@end
