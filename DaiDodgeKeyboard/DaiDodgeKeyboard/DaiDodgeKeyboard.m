//
//  DaiDodgeKeyboard.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/25.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiDodgeKeyboard.h"

#import "UIView+FindFirstResponder.h"

#import "DaiDodgeKeyboard+AccessObject.h"

@interface DaiDodgeKeyboard ()
+(void) keyboardWillShow : (NSNotification*) notification;
+(void) keyboardWillHide : (NSNotification*) notification;
@end

@implementation DaiDodgeKeyboard

static const void *observObjectContext;

#pragma mark - private

+(void) findFirstResponderAndDodgeKeyboard {
    
    UIView *currentResponder = [[self observerView] findFirstResponder];
    
    if (currentResponder != nil) {
        
        CGRect currentKeyboardRect = [[self observerView] convertRect:[self keyboardRect]
                                                             fromView:nil];
        
        CGPoint objectLeftBottom = [currentResponder convertPoint:CGPointMake(0, currentResponder.frame.size.height)
                                                           toView:[self observerView]];
        
        float shiftHeight = objectLeftBottom.y - currentKeyboardRect.origin.y;
        
        if (shiftHeight > 0) {
            [UIView animateWithDuration:[self keyboardAnimationDutation]
                             animations:^{
                                 CGRect newFrame = [self observerView].frame;
                                 newFrame.origin.y = 0 - shiftHeight;
                                 [[self observerView] setFrame:newFrame];
                             }];
        } else {
            [UIView animateWithDuration:[self keyboardAnimationDutation]
                             animations:^{
                                 [[self observerView] setFrame:[self originalViewFrame]];
                             }];
        }
    }
}

+(void) keyboardWillShow : (NSNotification*) notification {
    
    [NSObject cancelPreviousPerformRequestsWithTarget:(NSObject*)self
                                             selector:@selector(findFirstResponderAndDodgeKeyboard)
                                               object:nil];
    
    NSDictionary *userInfo = [notification userInfo];
    
    [self setKeyboardAnimationDutation:[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue]];
    [self setKeyboardRect:[[userInfo objectForKey:UIKeyboardFrameEndUserInfoKey] CGRectValue]];

    [self findFirstResponderAndDodgeKeyboard];
}

+(void) keyboardWillHide : (NSNotification*) notification {
    
    NSDictionary *userInfo = [notification userInfo];
    
    [UIView animateWithDuration:[[userInfo objectForKey:UIKeyboardAnimationDurationUserInfoKey] doubleValue]
                     animations:^{
                         [[self observerView] setFrame:[self originalViewFrame]];
                     }];
}

#pragma mark - class method

+(void) addRegisterTheViewNeedDodgeKeyboard : (UIView*) view {
    
    [self setObserverView:view];
    [self setOriginalViewFrame:view.frame];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillShow:)
                                                 name:UIKeyboardWillShowNotification
                                               object:nil];
    
    [[NSNotificationCenter defaultCenter] addObserver:self
                                             selector:@selector(keyboardWillHide:)
                                                 name:UIKeyboardWillHideNotification
                                               object:nil];
}

+(void) removeRegisterTheViewNeedDodgeKeyboard {
    
    objc_removeAssociatedObjects(self);
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillShowNotification
                                                  object:nil];
    
    [[NSNotificationCenter defaultCenter] removeObserver:self
                                                    name:UIKeyboardWillHideNotification
                                                  object:nil];
}

@end
