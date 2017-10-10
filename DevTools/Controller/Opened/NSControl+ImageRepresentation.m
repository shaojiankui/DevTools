//
//  NSControl+ImageRepresentation.m
//  DevTools
//
//  Created by Jakey on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "NSControl+ImageRepresentation.h"

@implementation NSControl (ImageRepresentation)
- (NSImage *)imageRepresentation
{
    BOOL wasHidden = self.isHidden;
    CGFloat wantedLayer = self.wantsLayer;
    
    self.hidden = NO;
    self.wantsLayer = YES;
    
    NSImage *image = [[NSImage alloc] initWithSize:self.bounds.size];
    [image lockFocus];
    CGContextRef ctx = [NSGraphicsContext currentContext].graphicsPort;
    [self.layer renderInContext:ctx];
    [image unlockFocus];
    
    self.wantsLayer = wantedLayer;
    self.hidden = wasHidden;
    
    return image;
}
@end
