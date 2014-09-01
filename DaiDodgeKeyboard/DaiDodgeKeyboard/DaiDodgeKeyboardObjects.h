//
//  DaiDodgeKeyboardObjects.h
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/9/1.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface DaiDodgeKeyboardObjects : NSObject

@property (nonatomic, strong) UIView *observerView;
@property (nonatomic, strong) UIWindow *textEffectsWindow;
@property (nonatomic, strong) UIView *firstResponderView;
@property (nonatomic, assign) CGRect originalViewFrame;
@property (nonatomic, assign) CGRect keyboardFrame;
@property (nonatomic, assign) CGFloat shiftHeight;
@property (nonatomic, assign) double keyboardAnimationDutation;
@property (nonatomic, assign) BOOL isKeyboardShow;

@end
