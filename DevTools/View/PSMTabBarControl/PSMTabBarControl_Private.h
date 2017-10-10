//
//  PSMTabBarControl_Private.h
//  PSMTabBarControl
//
//  Created by Simon Strandgaard on 01/02/2014.
//  Copyright 2014 Simon Strandgaard. All rights reserved.
//

#import "PSMTabBarControl.h"

@interface PSMTabBarControl (Private)

// draw
- (void)update;

// actions
- (void)tabClick:(id)sender;
- (void)overflowMenuAction:(id)sender;

@end
