//
//  ViewController.m
//  UItabldView
//
//  Created by 基 on 2025/8/11.
//

#import "ViewController.h"
#import "Group.h"
@interface ViewController ()<UITableViewDataSource>
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (nonatomic,strong)NSArray *group;

@end

@implementation ViewController
-(NSArray *)group{
    if(_group==nil){
        NSString *path=[[NSBundle mainBundle]pathForResource:@"car.plist" ofType:nil];
        NSArray *arrayDict= [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModel= [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            Group *model =[Group groupWithDict:dict];
            [arrayModel addObject:model];
        }
        _group=arrayModel;
    }
    return _group;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.group.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    Group *group=self.group[section];
    return group.car.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    Group *group=self.group[indexPath.section];
    NSString *brand= group.car[indexPath.row];
    UITableViewCell *cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:nil];
    cell.textLabel.text=brand;
    
    return cell;
}

- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    Group *group= self.group[section];
    return group.title;
}
- (NSString *)tableView:(UITableView *)tableView titleForFooterInSection:(NSInteger)section{
    Group *group=self.group[section];
    return group.desc;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource=self;
    self.tableView.sectionHeaderHeight = 30;
    self.tableView.sectionFooterHeight = 30;
}


@end
