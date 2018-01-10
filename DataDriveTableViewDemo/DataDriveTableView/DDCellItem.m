//
//  DDCellItem.m
//  DataDriveTableViewDemo
//
//  Created by liyi on 2018/1/10.
//  Copyright © 2018年 issueli. All rights reserved.
//

#import "DDCellItem.h"

@implementation DDCellItem

- (instancetype)init {
    
    if (self = [super init]) {
        
        self.height = 44.0f;
        self.cellClassName = NSStringFromClass([UITableViewCell class]);
        self.reuseID = NSStringFromClass([UITableViewCell class]);
        self.canEdit = NO;
    }
    return self;
}



@end
