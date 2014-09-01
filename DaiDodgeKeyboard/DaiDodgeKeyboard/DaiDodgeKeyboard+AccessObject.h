//
//  DaiDodgeKeyboard+AccessObject.h
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/25.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiDodgeKeyboard.h"

#import <objc/runtime.h>

#import "DaiDodgeKeyboardObjects.h"

@interface DaiDodgeKeyboard (AccessObject)

+ (DaiDodgeKeyboardObjects *)objects;

@end
