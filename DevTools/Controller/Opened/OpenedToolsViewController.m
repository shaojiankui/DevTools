//
//  OpenedToolsViewController.m
//  DevTools
//
//  Created by Jakey on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "OpenedToolsViewController.h"

#import "GUIDViewController.h"
#import "PSMRolloverButton.h"
#import "PSMTabStyle.h"
#import "DemoFakeModel.h"

#import "AppDelegate.h"
#import "NSView+ImageRepresentation.h"
#import "NSImage+Corp.h"
#import "NSControl+ImageRepresentation.h"
@interface OpenedToolsViewController ()

@end

@implementation OpenedToolsViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
-(void)awakeFromNib{
    [self _setUpTabBar];

}
//- (PSMTabBarControl *)tabBar {
//    return _tabBar;
//}
- (void)_setUpTabBar
{
    
    [self.tabBar setStyleNamed:@"LiveChat"];
    [self.tabBar setCanCloseOnlyTab:NO];
    self.tabBar.orientation =  PSMTabBarHorizontalOrientation;
//    [self.tabBar setHideForSingleTab:![[NSUserDefaults standardUserDefaults] boolForKey:SPAlwaysShowWindowTabBar]];
    [self.tabBar setShowAddTabButton:YES];
    [self.tabBar setSizeCellsToFit:NO];
    [self.tabBar setCellMinWidth:100];
    [self.tabBar setCellMaxWidth:250];
    [self.tabBar setCellOptimumWidth:130];
    [self.tabBar setSelectsTabsOnMouseDown:YES];
    self.tabBar.useOverflowMenu = YES;
    [self.tabBar setTearOffStyle:PSMTabBarTearOffAlphaWindow];
 
    [[self.tabBar addTabButton] setTarget:self];
    [[self.tabBar addTabButton] setAction:@selector(addNewTab:)];
    [self addDefaultTabs];

    
}
- (void)addDefaultTabs {
//    [[self.tabView tabViewItemAtIndex:0] setLabel:@"Tab"];
//    [self addNewTab:self];
}

- (IBAction)addNewTab:(id)sender {
    DemoFakeModel *newModel = [[DemoFakeModel alloc] init];
    NSTabViewItem *newItem = [(NSTabViewItem*)[NSTabViewItem alloc] initWithIdentifier:newModel];
    GUIDViewController *guid = [[GUIDViewController alloc] init];
    newItem.view = guid.view;
    [newItem setLabel:@"Untitled"];
    [self.tabView addTabViewItem:newItem];
    [self.tabView selectTabViewItem:newItem]; // this is optional, but expected behavior

}

#pragma --mark
- (BOOL)tabView:(NSTabView *)aTabView shouldCloseTabViewItem:(NSTabViewItem *)tabViewItem {
    if([[tabViewItem label] isEqualToString:@"Drake"]) {
        NSAlert *drakeAlert = [NSAlert alertWithMessageText:@"No Way!" defaultButton:@"OK" alternateButton:nil otherButton:nil informativeTextWithFormat:@"I refuse to close a tab named \"Drake\""];
        [drakeAlert beginSheetModalForWindow:[NSApp keyWindow] modalDelegate:nil didEndSelector:nil contextInfo:nil];
        return NO;
    }
    return YES;
}

- (void)tabView:(NSTabView *)aTabView didCloseTabViewItem:(NSTabViewItem *)tabViewItem {
    NSLog(@"didCloseTabViewItem: %@", [tabViewItem label]);
}

- (NSArray *)allowedDraggedTypesForTabView:(NSTabView *)aTabView {
    return [NSArray arrayWithObjects:NSFilenamesPboardType, NSStringPboardType, nil];
}

- (void)tabView:(NSTabView *)aTabView acceptedDraggingInfo:(id <NSDraggingInfo>)draggingInfo onTabViewItem:(NSTabViewItem *)tabViewItem {
    NSLog(@"acceptedDraggingInfo: %@ onTabViewItem: %@", [[draggingInfo draggingPasteboard] stringForType:[[[draggingInfo draggingPasteboard] types] objectAtIndex:0]], [tabViewItem label]);
}

- (NSMenu *)tabView:(NSTabView *)aTabView menuForTabViewItem:(NSTabViewItem *)tabViewItem {
    NSLog(@"menuForTabViewItem: %@", [tabViewItem label]);
    return nil;
}

- (BOOL)tabView:(NSTabView*)aTabView shouldDragTabViewItem:(NSTabViewItem *)tabViewItem fromTabBar:(PSMTabBarControl *)tabBarControl {
    return YES;
}

- (BOOL)tabView:(NSTabView*)aTabView shouldDropTabViewItem:(NSTabViewItem *)tabViewItem inTabBar:(PSMTabBarControl *)tabBarControl {
    return YES;
}

- (void)tabView:(NSTabView*)aTabView didDropTabViewItem:(NSTabViewItem *)tabViewItem inTabBar:(PSMTabBarControl *)tabBarControl {
    NSLog(@"didDropTabViewItem: %@ inTabBar: %@", [tabViewItem label], tabBarControl);
}
- (NSImage *)tabView:(NSTabView *)aTabView imageForTabViewItem:(NSTabViewItem *)tabViewItem offset:(NSSize *)offset styleMask:(NSUInteger *)styleMask {
    NSView *contentView =  self.view;
    
    //视图的image
    NSImage *viewImage = [contentView imageForLayout];
    viewImage = [viewImage corpMarginTop:(contentView.frame.size.height -  CGRectGetMaxY(self.tabBar.frame))];
 
//
    NSImage *tabViewItemImage = [tabViewItem.view imageRepresentation];
    viewImage = [viewImage mergeOtherImage:tabViewItemImage];

    
//    NSImage *cellImage = [[[self.tabBar.cells lastObject] controlView] imageRepresentation];
//    viewImage = [viewImage mergeOtherImage:cellImage];
//    
    
    PSMTabBarControl *tabBarControl = (PSMTabBarControl*)[aTabView delegate];

    //draw over where the tab bar would usually be
    NSRect tabFrame = [self.tabBar frame];
 
    [viewImage lockFocus];
    [[NSColor windowBackgroundColor] set];
    NSRectFill(tabFrame);
    //draw the background flipped, which is actually the right way up
    NSAffineTransform *transform = [NSAffineTransform transform];
    [transform scaleXBy:1.0 yBy:-1.0];
    [transform concat];
    tabFrame.origin.y = -tabFrame.origin.y - tabFrame.size.height;
    [[tabBarControl style] drawBezelOfTabBarControl:tabBarControl inRect:tabFrame];
    [transform invert];
    [transform concat];

    [viewImage unlockFocus];

    if([tabBarControl orientation] == PSMTabBarHorizontalOrientation) {
        offset->width = [(id < PSMTabStyle >)[tabBarControl style] leftMarginForTabBarControl:tabBarControl];
        offset->height = -22;
    } else {
        offset->width = 0;
        offset->height = -22 + [(id < PSMTabStyle >)[tabBarControl style] leftMarginForTabBarControl:tabBarControl];
    }

    if(styleMask) {
        *styleMask = NSTitledWindowMask | NSTexturedBackgroundWindowMask;
    }
//
    return viewImage;
}

- (PSMTabBarControl *)tabView:(NSTabView *)aTabView newTabBarForDraggedTabViewItem:(NSTabViewItem *)tabViewItem atPoint:(NSPoint)point {
    NSLog(@"newTabBarForDraggedTabViewItem: %@ atPoint: %@", [tabViewItem label], NSStringFromPoint(point));
    
    //create a new window controller with no tab items
    GUIDViewController *guid = [[GUIDViewController alloc] init];

    PSMTabBarControl *tabBarControl = (PSMTabBarControl*)[aTabView delegate];
    
    id <PSMTabStyle> style = (id <PSMTabStyle>)[tabBarControl style];
    
//    NSRect windowFrame = [guid.view frame];
//    point.y += windowFrame.size.height - guid.view.frame.size.height;
//    point.x -= [style leftMarginForTabBarControl:tabBarControl];
    guid.view.frame = self.view.frame;
//    [[guid.view window] setFrameTopLeftPoint:point];
//    [guid.tabBar setStyle:style];
    [self presentViewControllerAsModalWindow:guid];
    return nil;
}

- (void)tabView:(NSTabView *)aTabView closeWindowForLastTabViewItem:(NSTabViewItem *)tabViewItem {
    NSLog(@"closeWindowForLastTabViewItem: %@", [tabViewItem label]);
//    [[self window] close];
}

- (void)tabView:(NSTabView *)aTabView tabBarDidHide:(PSMTabBarControl *)tabBarControl {
    NSLog(@"tabBarDidHide: %@", tabBarControl);
}

- (void)tabView:(NSTabView *)aTabView tabBarDidUnhide:(PSMTabBarControl *)tabBarControl {
    NSLog(@"tabBarDidUnhide: %@", tabBarControl);
}

- (NSString *)tabView:(NSTabView *)aTabView toolTipForTabViewItem:(NSTabViewItem *)tabViewItem {
    return [tabViewItem label];
}

- (NSString *)accessibilityStringForTabView:(NSTabView *)aTabView objectCount:(NSInteger)objectCount {
    return (objectCount == 1) ? @"item" : @"items";
}

@end
