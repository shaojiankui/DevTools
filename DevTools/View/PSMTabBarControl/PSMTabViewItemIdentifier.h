//
//  PSMTabViewItemIdentifier.h
//  PSMTabBarControl
//

#import <Cocoa/Cocoa.h>

@protocol PSMTabViewItemIdentifier <NSObject>
@optional

// show spinner
- (BOOL)isProcessing;

// small icon
- (NSImage*)icon;

// show badge with number inside
- (NSInteger)objectCount;

// badge color
- (NSColor*)countColor;

// big icon
- (NSImage*)largeImage;

// gray out
- (BOOL)isEdited;

@end
