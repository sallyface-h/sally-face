//
//  CZAppTableViewController.m
//  APP
//
//  Created by 基 on 2025/8/23.
//

#import "CZAppTableViewController.h"
#import "CZAPP.h"
#import "CZAppCell.h"
@interface CZAppTableViewController ()<CZAppCellDelegate>
@property (nonatomic,strong)NSArray *apps;
@end

@implementation CZAppTableViewController
#pragma mark - 懒加载
-(NSArray *)apps{
    if (_apps==nil) {
        NSString *path= [[NSBundle mainBundle]pathForResource:@"APP.plist" ofType:nil];
        NSArray *arrayDict= [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels=[NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZApp *model= [CZApp appWithDict:dict];
            [arrayModels addObject:model];
        }
        _apps=arrayModels;
    }
    return _apps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.rowHeight=70;
    
    // Uncomment the following line to preserve selection between presentations.
    // self.clearsSelectionOnViewWillAppear = NO;
    
    // Uncomment the following line to display an Edit button in the navigation bar for this view controller.
    // self.navigationItem.rightBarButtonItem = self.editButtonItem;
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return 1;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.apps.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CZApp *app=self.apps[indexPath.row];
    static NSString *ID= @"app_ID";
    CZAppCell *cell = [tableView dequeueReusableCellWithIdentifier:ID forIndexPath:indexPath];
    cell.delegate=self;
    cell.apps=app;
    return cell;
}

#pragma mark -appCell代理方法
- (void)appCellDidClickDownLoadButton:(CZAppCell *)appCell{
    UILabel *label= [[UILabel alloc]init];
    label.text=@"正在下载";
    label.backgroundColor=[UIColor blackColor];
    label.textColor=[UIColor redColor];
    CGFloat labelW=200;
    CGFloat labelH=40;
    CGFloat labelX=(self.view.frame.size.width-labelW)*0.5;
    CGFloat labelY=(self.view.frame.size.height-labelH)*0.5;
    label.frame=CGRectMake(labelX, labelY, labelW, labelH);
    label.font = [UIFont systemFontOfSize:14];
    label.textAlignment= NSTextAlignmentCenter;
    label.alpha=0;
    label.layer.cornerRadius=5;
    label.layer.masksToBounds=YES;
    [UIView animateWithDuration:1 animations:^{
            label.alpha=0.6;
        } completion:^(BOOL finished) {
    [UIView animateWithDuration:1 animations:^{
            label.alpha=0;
        } completion:^(BOOL finished) {
            [label removeFromSuperview];
                }];
        }];
   // [self.view addSubview:label];
    UIWindow *currentWindow = self.view.window;
    [currentWindow addSubview:label];
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
