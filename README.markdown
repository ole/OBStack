OBStack
=======

OBStack is a very simple implementation of a stack data structure (last in, first out) in Cocoa.

It supports the following operations:
* push: push a new object onto the stack.
* pop: retrieve the topmost object and remove it from the stack.
* top: retrieve the topmost object without removing it from the stack.
* length/height/count: the number of items on the stack.
* isEmpty: a boolean value if the stack is currently empty.

Internally, OBStack encapsulates a NSMutableArray to hold the stack objects.
