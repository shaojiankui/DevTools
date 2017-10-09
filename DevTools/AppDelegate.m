//
//  AppDelegate.m
//  DevTools
//
//  Created by Jakey on 2017/10/9.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "AppDelegate.h"
#import "ToolsListViewController.h"

@interface AppDelegate ()
{
    ToolsListViewController *_list;


}
@property (weak) IBOutlet NSWindow *window;
@end

@implementation AppDelegate

- (void)applicationDidFinishLaunching:(NSNotification *)aNotification {
    // Insert code here to initialize your application
    _list = [[ToolsListViewController alloc] initWithNibName:@"ToolsListViewController" bundle:nil];
    
    self.window.contentViewController = _list;
 
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
