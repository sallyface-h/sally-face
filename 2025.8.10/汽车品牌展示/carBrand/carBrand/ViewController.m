//
//  ViewController.m
//  carBrand
//
//  Created by 基 on 2025/8/13.
//

#import "ViewController.h"
#import "group.h"
#import "brand.h"
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (nonatomic,strong)NSArray* group;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic)UIAlertController *alert;
@end

@implementation ViewController
- (NSString *)tableView:(UITableView *)tableView titleForHeaderInSection:(NSInteger)section{
    group *group=self.group[section];
    return group.firstLetter;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return self.group.count;
}
- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    group *group=self.group[section];
    return group.cars.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    group *group=self.group[indexPath.section];
    brand *brand=group.cars[indexPath.row];
    static NSString *ID=@"brand_id";
    UITableViewCell *cell= [tableView dequeueReusableCellWithIdentifier:ID];
    if (cell==nil) {
         cell=[[UITableViewCell alloc]initWithStyle:UITableViewCellStyleDefault reuseIdentifier:ID];
    }
    cell.imageView.image=[UIImage imageNamed:brand.imageName];
    cell.textLabel.text=brand.brand;
    cell.accessoryType=UITableViewCellAccessoryDisclosureIndicator;
    return cell;
}
-(NSArray *)group{
    if (_group==nil) {
        NSString *path= [[NSBundle mainBundle]pathForResource:@"car.plist" ofType:nil];
        NSArray *arrayDict=[NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels=[NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            group *model= [group groupWithDict:dict];
            [arrayModels addObject:model];
        }
        _group=arrayModels;
    }
    return _group;
}
- (NSArray<NSString *> *)sectionIndexTitlesForTableView:(UITableView *)tableView{
    return [self.group valueForKey:@"firstLetter"];
}
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    NSIndexPath *selectedIndexPath = indexPath;
    group *currentGroup = self.group[indexPath.section];
    brand *currentBrand = currentGroup.cars[indexPath.row];
    UIAlertController *alert=[UIAlertController alertControllerWithTitle:@"编辑" message:@"请输入新的品牌名称" preferredStyle:UIAlertControllerStyleAlert];
    [alert addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        textField.text=currentBrand.brand;
        textField.keyboardType = UIKeyboardTypeDefault;
    
    }];
    [alert addAction:[UIAlertAction actionWithTitle:@"取消" style:UIAlertActionStyleCancel handler:nil]];
    [alert addAction:[UIAlertAction actionWithTitle:@"确认" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        UITextField *inputField = alert.textFields.firstObject;
        NSString *newBrandName = inputField.text;
        currentBrand.brand=newBrandName;
        [self.tableView reloadRowsAtIndexPaths:@[selectedIndexPath] withRowAnimation:UITableViewRowAnimationAutomatic];
    }]];
    [self presentViewController:alert animated:YES completion:nil];
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.tableView.dataSource=self;
    self.tableView.delegate=self;
    
}


@end
