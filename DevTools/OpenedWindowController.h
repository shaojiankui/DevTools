//
//  OpenedWindowController.h
//  DevTools
//
//  Created by runlin on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>
#import "PSMTabBarControl.h"
@interface OpenedWindowController : NSWindowController
@property (weak) IBOutlet PSMTabBarControl *tabBar;

@property (weak) IBOutlet NSTabView *tabView;
@end
