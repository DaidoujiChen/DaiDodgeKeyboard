//
//  MainViewController.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/4/25.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "MainViewController.h"

#import "DaiDodgeKeyboard.h"

@implementation UIView (FindFirstResponder)

- (UIView *)findFirstResponder
{
	if (self.isFirstResponder) return self;
	for (UIView *subView in self.subviews) {
		UIView *firstResponder = [subView findFirstResponder];
		if (firstResponder != nil) return firstResponder;
	}
	return nil;
}

@end

@interface MainViewController ()
@end

@implementation MainViewController

#pragma mark - UITextViewDelegate

- (BOOL)textView:(UITextView *)textView shouldChangeTextInRange:(NSRange)range replacementText:(NSString *)text
{
	if ([text isEqualToString:@"\n"]) {
		[textView resignFirstResponder];
		return NO;
	} else {
		return YES;
	}
}

#pragma mark - UITextFieldDelegate

- (BOOL)textFieldShouldReturn:(UITextField *)textField
{
	[textField resignFirstResponder];
	return YES;
}

#pragma mark - UITableViewDataSource

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return 50;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    static NSString *cellIdentifier = @"DodgeCell";
    DodgeCell *cell = [tableView dequeueReusableCellWithIdentifier:cellIdentifier forIndexPath:indexPath];
    if (indexPath.row%2) {
        cell.contentView.backgroundColor = [UIColor grayColor];
    } else {
        cell.contentView.backgroundColor = [UIColor whiteColor];
    }
    cell.cellTextField.delegate = self;
    return cell;
}

#pragma mark - UITableViewDelegate

- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath
{
    return 75.0f;
}

#pragma mark - UIScrollViewDelegate

- (void)scrollViewDidScroll:(UIScrollView *)scrollView
{
    UIView *firstResponderView = [self.view findFirstResponder];
    if (firstResponderView) {
        [firstResponderView resignFirstResponder];
    }
}

#pragma mark - life cycle

- (void)viewDidLoad
{
	[super viewDidLoad];
	[DaiDodgeKeyboard addRegisterTheViewNeedDodgeKeyboard:self.view];
    [self.dodgeTableView registerClass:[DodgeCell class] forCellReuseIdentifier:@"DodgeCell"];
}

@end
