//
//  NSView+ImageRepresentation.h
//  DevTools
//
//  Created by Jakey on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSView (ImageRepresentation)
- (NSImage *)imageForLayout;
- (NSImage *)imageRepresentation;
- (NSImage *)imageRepresentationMarginTop:(CGFloat)marginTop;
@end
