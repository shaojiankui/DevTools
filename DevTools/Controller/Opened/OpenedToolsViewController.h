//
//  OpenedToolsViewController.h
//  DevTools
//
//  Created by Jakey on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "BaseViewController.h"
#import "PSMTabBarControl.h"
@interface OpenedToolsViewController : BaseViewController
@property (weak) IBOutlet PSMTabBarControl *tabBar;

@property (weak) IBOutlet NSTabView *tabView;
//- (PSMTabBarControl *)tabBar;
@end
