//
//  NSImage+Corp.h
//  DevTools
//
//  Created by Jakey on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import <Cocoa/Cocoa.h>

@interface NSImage (Corp)
- (NSImage*)corpMarginTop:(CGFloat)marginTop;
- (NSImage*)mergeOtherImage:(NSImage*)otherImaqe;
@end
