//
//  DodgeCell.m
//  DaiDodgeKeyboard
//
//  Created by 啟倫 陳 on 2014/9/9.
//  Copyright (c) 2014年 ChilunChen. All rights reserved.
//

#import "DodgeCell.h"

@implementation DodgeCell

- (id)initWithStyle:(UITableViewCellStyle)style reuseIdentifier:(NSString *)reuseIdentifier
{
    self = [super initWithStyle:style reuseIdentifier:reuseIdentifier];
    if (self) {
        NSArray *topLevelObjects = [[NSBundle mainBundle] loadNibNamed:NSStringFromClass([self class]) owner:self options:nil];
        self = [topLevelObjects objectAtIndex:0];
    }
    return self;
}

@end
