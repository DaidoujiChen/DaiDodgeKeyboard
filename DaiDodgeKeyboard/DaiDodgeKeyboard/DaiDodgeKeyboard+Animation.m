//
//  DaiDodgeKeyboard+Animation.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/28.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiDodgeKeyboard+Animation.h"

#import "DaiDodgeKeyboard+AccessObject.h"

@implementation DaiDodgeKeyboard (Animation)

#pragma mark - class method

+ (void)changeFirstResponder:(UIView *)newFirstResponderView
{
	if ([self objects].isKeyboardShow) {
		[self dodgeNewView:newFirstResponderView];
		[self objects].firstResponderView = newFirstResponderView;
	} else {
		[self objects].firstResponderView = newFirstResponderView;
	}
}

+ (void)dodgeKeyboardAnimation
{
	CGRect currentKeyboardFrame = [self currentKeyboardFrame];
    CGRect currentFirstResponderFrame = [self currentFirstResponderFrame:[self objects].firstResponderView];
    CGFloat viewFloor = currentFirstResponderFrame.origin.y + currentFirstResponderFrame.size.height;
    BOOL isCrossOnKeyboard = (viewFloor >= currentKeyboardFrame.origin.y);
    
    if (isCrossOnKeyboard && [self objects].isKeyboardShow) {
        CGFloat currentShift = viewFloor - currentKeyboardFrame.origin.y - [self objects].shiftHeight;

        [UIView animateWithDuration:[self objects].keyboardAnimationDutation animations: ^{
            CGRect newFrame = [self objects].observerView.frame;
            newFrame.origin.y = [self objects].observerView.frame.origin.y - currentShift;
            [self objects].observerView.frame = newFrame;
        } completion:^(BOOL finished) {
            [self objects].shiftHeight = -[self objects].observerView.frame.origin.y;
        }];
    } else if (![self objects].isKeyboardShow) {
        [UIView animateWithDuration:[self objects].keyboardAnimationDutation animations: ^{
            [self objects].observerView.frame = [self objects].originalViewFrame;
        } completion:^(BOOL finished) {
            [self objects].shiftHeight = 0;
        }];
    }
}


#pragma mark - private

//做這個 method 的當下, 實際上的 view 已經被上移, 要以被上移的基礎上做考量
+ (void)dodgeNewView:(UIView *)newView
{
	CGRect currentKeyboardFrame = [self currentKeyboardFrame];
    CGRect currentFirstResponderFrame = [self currentFirstResponderFrame:newView];
    CGFloat viewFloor = currentFirstResponderFrame.origin.y + currentFirstResponderFrame.size.height;
    BOOL isCrossOnKeyboard = (viewFloor >= currentKeyboardFrame.origin.y);
    
    if (isCrossOnKeyboard) {
        CGFloat currentShift = viewFloor - currentKeyboardFrame.origin.y - [self objects].shiftHeight;

        [UIView animateWithDuration:[self objects].keyboardAnimationDutation animations: ^{
            CGRect newFrame = [self objects].observerView.frame;
            newFrame.origin.y = [self objects].observerView.frame.origin.y - currentShift;
            [self objects].observerView.frame = newFrame;
        } completion:^(BOOL finished) {
            [self objects].shiftHeight = -[self objects].observerView.frame.origin.y;
        }];
    } else {
        [UIView animateWithDuration:[self objects].keyboardAnimationDutation animations: ^{
            [self objects].observerView.frame = [self objects].originalViewFrame;
        } completion:^(BOOL finished) {
            [self objects].shiftHeight = 0;
        }];
    }
}

+ (CGRect)currentKeyboardFrame
{
    return [[self objects].textEffectsWindow convertRect:[self objects].keyboardFrame fromView:nil];
}

+ (CGRect)currentFirstResponderFrame:(UIView *)view
{
    CGRect currentFirstResponderFrame = [[self objects].textEffectsWindow convertRect:view.frame fromView:view.superview];
    currentFirstResponderFrame.origin.y += [self objects].shiftHeight;
    return currentFirstResponderFrame;
}

@end
