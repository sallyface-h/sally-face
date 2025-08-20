//
//  ViewController.m
//  QQ
//
//  Created by 基 on 2025/8/17.
//

#import "ViewController.h"
#import "CZmessage.h"
#import "CZmessageFrame.h"
#import "CZmessageCell.h"
@interface ViewController ()<UITableViewDelegate,UITableViewDataSource,UITextFieldDelegate>
@property (nonatomic,strong)NSMutableArray *messageFrames;
@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property (weak, nonatomic) IBOutlet UITextField *textinput;


@end

@implementation ViewController
#pragma mark-懒加载
-(NSMutableArray *)messageFrames{
    if (_messageFrames==nil) {
        NSString *path= [[NSBundle mainBundle]pathForResource:@"message.plist" ofType:nil];
        NSArray *arrayDict= [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels= [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZmessage *model= [[CZmessage alloc]initWithDict:dict];
            CZmessage *lastMessage= (CZmessage *)[[arrayModels lastObject] message];
            if ([model.time isEqualToString:lastMessage.time]) {
                model.hideTime=YES;
            }else{
                model.hideTime=NO;
            }
            CZmessageFrame *modelFrame= [[CZmessageFrame alloc]init];
            modelFrame.message=model;
            
            [arrayModels addObject:modelFrame];
        }
        _messageFrames=arrayModels;
    }
    return _messageFrames;
}
#pragma mark-文本框代理方法
- (BOOL)textFieldShouldReturn:(UITextField *)textField{
    NSString *text=textField.text;
    [self sentMessage:text withtype:typeMe];
    textField.text=nil;
    return YES;
}
-(void)sentMessage:(NSString *)mes withtype:(messageType)type{
    CZmessage *model= [[CZmessage alloc]init];
    NSDate *nowDate= [NSDate date];
    NSDateFormatter *formatter= [[NSDateFormatter alloc]init];
    formatter.dateFormat=@"今天 HH:mm";
    model.text=mes;
    model.type=type;
    model.time= [formatter stringFromDate:nowDate];
    CZmessageFrame *modelFrame= [[CZmessageFrame alloc]init];
    modelFrame.message = model;
    CZmessageFrame *lastMessage= [self.messageFrames lastObject];
    NSString *lastTime= lastMessage.message.time;
    if ([model.time isEqualToString: lastTime]) {
        model.hideTime=YES;
    }
    [self.messageFrames addObject:modelFrame];
    [self.tableView reloadData];
    NSIndexPath *idxPath= [NSIndexPath indexPathForRow:self.messageFrames.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:idxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
}
#pragma mark-UItableView代理方法
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    [self.view endEditing:YES];
}
- (void)viewDidLoad {
    [super viewDidLoad];

    self.tableView.separatorStyle=UITableViewCellSeparatorStyleNone;
    self.tableView.backgroundColor= [UIColor colorWithRed:236/255.0 green:236/255.0 blue:236/255.0 alpha:1.0];
    self.tableView.allowsSelection=NO;
    
    UIView *leftVw= [[UIView alloc ]init];
    leftVw.frame=CGRectMake(0, 0, 5, 1);
    self.textinput.leftView=leftVw;
    self.textinput.leftViewMode=UITextFieldViewModeAlways;
    
    NSNotificationCenter *center = [NSNotificationCenter defaultCenter];
    [center addObserver:self selector:@selector(keyboardWillChangeFrame:) name:UIKeyboardWillChangeFrameNotification object:nil];
    
    
}
-(void)keyboardWillChangeFrame:(NSNotification *)noteInfo{
    NSLog(@"%@",noteInfo.userInfo);
    CGRect rectEnd=[noteInfo.userInfo[UIKeyboardFrameEndUserInfoKey] CGRectValue];
    CGFloat keyboardY=rectEnd.origin.y;
    NSLog(@"%f",keyboardY);
    CGFloat tranformValue= keyboardY-self.view.frame.size.height;
    NSLog(@"%f",tranformValue);
    self.view.transform= CGAffineTransformMakeTranslation(0, tranformValue);
    
    NSIndexPath *lastRowIdxPath= [NSIndexPath indexPathForRow:self.messageFrames.count-1 inSection:0];
    [self.tableView scrollToRowAtIndexPath:lastRowIdxPath atScrollPosition:UITableViewScrollPositionTop animated:YES];
 }
#pragma mark-数据源方法
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    return self.messageFrames.count;
}
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZmessageFrame *modelFrame=self.messageFrames[indexPath.row];
    CZmessageCell *cell = [CZmessageCell messageCellWithTableView:tableView];
    cell.messageFrame=modelFrame;
    return cell;
}
- (CGFloat)tableView:(UITableView *)tableView heightForRowAtIndexPath:(NSIndexPath *)indexPath{
    CZmessageFrame *messageFrame= self.messageFrames[indexPath.row];
    return messageFrame.rowHeight;
}
-(void)dealloc{
    [[NSNotificationCenter defaultCenter]removeObserver:self];
}
@end
