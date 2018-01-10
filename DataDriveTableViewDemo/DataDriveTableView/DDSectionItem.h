//
//  DDSectionItem.h
//  DataDriveTableViewDemo
//
//  Created by liyi on 2018/1/10.
//  Copyright © 2018年 issueli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "DDCellItem.h"

@interface DDSectionItem : NSObject

@property (strong, nonatomic) NSArray <DDCellItem *> *cellItems;

@property (assign, nonatomic) CGFloat headerHeight;
@property (strong, nonatomic) UIView *headerView;

@property (assign, nonatomic) CGFloat footerHeight;
@property (strong, nonatomic) UIView *footerView;
@end
