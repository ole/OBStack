//
//  OBStackTests.h
//  OBStack
//
//  Created by Ole Begemann on 18.10.09.
//  Copyright 2009 Ole Begemann. All rights reserved.
//
//  See Also: http://developer.apple.com/iphone/library/documentation/Xcode/Conceptual/iphone_development/135-Unit_Testing_Applications/unit_testing_applications.html

//  Application unit tests contain unit test code that must be injected into an application to run correctly.
//  Define USE_APPLICATION_UNIT_TEST to 0 if the unit test code is designed to be linked into an independent test executable.

#define USE_APPLICATION_UNIT_TEST 1

#import <SenTestingKit/SenTestingKit.h>
#import <Foundation/Foundation.h>

//#import "application_headers" as required
#import "OBStack.h"


@interface OBStackTests : SenTestCase {
    OBStack *emptyStack;
    id dummyObject;
}

@end
