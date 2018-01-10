//
//  DDTableView.h
//  DataDriveTableViewDemo
//
//  Created by liyi on 2018/1/10.
//  Copyright © 2018年 issueli. All rights reserved.
//

#import <UIKit/UIKit.h>
#import "DDSectionItem.h"
#import "DDCellItem.h"
#import "UITableViewCell+DDConfig.h"

@interface DDTableView : UITableView

@property (strong, nonatomic) NSArray<DDSectionItem *> *dataSourceItems;

@end
