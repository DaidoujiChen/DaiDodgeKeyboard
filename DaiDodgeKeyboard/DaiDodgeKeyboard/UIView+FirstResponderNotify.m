//
//  UIView+FirstResponderNotify.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/28.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "UIView+FirstResponderNotify.h"

#import <objc/runtime.h>

#import "DaiDodgeKeyboard+AccessObject.h"
#import "DaiDodgeKeyboard+Animation.h"

@implementation UIView (FirstResponderNotify)

+(void) load {
    static dispatch_once_t onceToken;
    dispatch_once(&onceToken, ^{
        [self swizzling:@selector(becomeFirstResponder) to:@selector(swizzling_becomeFirstResponder)];
    });
}

#pragma mark - method swizzling

-(BOOL) swizzling_becomeFirstResponder {
    
    if ([DaiDodgeKeyboard observerView]) {
        if ([self isViewInSuper:[DaiDodgeKeyboard observerView]]) {
            [DaiDodgeKeyboard changeFirstResponder:self];
        }
    }
    return [self swizzling_becomeFirstResponder];
    
}

#pragma mark - private method

-(BOOL) isViewInSuper : (UIView*) targetView {
    
    if (self.superview) {
        
        if (self.superview == targetView) {
            return YES;
        } else {
            return [self.superview isViewInSuper:targetView];
        }
        
    } else {
        return NO;
    }
    
}

+(void) swizzling : (SEL) before to : (SEL) after {
    Class class = [self class];
    
    SEL originalSelector = before;
    SEL swizzledSelector = after;
    
    Method originalMethod = class_getInstanceMethod(class, originalSelector);
    Method swizzledMethod = class_getInstanceMethod(class, swizzledSelector);
    
    BOOL didAddMethod =
    class_addMethod(class,
                    originalSelector,
                    method_getImplementation(swizzledMethod),
                    method_getTypeEncoding(swizzledMethod));
    
    if (didAddMethod) {
        class_replaceMethod(class,
                            swizzledSelector,
                            method_getImplementation(originalMethod),
                            method_getTypeEncoding(originalMethod));
    } else {
        method_exchangeImplementations(originalMethod, swizzledMethod);
    }
}

@end
