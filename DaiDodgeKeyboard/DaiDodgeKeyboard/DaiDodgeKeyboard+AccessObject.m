//
//  DaiDodgeKeyboard+AccessObject.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/25.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DaiDodgeKeyboard+AccessObject.h"

@implementation DaiDodgeKeyboard (AccessObject)

+ (DaiDodgeKeyboardObjects *)objects
{
	if (!objc_getAssociatedObject(self, _cmd)) {
		objc_setAssociatedObject(self, _cmd, [DaiDodgeKeyboardObjects new], OBJC_ASSOCIATION_RETAIN_NONATOMIC);
	}
	return objc_getAssociatedObject(self, _cmd);
}

@end
