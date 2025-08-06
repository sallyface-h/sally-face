//
//  CZAppView.m
//  xib1
//
//  Created by 基 on 2025/8/7.
//

#import "CZAppView.h"
#import "CZapp.h"
@interface CZAppView()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewIcon;
@property (weak, nonatomic) IBOutlet UILabel *name;
@property (weak, nonatomic) IBOutlet UIButton *downLoad;




@end
@implementation CZAppView
-(void)setModel:(CZapp *)model{
    _model=model;
    self.imageViewIcon.image= [UIImage imageNamed:model.icon];
    self.name.text=model.name;
    self.downLoad.backgroundColor = [UIColor greenColor];
    [self.downLoad addTarget:self action:@selector(downLoadClick:) forControlEvents:UIControlEventTouchUpInside];
}
-(void)downLoadClick:(UIButton *)sender{
    sender.enabled=NO;
    UILabel *lbl= [[UILabel alloc]init];
    lbl.text=@"正在下载";
    lbl.backgroundColor= [UIColor blackColor];
    CGFloat viewW=self.superview.frame.size.width;
    CGFloat viewH=self.superview.frame.size.height;
    CGFloat lblW=200;
    CGFloat lblH=30;
    CGFloat lblX= (viewW-lblW)*0.5;
    CGFloat lblY= (viewH-lblH)*0.5;
    lbl.frame=CGRectMake(lblX, lblY, lblW, lblH);
    lbl.textColor= [UIColor redColor];
    lbl.textAlignment=NSTextAlignmentCenter;
    lbl.font= [UIFont boldSystemFontOfSize:17];
    lbl.alpha=0;
    lbl.layer.cornerRadius=10;
    lbl.layer.masksToBounds=YES;
    [UIView animateWithDuration:1.5 animations:^{
            lbl.alpha=0.7;
        } completion:^(BOOL finished){
            if (finished) {
                [UIView animateWithDuration:1.5 delay:1 options:UIViewAnimationOptionCurveLinear animations:^{
                                    lbl.alpha=0;
                                } completion:^(BOOL finished) {
                                    [lbl removeFromSuperview];
                                }];
            }
        }];

    [self.superview addSubview:lbl];
}
@end
