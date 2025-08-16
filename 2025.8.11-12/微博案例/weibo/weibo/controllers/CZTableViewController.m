//
//  CZTableViewController.m
//  weibo
//
//  Created by 基 on 2025/8/15.
//

#import "CZTableViewController.h"
#import "CZweibo.h"
#import "CZweiboCell.h"
#import "CZweiboFrame.h"
@interface CZTableViewController ()
@property (nonatomic,strong)NSArray *weiboFrame;
@end

@implementation CZTableViewController
-(NSArray *)weiboFrame{
    if (_weiboFrame==nil) {
        NSString *path=[[NSBundle mainBundle]pathForResource:@"weibo.plist" ofType:nil];
        NSArray *arrayDict=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel=[NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZweibo *model= [CZweibo weiboWithDict:dict];
            CZweiboFrame *modelFrame= [[CZweiboFrame alloc]init];
            modelFrame.weibo=model;
            [arrayModel addObject:modelFrame];
        }
        _weiboFrame=arrayModel;
    }
    return _weiboFrame;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    
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
    return self.weiboFrame.count;
}


- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    CZweiboFrame *model=self.weiboFrame[indexPath.row];
    CZweiboCell *cell=[CZweiboCell weiboCellWithTableVIew:tableView];
    cell.weiboFrame=model;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZweiboFrame *weiboFrame=self.weiboFrame[indexPath.row];
    return weiboFrame.rowHeight;
    
}



@end
