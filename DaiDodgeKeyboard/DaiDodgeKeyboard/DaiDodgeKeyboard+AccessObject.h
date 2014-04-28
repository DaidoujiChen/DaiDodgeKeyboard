//
//  DaiDodgeKeyboard+AccessObject.h
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/25.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiDodgeKeyboard.h"

#import <objc/runtime.h>

@interface DaiDodgeKeyboard (AccessObject)

+(void) setObserverView : (UIView*) observerView;
+(UIView*) observerView;

+(void) setFristResponderView : (UIView*) firstResponderView;
+(UIView*) firstResponderView;

+(void) setOriginalViewFrame : (CGRect) originalViewFrame;
+(CGRect) originalViewFrame;

+(void) setKeyboardRect : (CGRect) keyboardRect;
+(CGRect) keyboardRect;

+(void) setKeyboardAnimationDutation : (double) keyboardAnimationDutation;
+(double) keyboardAnimationDutation;

+(void) setIsKeyboardShow : (BOOL) isKeyboardShow;
+(BOOL) isKeyboardShow;

@end
