//
//  UITableViewCell+DDConfig.h
//  DataDriveTableViewDemo
//
//  Created by liyi on 2018/1/10.
//  Copyright © 2018年 issueli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDCellItem.h"
@interface UITableViewCell (DDConfig)

- (void)dd_configWithItem:(DDCellItem *)item;
@end
