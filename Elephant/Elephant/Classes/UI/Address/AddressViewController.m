//
//  AddressViewController.m
//  Elephant
//
//  Created by shen_h on 15/9/16.
//  Copyright (c) 2015年 YZQ. All rights reserved.
//

#import "AddressViewController.h"


@interface AddressViewController ()<UITableViewDataSource,UITableViewDelegate>
{
    
    UITableView *_tableView;
}
@property (nonatomic, strong) NSMutableArray *dataArray;

@end

@implementation AddressViewController

- (NSMutableArray *)dataArray
{
    if (!_dataArray) {
        _dataArray = [NSMutableArray arrayWithCapacity:10];
        for (int i = 0; i < 10; i ++) {
            [_dataArray addObject:[NSString stringWithFormat:@"%d",i]];
        }
    }
    return _dataArray;
}
- (void)viewDidLoad
{

    [super viewDidLoad];
    
    _tableView = [[UITableView alloc] initWithFrame:self.view.frame style:UITableViewStyleGrouped];
    _tableView.delegate = self;
    _tableView.dataSource = self;
    _tableView.estimatedRowHeight = 100;
    _tableView.rowHeight = UITableViewAutomaticDimension;
    
    [self.view addSubview:_tableView];

}

#pragma mark - tableView delegate
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    return self.dataArray.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"addressCell"];
    if (cell == nil) {
        cell = [[UITableViewCell alloc] initWithStyle:UITableViewCellStyleSubtitle reuseIdentifier:@"addressCell"];
    }
    return cell;
}

- (NSArray *)tableView:(UITableView *)tableView editActionsForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewRowAction *delet = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"删 除" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        [_dataArray removeObjectAtIndex:indexPath.row];
        [_tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationLeft];
        NSLog(@"click delet");
    }];
    delet.backgroundColor = [UIColor redColor];
    
    UITableViewRowAction *mark = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleDestructive title:@"标记未读" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        NSLog(@"click more");
        [_tableView setEditing:NO animated:YES];
    
    }];
    mark.backgroundColor = [UIColor greenColor];
    
    UITableViewRowAction *cancle = [UITableViewRowAction rowActionWithStyle:UITableViewRowActionStyleNormal title:@"取消" handler:^(UITableViewRowAction *action, NSIndexPath *indexPath) {
        
        NSLog(@"click cancle");
        [_tableView setEditing:NO animated:YES];
        
    }];
    cancle.backgroundColor = [UIColor grayColor];
    
    return @[delet,mark,cancle];
}

- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath
{
    
}
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    return YES;
}
@end
