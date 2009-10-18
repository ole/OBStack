//
//  OBStackDemoAppDelegate.m
//  OBStackDemo
//
//  Created by Ole Begemann on 18.10.09.
//  Copyright Ole Begemann 2009. All rights reserved.
//

#import "OBStackDemoAppDelegate.h"

@implementation OBStackDemoAppDelegate

@synthesize window;


- (void)applicationDidFinishLaunching:(UIApplication *)application {    

    // Override point for customization after application launch
    [window makeKeyAndVisible];
}


- (void)dealloc {
    [window release];
    [super dealloc];
}


@end
