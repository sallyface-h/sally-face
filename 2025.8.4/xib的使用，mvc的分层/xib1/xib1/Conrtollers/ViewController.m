//
//  ViewController.m
//  applicationManagement
//
//  Created by 基 on 2025/8/4.
//

#import "ViewController.h"
#import "CZapp.h"
#import "CZAppView.h"
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
        NSBundle *mainBundle= [NSBundle mainBundle];
        CZAppView *appview = [[mainBundle loadNibNamed:@"CZ" owner:nil options:nil]firstObject];
        CZapp *appModels= self.apps[i];
        int colIdx=i%columns;
        int rowIdx=i/columns;
        CGFloat appX=marginWidth+colIdx*(appW+marginX);
        CGFloat appY=marginTop+rowIdx*(appH+marginY);
        appview.frame=CGRectMake(appX, appY, appW, appH);
        [self.view addSubview:appview];
        
        appview.model=appModels;
      
       
    }
    
}


@end
