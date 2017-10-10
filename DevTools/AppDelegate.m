//
//  AppDelegate.m
//  DevTools
//
//  Created by Jakey on 2017/10/9.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "AppDelegate.h"
#import "ToolsListViewController.h"
#import "OpenedToolsViewController.h"
#import "OpenedWindowController.h"
@interface AppDelegate ()
{
    ToolsListViewController *_list;
    OpenedToolsViewController   *_opend;
}
@end

@implementation AppDelegate
+(AppDelegate*)APP{
    return (AppDelegate*)[[NSApplication sharedApplication] delegate];
}

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _list = [[ToolsListViewController alloc] init];
    
    NSTabViewItem *listItem =  [self.tabView.tabViewItems objectAtIndex:0];
    listItem.view = _list.view;
    listItem.viewController = _list;
    
    _opend = [[OpenedToolsViewController alloc] init];
    NSTabViewItem *openedItem =  [self.tabView.tabViewItems objectAtIndex:1];
    openedItem.view = _opend.view;
    openedItem.viewController = _opend;
    
//    OpenedWindowController *newWindow = [[OpenedWindowController alloc] initWithWindowNibName:@"OpenedWindowController"];
//    [newWindow showWindow:self];
}

- (void)applicationWillTerminate:(NSNotification *)aNotification {
    // Insert code here to tear down your application
}
- (BOOL)applicationShouldHandleReopen:(NSApplication *)theApplication hasVisibleWindows:(BOOL)flag
{
    if (!flag)
    {
        [self.window makeKeyAndOrderFront:self];
    }
    return YES;
}
- (BOOL)applicationShouldTerminateAfterLastWindowClosed:(NSApplication *)sender{
    return YES;
}

@end
