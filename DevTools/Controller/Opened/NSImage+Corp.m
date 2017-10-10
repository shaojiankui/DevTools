//
//  NSImage+Corp.m
//  DevTools
//
//  Created by Jakey on 2017/10/10.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "NSImage+Corp.h"

@implementation NSImage (Corp)
- (NSImage*)corpMarginTop:(CGFloat)marginTop{

    NSImage *sourceImage = self;
    
    // Report an error if the source isn't a valid image
    if (![sourceImage isValid]){
        NSLog(@"Invalid Image");
    } else {
        CGSize newSize = CGSizeMake(sourceImage.size.width, sourceImage.size.height-marginTop);
        
        NSImage *smallImage = [[NSImage alloc] initWithSize:CGSizeMake(sourceImage.size.width, sourceImage.size.height-marginTop)];
        
        [smallImage lockFocus];
        [sourceImage setSize: CGSizeMake(sourceImage.size.width, sourceImage.size.height)];
        [[NSGraphicsContext currentContext] setImageInterpolation:NSImageInterpolationHigh];
        [sourceImage drawAtPoint:NSZeroPoint fromRect:CGRectMake(0, 0, newSize.width, newSize.height) operation:NSCompositeCopy fraction:1.0];
        [smallImage unlockFocus];
        return smallImage;
    }
    return nil;
    
}
- (NSImage*)mergeOtherImage:(NSImage*)otherImaqe{
    NSImage *newImage = [[NSImage alloc] initWithSize:[self size]];
    [newImage lockFocus];
    CGRect newImageRect = CGRectZero;
    newImageRect.size = [newImage size];
    [otherImaqe drawInRect:newImageRect];
    [newImage unlockFocus];
//    CGImageRef newImageRef = [newImage CGImageForProposedRect:NULL context:nil hints:nil];
    return newImage;
}

@end
