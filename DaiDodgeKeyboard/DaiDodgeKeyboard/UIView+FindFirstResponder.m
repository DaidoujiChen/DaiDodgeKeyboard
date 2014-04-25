//
//  UIView+FindFirstResponder.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/25.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "UIView+FindFirstResponder.h"

@implementation UIView (FindFirstResponder)
-(UIView*) findFirstResponder {
    if (self.isFirstResponder) return self;
    for (UIView *subView in self.subviews) {
        UIView *firstResponder = [subView findFirstResponder];
        if (firstResponder != nil) return firstResponder;
    }
    return nil;
}
@end
