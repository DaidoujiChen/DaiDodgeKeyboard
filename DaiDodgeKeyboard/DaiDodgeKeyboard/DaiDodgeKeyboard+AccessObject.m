//
//  DaiDodgeKeyboard+AccessObject.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/25.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiDodgeKeyboard+AccessObject.h"

@implementation DaiDodgeKeyboard (AccessObject)

static const char OBSERVERVIEWPOINTER;
static const char FIRSTRESPONDERVIEWPOINTER;
static const char ORIGINALVIEWFRAMEPOINTER;
static const char KEYBOARDRECTPOINTER;
static const char KEYBOARDANIMATIONDUTATIONPOINTER;
static const char ISKEYBOARDSHOWPOINTER;

+(void) setObserverView : (UIView*) observerView {
    objc_setAssociatedObject(self, &OBSERVERVIEWPOINTER, observerView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(UIView*) observerView {
    return objc_getAssociatedObject(self, &OBSERVERVIEWPOINTER);
}

+(void) setFristResponderView : (UIView*) firstResponderView {
    objc_setAssociatedObject(self, &FIRSTRESPONDERVIEWPOINTER, firstResponderView, OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(UIView*) firstResponderView {
    return objc_getAssociatedObject(self, &FIRSTRESPONDERVIEWPOINTER);
}

+(void) setOriginalViewFrame : (CGRect) originalViewFrame {
    objc_setAssociatedObject(self, &ORIGINALVIEWFRAMEPOINTER, [NSValue valueWithCGRect:originalViewFrame], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(CGRect) originalViewFrame {
    return [objc_getAssociatedObject(self, &ORIGINALVIEWFRAMEPOINTER) CGRectValue];
}

+(void) setKeyboardRect : (CGRect) keyboardRect {
    objc_setAssociatedObject(self, &KEYBOARDRECTPOINTER, [NSValue valueWithCGRect:keyboardRect], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(CGRect) keyboardRect {
    return [objc_getAssociatedObject(self, &KEYBOARDRECTPOINTER) CGRectValue];
}

+(void) setKeyboardAnimationDutation : (double) keyboardAnimationDutation {
    objc_setAssociatedObject(self, &KEYBOARDANIMATIONDUTATIONPOINTER, [NSNumber numberWithDouble:keyboardAnimationDutation], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(double) keyboardAnimationDutation {
    return [objc_getAssociatedObject(self, &KEYBOARDANIMATIONDUTATIONPOINTER) floatValue];
}

+(void) setIsKeyboardShow : (BOOL) isKeyboardShow {
    objc_setAssociatedObject(self, &ISKEYBOARDSHOWPOINTER, [NSNumber numberWithBool:isKeyboardShow], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
}

+(BOOL) isKeyboardShow {
    return [objc_getAssociatedObject(self, &ISKEYBOARDSHOWPOINTER) boolValue];
}

@end
