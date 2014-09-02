//
//  MainViewController.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/25.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"

#import "DaiDodgeKeyboard.h"

@interface MainViewController ()

@end

@implementation MainViewController

#pragma mark - ibaction

- (IBAction)alertAction:(id)sender
{
    BlockAlertView *alert = [BlockAlertView alertWithTitle:@"Alert Title" message:@"This is a very long message, designed just to show you how smart this class is"];
    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:alert.view];
    [alert setCancelButtonWithTitle:@"Cancel" block:^{
        [DaiDodgeKeyboard removeRegisterTheViewNeedDodgeKeyboard];
    }];
    [alert setDestructiveButtonWithTitle:@"Kill!" block:^{
        [DaiDodgeKeyboard removeRegisterTheViewNeedDodgeKeyboard];
    }];
    [alert show];
}

@end
