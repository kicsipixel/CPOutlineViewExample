/*
 * AppController.j
 * CPOutlineView
 *
 * Created by You on July 27, 2016.
 * Copyright 2016, Your Company All rights reserved.
 */

@import <Foundation/Foundation.j>
@import <AppKit/AppKit.j>
@import "EmployeeData.j"


@implementation AppController : CPObject
{
    @outlet CPWindow        theWindow;
    EmployeeData                president;
    EmployeeData                employee;
    @outlet CPOutlineView outlineView;
}

- (void)applicationDidFinishLaunching:(CPNotification)aNotification
{
    // This is called when the application is done loading.
  
}

- (id)init
{
    self = [super init];
    if (self)
    {
        president = [[EmployeeData alloc] initWithName: "Mary" : "President"];
        var bill = [[EmployeeData alloc] initWithName: "Bill" : "VP of Engineering"];
        [president.employees addObject:bill];

        var sarah = [[EmployeeData alloc] initWithName: "Sarah" : "Assistant of VP"];
        [bill.employees addObject:sarah];
        
        var joe = [[EmployeeData alloc] initWithName:"Joe" : "VP of Marketing"];
        [president.employees addObject:joe];
        
        var kim = [[EmployeeData alloc] initWithName:"Kim" : "Head of Communication"];
        [joe.employees addObject:kim];

        var henry = [[EmployeeData alloc] initWithName: "Henry" : "Communication Specialist"];
        [kim.employees addObject:henry];

        var dick = [[EmployeeData alloc] initWithName: "Dick" : "VP of HR"];
        [president.employees addObject:dick];
    }
    return self;
}

- (void)awakeFromCib
{
    // This is called when the cib is done loading.
    // You can implement this method on any object instantiated from a Cib.
    // It's a useful hook for setting up current UI values, and other things.

    // In this case, we want the window from Cib to become our full browser window
    [theWindow setFullPlatformWindow:NO];
}


- (id)outlineView:(CPOutlineView)outlineView child:(CPInteger)index ofItem:(id)item
{
    if (item == nil)
    {
        return president;
    }
    else
    {
        employee = item;
        return (employee.employees[index]);
    }
}

- (BOOL)outlineView:(CPOutlineView)outlineView isItemExpandable:(id)item
{
    if (item == nil)
    {
        return YES;
    }
    else
    {
        employee = item;
        return([employee.employees count] != 0);
    }
}

- (int)outlineView:(CPOutlineView)outlineView numberOfChildrenOfItem:(id)item
{
    if (item == nil)
    {
        return 1;
    }
    else
    {
        employee = item
        return([employee.employees count]);
    }
}

-(id)outlineView:(id)oview viewForTableColumn:(id)tableColumn item:(id)item
{
    var identifier = [tableColumn identifier];

    if (identifier == "NameColumn")
    {
        var view = [oview makeViewWithIdentifier:"NameColumn" owner:self];
        [[view textField] setStringValue:item.name ];
    }
    else
    {
        var view = [oview makeViewWithIdentifier:"JobTitleColumn" owner:self];
        [[view textField] setStringValue:item.title ];
    }
    return view;
}

@end