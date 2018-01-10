//
//  DDCellItem.h
//  DataDriveTableViewDemo
//
//  Created by liyi on 2018/1/10.
//  Copyright © 2018年 issueli. All rights reserved.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

typedef void(^HXBaseCellSelectedBlock)(NSIndexPath *indexPath);
typedef void(^HXCustomUIControlHandleBlock)(NSIndexPath *indexPath, UIControl *control);
typedef void(^HXEditButtonHandleBlock)(NSIndexPath *indexPath);


@interface DDCellItem : NSObject

// 使用nib传入nib， 使用class注册传入class
@property (copy, nonatomic) NSString *cellNibName;
@property (copy, nonatomic) NSString *cellClassName;
@property (strong, nonatomic) NSObject *model;

@property (copy, nonatomic) NSString *reuseID;
@property (assign, nonatomic) CGFloat height;
@property (strong, nonatomic) NSIndexPath *indexPath;

@property (assign, nonatomic) BOOL canEdit;
@property (copy, nonatomic) NSString *editButtonTitle;
@property (copy, nonatomic) HXEditButtonHandleBlock editButtonClicked;

@property (copy, nonatomic) HXBaseCellSelectedBlock didSelected;
@property (copy, nonatomic) HXBaseCellSelectedBlock didDeselected;
@property (copy, nonatomic) HXCustomUIControlHandleBlock customUIControlHandle;
@end
