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
 OBStack.h
 
 Created by Ole Begemann
 February, 2009
 */


#import <Foundation/Foundation.h>


/*
 OBStack is a very simple implementation of a stack data structure (last in, first out) in Cocoa.
 
 It supports the following operations:
 - push: push a new object onto the stack.
 - pop: retrieve the topmost object and remove it from the stack.
 - top: retrieve the topmost object without removing it from the stack.
 - length/height/count: the number of items on the stack.
 - isEmpty: a boolean value if the stack is currently empty.

 Internally, OBStack encapsulates a NSMutableArray to hold the stack objects.
 */
@interface OBStack : NSObject {
    @private
        NSMutableArray *_stackArray;
}

// Push a new object onto the stack
- (void)push:(id)object;

// Retrieve the topmost object and remove it from the stack
- (id)pop;

// Retrieve the topmost object without removing it from the stack
- (id)top;

// Return the number of objects on the stack
- (NSUInteger)length;

// Aliases for length
- (NSUInteger)height;
- (NSUInteger)count;

- (BOOL)isEmpty;

@end
