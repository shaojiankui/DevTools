//
//  SFSegmentedControl.m
//  DevTools
//
//  Created by Jakey on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#define NSSegmentedCellAquaStyle 1    // Like the tabs in an NSTabView.
#define NSSegmentedCellMetalStyle 2    // Like the Safari and Finder buttons.


#import "SFSegmentedControl.h"
@interface NSSegmentedCell ( Private )
- (void)_setSegmentedCellStyle:(int)style;
@end
@implementation SFSegmentedControl

- (void)drawRect:(NSRect)dirtyRect {
    [super drawRect:dirtyRect];
    
    // Drawing code here.
}
- (void)awakeFromNib
{
    // 26 is the height of normal-sized segmented control:
    [self setFrameSize:NSMakeSize([self frame].size.width, 26)];
}

- (NSCell *)cell
{
    NSSegmentedCell *cell = [super cell];
    NSLog(@"cell!\n");
    switch ([cell controlSize]) {
        case NSRegularControlSize: NSLog(@"NSRegularControlSize\n"); break;
        case NSSmallControlSize: NSLog(@"NSSmallControlSize\n"); break;
        case NSMiniControlSize: NSLog(@"NSMiniControlSize\n"); break;
            //        default: NSLog(@"other control size: %d\n", [cell controlSize]); break;
    }
    [cell setControlSize:NSRegularControlSize];
    [cell _setSegmentedCellStyle:NSSegmentedCellMetalStyle];
    return cell;
}

@end
