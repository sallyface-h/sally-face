//
//  ViewController.m
//  image browser
//
//  Created by 基 on 2025/8/2.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong)NSArray *pic;
@property (nonatomic,assign)int index;
- (IBAction)next;
@property (weak, nonatomic) IBOutlet UILabel *iblIndex;
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *lblTitle;

@property (weak, nonatomic) IBOutlet UIButton *binnext;
- (IBAction)last;
@property (weak, nonatomic) IBOutlet UIButton *binlast;

@end

@implementation ViewController
- (IBAction)next {
    self.index++;
    [self setDate];

}

-(NSArray *)pic{
    if (_pic==nil) {
        NSString *path= [[NSBundle mainBundle]pathForResource:@"pic.plist" ofType:nil];
        NSArray *array = [NSArray arrayWithContentsOfFile:path];
        _pic=array;
    }
    return _pic;
}
- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    _index=0;
    [self setDate];
}


- (IBAction)last {
    self.index--;
    [self setDate];
}
-(void)setDate{
    NSDictionary *dic= self.pic[self.index];
    self.iblIndex.text= [NSString stringWithFormat:@"%d/%ld",self.index+1,self.pic.count];
    self.imageViewIcon.image= [UIImage imageNamed:dic[@"icon"]];
    self.lblTitle.text= dic[@"title"];
    self.binlast.enabled=(self.index!=0);
    self.binnext.enabled=(self.index!=self.pic.count-1);
}

@end
