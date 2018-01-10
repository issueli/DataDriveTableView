//
//  DDTableView.m
//  DataDriveTableViewDemo
//
//  Created by liyi on 2018/1/10.
//  Copyright © 2018年 issueli. All rights reserved.
//

#import "DDTableView.h"
@interface DDTableView() <UITableViewDelegate, UITableViewDataSource>
@end

@implementation DDTableView

#pragma mark - init
- (instancetype)init {
    
    if (self = [super init]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithFrame:(CGRect)frame {
    
    if (self = [super initWithFrame:frame]) {
        [self setup];
    }
    return self;
}
- (instancetype)initWithCoder:(NSCoder *)aDecoder {
    
    if (self = [super initWithCoder:aDecoder]) {
        [self setup];
    }
    return self;
}

- (void)setup {
    
    self.delegate = self;
    self.dataSource = self;
    
    DDSectionItem *section = [[DDSectionItem alloc] init];
    section.cellItems = @[[DDCellItem new]];
    self.dataSourceItems = @[section];
}

#pragma mark - Setter
- (void)setDataSourceItems:(NSArray<DDSectionItem *> *)dataSourceItems {
    _dataSourceItems = dataSourceItems;
    [dataSourceItems enumerateObjectsUsingBlock:^(DDSectionItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
        
        [obj.cellItems enumerateObjectsUsingBlock:^(DDCellItem * _Nonnull obj, NSUInteger idx, BOOL * _Nonnull stop) {
            
            if (obj.cellNibName) {
                UINib *nib = [UINib nibWithNibName:obj.cellNibName bundle:nil];
                [self registerNib:nib forCellReuseIdentifier:obj.reuseID];
            } else {
                [self registerClass:NSClassFromString(obj.cellClassName) forCellReuseIdentifier:obj.reuseID];
            }
        }];
    }];
    [self reloadData];
}

#pragma mark - UITableViewDelegate
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    return self.dataSourceItems[section].headerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForHeaderInSection:(NSInteger)section {
    return self.dataSourceItems[section].headerHeight;
}
- (UIView *)tableView:(UITableView *)tableView viewForFooterInSection:(NSInteger)section {
    return self.dataSourceItems[section].footerView;
}
- (CGFloat)tableView:(UITableView *)tableView heightForFooterInSection:(NSInteger)section {
    return self.dataSourceItems[section].footerHeight;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath {
    return self.dataSourceItems[indexPath.section].cellItems[indexPath.row].height;
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCellItem *cellItem = self.dataSourceItems[indexPath.section].cellItems[indexPath.row];
    return cellItem.canEdit;
}
- (NSString *)tableView:(UITableView *)tableView titleForDeleteConfirmationButtonForRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCellItem *cellItem = self.dataSourceItems[indexPath.section].cellItems[indexPath.row];
    return cellItem.editButtonTitle;
}
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCellItem *cellItem = self.dataSourceItems[indexPath.section].cellItems[indexPath.row];
    if (cellItem.editButtonClicked) {
        cellItem.editButtonClicked(indexPath);
    }
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCellItem *cellItem = self.dataSourceItems[indexPath.section].cellItems[indexPath.row];
    if (cellItem.didSelected) {
        cellItem.didSelected(indexPath);
    }
}
- (void)tableView:(UITableView *)tableView didDeselectRowAtIndexPath:(NSIndexPath *)indexPath {
    DDCellItem *cellItem = self.dataSourceItems[indexPath.section].cellItems[indexPath.row];
    if (cellItem.didDeselected) {
        cellItem.didDeselected(indexPath);
    }
}

#pragma mark - UITableViewDataSource
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.dataSourceItems.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.dataSourceItems[section].cellItems.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    
    DDCellItem *cellItem = self.dataSourceItems[indexPath.section].cellItems[indexPath.row];
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellItem.reuseID forIndexPath:indexPath];
    [cell dd_configWithItem:cellItem];
    return cell;
}
@end
