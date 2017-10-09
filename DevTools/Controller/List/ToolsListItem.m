//
//  ToolsListItem.m
//  DevTools
//
//  Created by Jakey on 2017/10/9.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "ToolsListItem.h"

@interface ToolsListItem ()

@end

@implementation ToolsListItem
- (void)awakeFromNib {
    self.view.wantsLayer = YES;  // NSView will create a CALayer automatically
    self.view.layer.backgroundColor = [NSColor colorWithRed:251/255.0 green:251/255.0 blue:251/255.0 alpha:1].CGColor;
    self.view.layer.cornerRadius = 5;
    
}
//- (BOOL)wantsUpdateLayer {
//    return YES;  // Tells NSView to call `updateLayer` instead of `drawRect:`
//}
//- (void)updateLayer{
//}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
}
-(void)congfigCell:(id)item{
    self.titleLabel.stringValue = [item objectForKey:@"name"];
    self.detailLabel.stringValue = [item objectForKey:@"detail"];
    self.icon.image = [NSImage imageNamed: [item objectForKey:@"icon"]];

}
@end
