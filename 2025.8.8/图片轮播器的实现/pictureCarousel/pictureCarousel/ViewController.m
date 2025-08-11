//
//  ViewController.m
//  pictureCarousel
//
//  Created by 基 on 2025/8/10.
//

#import "ViewController.h"

@interface ViewController ()<UIScrollViewDelegate>
@property (weak, nonatomic) IBOutlet UIScrollView *scrollView;
@property (weak, nonatomic) IBOutlet UIPageControl *pageControl;
@property (nonatomic,strong)NSTimer *timer;
@end

@implementation ViewController
-(void)scrollViewDidScroll:(UIScrollView *)scrollView{
    CGFloat imageW=scrollView.contentOffset.x;
    imageW=imageW+scrollView.frame.size.width*0.5;
    NSInteger page=imageW/scrollView.frame.size.width;
    self.pageControl.currentPage=page;
}
-(void)scrollViewWillBeginDragging:(UIScrollView *)scrollView{
    [self.timer invalidate];
    self.timer=nil;
}
-(void)scrollViewDidEndDecelerating:(UIScrollView *)scrollView{
    self.timer= [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop=[NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
- (void)viewDidLoad {
    [super viewDidLoad];
    self.scrollView.delegate=self;
    CGFloat imgY=43;
    CGFloat imgH=250;
    CGFloat imgW=[UIScreen mainScreen].bounds.size.width;
    NSLog(@"%f",imgW);
    for (int i=0; i<4; i++) {
        UIImageView *imageView=[[UIImageView alloc]init];
        NSString *imageName= [NSString stringWithFormat:@"bin_%02d",i];
        imageView.image = [UIImage imageNamed:imageName];
        CGFloat imgX=i*imgW;
        imageView.frame=CGRectMake(imgX, imgY, imgW, imgH);
        [self.scrollView addSubview:imageView];
    }
    CGFloat maxW=imgW*4;
    self.scrollView.contentSize=CGSizeMake(maxW, 0);
    self.scrollView.showsHorizontalScrollIndicator=NO;
    self.scrollView.pagingEnabled=YES;
    self.scrollView.bounces = NO;
    self.pageControl.numberOfPages=4;
    self.pageControl.currentPage=0;
    self.timer= [NSTimer scheduledTimerWithTimeInterval:2 target:self selector:@selector(scrollImage) userInfo:nil repeats:YES];
    NSRunLoop *runLoop=[NSRunLoop currentRunLoop];
    [runLoop addTimer:self.timer forMode:NSRunLoopCommonModes];
}
-(void)scrollImage{
    NSInteger page=self.pageControl.currentPage;
    if (page==self.pageControl.numberOfPages-1) {
        page=0;
    } else {
        page++;
    }
    CGFloat imageW=page*self.scrollView.frame.size.width;
    [self.scrollView setContentOffset:CGPointMake(imageW, 0) animated:YES];
}
@end
