//
//  ViewController.m
//  UIScrollView
//
//  Created by 基 on 2025/8/9.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIImageView *imageView;



@end

@implementation ViewController
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    NSLog(@"即将开始拖拽");
}
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    NSString *point =NSStringFromCGPoint(scrollView.contentOffset);
    NSLog(@"%@",point);
}
-(void)scrollViewDidEndDragging:(UIScrollView *)scrollView willDecelerate:(BOOL)decelerate{
    NSLog(@"停止拖拽");
}
- (void)viewDidLoad {
    [super viewDidLoad];
    CGFloat maxH= CGRectGetMaxY(self.imageView.frame);
    self.scrollView.contentSize=CGSizeMake(0, maxH);
    self.scrollView.contentOffset=CGPointMake(0, -74);
    self.scrollView.contentInset=UIEdgeInsetsMake(74, 0, 44, 0);
    self.scrollView.delegate=self;

}


@end
