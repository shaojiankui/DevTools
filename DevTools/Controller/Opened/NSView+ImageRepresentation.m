//
//  NSView+ImageRepresentation.m
//  DevTools
//
//  Created by Jakey on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "NSView+ImageRepresentation.h"

@implementation NSView (ImageRepresentation)
- (NSImage *)imageForLayout{
    NSRect viewRect = [self frame];
    NSImage *tabViewImage = [[NSImage alloc] initWithSize:viewRect.size];
    [self lockFocus];
    [self drawRect:[self bounds]];
    [self unlockFocus];
    
    
//    NSBitmapImageRep *rep  = [self bitmapImageRepForCachingDisplayInRect:self.bounds];
//    [self cacheDisplayInRect:self.bounds toBitmapImageRep:rep];
//
//    NSImage *image = [[NSImage alloc] init];
//    [image addRepresentation:rep];
//    rep.size = CGSizeMake(self.frame.size.width, self.frame.size.height);
    return tabViewImage;
}
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
- (NSImage *)imageRepresentationMarginTop:(CGFloat)marginTop{
    BOOL wasHidden = self.isHidden;
    CGFloat wantedLayer = self.wantsLayer;
    
    self.hidden = NO;
    self.wantsLayer = YES;
    
    CGSize size = self.bounds.size;
    size.height -= marginTop;
   
    [self lockFocus];
    //    生成所需图片
    CGRect rect = [self bounds];
    rect.origin.y = marginTop;
    rect.size.height -= marginTop;

    NSImage *image = [[NSImage alloc]initWithData:[self dataWithPDFInsideRect:rect]];
    [self unlockFocus];
    
    
    self.wantsLayer = wantedLayer;
    self.hidden = wasHidden;
    
    return image;
}
@end
