//
//  ViewController.m
//  applicationManagement
//
//  Created by 基 on 2025/8/4.
//

#import "ViewController.h"
#import "CZapp.h"
@interface ViewController ()
@property (nonatomic,strong)NSArray *apps;
@end

@implementation ViewController
-(NSArray *)apps{
    if (_apps==nil) {
        NSString *path= [[NSBundle mainBundle]pathForResource:@"app.plist" ofType:nil];
        NSArray *arrayDict = [NSArray arrayWithContentsOfFile:path];
        NSMutableArray *arrayModels= [NSMutableArray array];
        for (NSDictionary *dict in arrayDict) {
            CZapp *model= [CZapp appWithIDict:dict];
            [arrayModels addObject:model];
        }
        _apps = arrayModels;
    }
    return _apps;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    int columns =3;
    CGFloat appW=90;
    CGFloat appH=90;
    CGFloat viewWidth = self.view.frame.size.width;
    CGFloat marginTop=90;
    CGFloat marginWidth=40;
    CGFloat marginX= (viewWidth-columns*appW)/(columns+1);
    CGFloat marginY=marginX;
    for (int i=0; i<self.apps.count; i++) {
        UIView *appview = [[UIView alloc]init];
        CZapp *appModels= self.apps[i];
        int colIdx=i%columns;
        int rowIdx=i/columns;
        CGFloat appX=marginWidth+colIdx*(appW+marginX);
        CGFloat appY=marginTop+rowIdx*(appH+marginY);
        appview.frame=CGRectMake(appX, appY, appW, appH);
        [self.view addSubview:appview];
        
        UIImageView *imageViewIcon= [[UIImageView alloc]init];
        CGFloat iconW=50;
        CGFloat iconH=50;
        CGFloat iconX=(appview.frame.size.width-iconW)*0.5;
        CGFloat iconY=0;
        imageViewIcon.frame=CGRectMake(iconX, iconY, iconW, iconH);
        [appview addSubview:imageViewIcon];
        imageViewIcon.image = [UIImage imageNamed:appModels.icon];
        UILabel *name = [[UILabel alloc]init];
        CGFloat nameW=appview.frame.size.width;
        CGFloat nameH=20;
        CGFloat nameX=0;
        CGFloat nameY=iconH;
        name.frame=CGRectMake(nameX, nameY, nameW, nameH);
        [appview addSubview:name];
        name.text=appModels.name;
        name.textAlignment=NSTextAlignmentCenter;
        UIButton *downLoad=[[UIButton alloc]init];
        downLoad.backgroundColor = [UIColor greenColor];
        CGFloat downLoadW=iconW;
        CGFloat downLoadH=20;
        CGFloat downLoadX=iconX;
        CGFloat downLoadY=CGRectGetMaxY(name.frame);
        downLoad.frame=CGRectMake(downLoadX, downLoadY, downLoadW, downLoadH);
        [appview addSubview:downLoad];
        downLoad.titleLabel.font= [UIFont systemFontOfSize:14];
        [downLoad setTitle:@"下载" forState:UIControlStateNormal];
        [downLoad setTitle:@"已安装" forState:UIControlStateDisabled];
        [downLoad addTarget:self action:@selector(downLoadClick:) forControlEvents:UIControlEventTouchUpInside];
    }
    
}
-(void)downLoadClick:(UIButton *)sender{
    NSLog(@"开始下载");
    sender.enabled = NO;
}

@end
