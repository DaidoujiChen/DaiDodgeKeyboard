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
	UIView *currentFirstResponder = [self objects].firstResponderView;
	CGRect currentKeyboardRect = [[self objects].observerView convertRect:[self objects].keyboardFrame fromView:nil];
	CGPoint objectLeftBottom = [currentFirstResponder convertPoint:CGPointMake(0, currentFirstResponder.frame.size.height) toView:[self objects].observerView];
    
	//workaround for uitextview
	if ([currentFirstResponder isKindOfClass:[UITextView class]]) {
		UITextView *textView = (UITextView *)currentFirstResponder;
		objectLeftBottom.y += textView.contentOffset.y;
	}
    
	float shiftHeight = objectLeftBottom.y - currentKeyboardRect.origin.y;
    
	if (shiftHeight > 0) {
		[UIView animateWithDuration:[self objects].keyboardAnimationDutation
		                 animations: ^{
                             CGRect newFrame = [self objects].observerView.frame;
                             newFrame.origin.y = [self objects].observerView.frame.origin.y - shiftHeight;
                             [self objects].observerView.frame = newFrame;
                         }];
	} else {
		[UIView animateWithDuration:[self objects].keyboardAnimationDutation
		                 animations: ^{
                             [self objects].observerView.frame = [self objects].originalViewFrame;
                         }];
	}
}

#pragma mark - private

+ (void)dodgeNewView:(UIView *)newView
{
	CGRect currentKeyboardRect = [[self objects].observerView convertRect:[self objects].keyboardFrame fromView:nil];
	CGPoint newObjectLeftBottom = [newView convertPoint:CGPointMake(0, newView.frame.size.height) toView:[self objects].observerView];
    
	//workaround for uitextview
	if ([newView isKindOfClass:[UITextView class]]) {
		UITextView *textView = (UITextView *)newView;
		newObjectLeftBottom.y += textView.contentOffset.y;
	}
    
	float newShiftHeight = newObjectLeftBottom.y - currentKeyboardRect.origin.y;
	CGRect newFrame = [self objects].observerView.frame;
    
	if (newFrame.origin.y - newShiftHeight < [self objects].originalViewFrame.origin.y) {
		[UIView animateWithDuration:[self objects].keyboardAnimationDutation
		                 animations: ^{
                             CGRect newFrame = [self objects].observerView.frame;
                             newFrame.origin.y -= newShiftHeight;
                             [self objects].observerView.frame = newFrame;
                         }];
	} else {
		[UIView animateWithDuration:[self objects].keyboardAnimationDutation
		                 animations: ^{
                             [self objects].observerView.frame = [self objects].originalViewFrame;
                         }];
	}
}

@end
