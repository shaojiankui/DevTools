//
//  ToolsListItem.h
//  DevTools
//
//  Created by Jakey on 2017/10/9.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface ToolsListItem : NSCollectionViewItem
@property (weak) IBOutlet NSImageView *icon;
@property (weak) IBOutlet NSTextField *titleLabel;
@property (weak) IBOutlet NSTextField *detailLabel;
-(void)congfigCell:(id)item;
@end
