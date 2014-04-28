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

-(void) didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
}

#pragma mark - UITextViewDelegate

-(BOOL) textView : (UITextView*) textView shouldChangeTextInRange : (NSRange) range replacementText : (NSString*) text {
    if([text isEqualToString:@"\n"]){
        [textView resignFirstResponder];
        return NO;
    }else{
        return YES;
    }
}

#pragma mark - UITextFieldDelegate

-(BOOL) textFieldShouldReturn : (UITextField*) textField {
    [textField resignFirstResponder];
    return YES;
}

#pragma mark - life cycle

-(void) viewDidLoad {
    [super viewDidLoad];
    
    for (UIView *v in self.view.subviews) {
        if ([v isKindOfClass:[UITextField class]]) {
            [(UITextField*)v setDelegate:self];
        }
    }

    [DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self.view];
    
}

@end
