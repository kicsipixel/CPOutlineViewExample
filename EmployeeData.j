/*
 * EmployeeData.j
 * CPOutlineView
 *
 * Created by You on July 27, 2016.
 * Copyright 2016, Your Company All rights reserved.
 */

@import <Foundation/CPObject.j>

@implementation EmployeeData : CPObject
{
    CPString    name  @accessors;
    CPString    title @accessors;

    CPMutableArray employees @accessors;
}

- (id)initWithName:(CPString)empName : (CPString)empTitle
{
    self = [super init];
    if (self)
    {
        name = empName;
        title = empTitle;
        employees = [CPMutableArray array];
    }
    return self;
}

@end