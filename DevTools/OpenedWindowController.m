//
//  OpenedWindowController.m
//  DevTools
//
//  Created by runlin on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "OpenedWindowController.h"
#import "PSMTabBarControl.h"
#import "PSMTabStyle.h"
#import "PSMRolloverButton.h"
#import "DemoFakeModel.h"
@interface OpenedWindowController ()

@end

@implementation OpenedWindowController

- (void)windowDidLoad {
    [super windowDidLoad];
    
    // Implement this method to handle any initialization after your window controller's window has been loaded from its nib file.
}
- (void)awakeFromNib {
    
    [super awakeFromNib];
    [self.tabBar setStyleNamed:@"Metal"];
    [self.tabBar setCanCloseOnlyTab:NO];
    //    [self.self.tabBar setHideForSingleTab:![[NSUserDefaults standardUserDefaults] boolForKey:SPAlwaysShowWindowself.tabBar]];
    [self.tabBar setShowAddTabButton:YES];
    [self.tabBar setSizeCellsToFit:NO];
    [self.tabBar setCellMinWidth:100];
    [self.tabBar setCellMaxWidth:250];
    [self.tabBar setCellOptimumWidth:130];
    [self.tabBar setSelectsTabsOnMouseDown:YES];
    self.tabBar.useOverflowMenu = YES;
    [self.tabBar setTearOffStyle:PSMTabBarTearOffAlphaWindow];
    
    // hook up add tab button
    [[self.tabBar addTabButton] setTarget:self];
    [[self.tabBar addTabButton] setAction:@selector(addNewTab:)];
    
    //    // remove any tabs present in the nib
    //    for (NSTabViewItem *item in [tabView tabViewItems]) {
    //        [tabView removeTabViewItem:item];
    //    }
    
    //    [self performSelector:@selector(configureself.tabBarInitially)
    //     withObject:nil
    //     afterDelay:0];
    
    // open drawer
    //[drawer toggle:self];
    [self addDefaultTabs];
    
}

- (void)addDefaultTabs {
    [self addNewTab:self];
    [self addNewTab:self];
    [self addNewTab:self];
    [[self.tabView tabViewItemAtIndex:0] setLabel:@"Tab"];
    [[self.tabView tabViewItemAtIndex:1] setLabel:@"Bar"];
    [[self.tabView tabViewItemAtIndex:2] setLabel:@"Control"];
}

- (IBAction)addNewTab:(id)sender {
    DemoFakeModel *newModel = [[DemoFakeModel alloc] init];
    NSTabViewItem *newItem = [[NSTabViewItem alloc] initWithIdentifier:newModel];
    [newItem setLabel:@"Untitled"];
    [self.tabView addTabViewItem:newItem];
    [self.tabView selectTabViewItem:newItem]; // this is optional, but expected behavior

}
@end
