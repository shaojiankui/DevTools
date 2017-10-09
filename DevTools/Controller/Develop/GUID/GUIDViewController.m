//
//  GUIDViewController.m
//  DevTools
//
//  Created by Jakey on 2017/10/9.
//  Copyright © 2017年 Jakey. All rights reserved.
//

#import "GUIDViewController.h"

@interface GUIDViewController ()

@end

@implementation GUIDViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do view setup here.
    [self maekTouched:nil];
}
- (NSString *)UUID
{
    CFUUIDRef uuidRef = CFUUIDCreate(NULL);
    CFStringRef uuid = CFUUIDCreateString(NULL, uuidRef);
    CFRelease(uuidRef);
    return (__bridge_transfer NSString *)uuid;
}
- (IBAction)maekTouched:(id)sender {
    self.textField.stringValue = [self UUID];
}
@end
