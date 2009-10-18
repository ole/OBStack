//
//  OBStackTests.m
//  OBStack
//
//  Created by Ole Begemann on 18.10.09.
//  Copyright 2009 Ole Begemann. All rights reserved.
//

#import "OBStackTests.h"


@implementation OBStackTests


- (void) setUp {
    emptyStack = [[OBStack alloc] init];
    dummyObject = [NSNull null];
}

- (void) tearDown {
    [emptyStack release];
}



- (void)testExceptionOnPushNil {
    STAssertThrows([emptyStack push:nil], @"Pushing nil onto the stack must throw an exception.");
    STAssertNoThrow([emptyStack push:dummyObject], @"Pushing a non-nil object onto the stack must not throw an exception.");
}


- (void)testTop {
    STAssertNil([emptyStack top], @"Top must return nil on empty stack.");

    NSUInteger numObjects = 100;
    for (NSUInteger i = 1; i <= numObjects; i++) {
        NSString *dummy = [NSString stringWithFormat:@"Dummy %u", i];
        [emptyStack push:dummy];
        id topObject = [emptyStack top];
        STAssertEqualObjects(topObject, dummy, @"Top object must be equal to the one we just pushed onto the stack.");
    }
}


- (void)testPop {
    NSMutableArray *arrayToHoldDummyObjects = [NSMutableArray array];
    
    NSUInteger numObjects = 100;
    for (NSUInteger i = 1; i <= numObjects; i++) {
        NSString *dummy = [NSString stringWithFormat:@"Dummy %u", i];
        [emptyStack push:dummy];
        [arrayToHoldDummyObjects addObject:dummy];
    }
    
    for (NSUInteger i = numObjects; i > 0; i--) {
        STAssertEquals([emptyStack length], i, @"Stack must contain %u objects here.", numObjects);
        id poppedObject = [emptyStack pop];
        STAssertEqualObjects(poppedObject, [arrayToHoldDummyObjects objectAtIndex:i-1], @"Popped object must be equal to the one we put in.");
        STAssertEquals([emptyStack length], i-1, @"Stack length must have decreased by one after popping.");
    }
}


- (void)testExceptionOnPopWhenEmpty {
    STAssertThrows([emptyStack pop], @"Popping from an empty stack must throw an exception.");
}


- (void)testLength {
    STAssertEquals([emptyStack length], 0u, @"Stack must have length 0.");
    
    for (NSUInteger i = 1; i < 100; i++) {
        [emptyStack push:dummyObject];
        STAssertEquals([emptyStack length], i, @"Stack must have length %u.", i);
    }
}


- (void)testLengthAliases {
    STAssertEquals([emptyStack height], [emptyStack length], @"height must return the same as length.");
    STAssertEquals([emptyStack count],  [emptyStack length], @"count must return the same as length.");

    for (NSUInteger i = 1; i < 100; i++) {
        [emptyStack push:dummyObject];
        STAssertEquals([emptyStack height], [emptyStack length], @"height must return the same as length.");
        STAssertEquals([emptyStack count],  [emptyStack length], @"count must return the same as length.");
    }
}


- (void)testIsEmpty {
    STAssertTrue([emptyStack isEmpty], @"Newly created stack must report as empty.");
    [emptyStack push:dummyObject];
    STAssertTrue(![emptyStack isEmpty], @"A non-empty stack must not report as empty.");
}

@end
