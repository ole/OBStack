/*
 Copyright (c) 2009 Ole Begemann
 
 Permission is hereby granted, free of charge, to any person obtaining a copy
 of this software and associated documentation files (the "Software"), to deal
 in the Software without restriction, including without limitation the rights
 to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 copies of the Software, and to permit persons to whom the Software is
 furnished to do so, subject to the following conditions:
 
 The above copyright notice and this permission notice shall be included in
 all copies or substantial portions of the Software.
 
 THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 THE SOFTWARE.
 */

/*
 OBStack.m
 
 Created by Ole Begemann
 February, 2009
 */


#import "OBStack.h"


@interface OBStack ()

// Use accessors to access the stackArray internally
@property (nonatomic, retain) NSMutableArray *stackArray;

@end



@implementation OBStack

@synthesize stackArray = _stackArray;


#pragma mark -
#pragma mark Setup and teardown

- (id)init {
    self = [super init];
    if (self != nil) {
        _stackArray = [[NSMutableArray alloc] initWithCapacity:1];
        if (_stackArray == nil) {
            return nil;
        }
    }
    return self;
}

- (void)dealloc {
	[_stackArray release];
    [super dealloc];
}



#pragma mark -
#pragma mark Stack operations

// Pushes a new object onto the stack. object must be non-nil.
// Raises an NSInvalidArgumentException if object is nil.
- (void)push:(id)object {
    if (object == nil) {
        [NSException raise:NSInvalidArgumentException 
                    format:@"attempt to push nil onto the stack"];
    }
    [self.stackArray addObject:object];
}


// Retrieves the topmost object and removes it from the stack.
// Raises an NSRangeException if the stack is empty.
- (id)pop {
    if ([self length] == 0) {
        [NSException raise:NSRangeException 
                    format:@"attempt to pop from empty stack"];
    }
    
    id topObject = [[self top] retain];
    [self.stackArray removeLastObject];
    return [topObject autorelease];
}


// Returns the topmost object without removing it from the stack.
// Returns nil if the stack is empty.
- (id)top {
	return [self.stackArray lastObject];
}


// Returns the number of objects on the stack
- (NSUInteger)length {
    return [self.stackArray count];
}

// Alias for length
- (NSUInteger)height {
    return [self length];
}

// Alias for length
- (NSUInteger)count {
    return [self length];
}


- (BOOL)isEmpty {
    return [self length] == 0;
}

@end
