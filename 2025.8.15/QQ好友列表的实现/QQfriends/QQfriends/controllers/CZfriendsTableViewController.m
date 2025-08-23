//
//  CZfriendsTableViewController.m
//  QQfriends
//
//  Created by 基 on 2025/8/21.
//

#import "CZfriendsTableViewController.h"
#import "CZfriends.h"
#import "CZgroup.h"
#import "CZfriendsCell.h"
#import "CZGroupHeaderView.h"
@interface CZfriendsTableViewController ()<UITableViewDataSource,CZGroupHeaderViewDelegate>
@property (nonatomic,strong)NSArray *groups;
@end

@implementation CZfriendsTableViewController
#pragma mark - 懒加载数据
-(NSArray *)groups{
    if (_groups==nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"QQ.plist"ofType:nil];
        NSArray *arrayDict= [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels= [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZgroup *model= [CZgroup groupWithDict:dict];
            [arrayModels addObject:model];
        }
        _groups=arrayModels;
    }
    return _groups;
}
#pragma mark - 代理方法
-(void)groupHeaderViewClickTitleButton:(CZGroupHeaderView *)groupHeaderView{
    NSIndexSet *idxSet= [NSIndexSet indexSetWithIndex:groupHeaderView.tag];
    [self.tableView reloadSections:idxSet withRowAnimation:UITableViewRowAnimationFade];
   // [self.tableView reloadData];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - 数据源方法

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return self.groups.count;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    CZgroup *group= self.groups[section];
    if (group.isVisible) {
    return group.friends.count;
    }
    return 0;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CZgroup *group=self.groups[indexPath.section];
    CZfriends *friends=group.friends[indexPath.row];
    CZfriendsCell *cell= [CZfriendsCell friendsWithTableView:tableView];
    cell.friendModel=friends;
    return cell;
}
- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section{
    CZgroup *group=self.groups[section];
    CZGroupHeaderView *headerView= [CZGroupHeaderView groupHeaderViewWithTableView:tableView];
    headerView.group=group;
    headerView.tag=section;
    headerView.delegate=self;
    return headerView;
}

/*
// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the specified item to be editable.
    return YES;
}
*/

/*
// Override to support editing the table view.
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
    if (editingStyle == UITableViewCellEditingStyleDelete) {
        // Delete the row from the data source
        [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
    } else if (editingStyle == UITableViewCellEditingStyleInsert) {
        // Create a new instance of the appropriate class, insert it into the array, and add a new row to the table view
    }   
}
*/

/*
// Override to support rearranging the table view.
- (void)tableView:(UITableView *)tableView moveRowAtIndexPath:(NSIndexPath *)fromIndexPath toIndexPath:(NSIndexPath *)toIndexPath {
}
*/

/*
// Override to support conditional rearranging of the table view.
- (BOOL)tableView:(UITableView *)tableView canMoveRowAtIndexPath:(NSIndexPath *)indexPath {
    // Return NO if you do not want the item to be re-orderable.
    return YES;
}
*/

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
