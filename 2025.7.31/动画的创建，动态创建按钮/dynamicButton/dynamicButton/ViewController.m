//
//  ViewController.m
//  dynamicButton
//
//  Created by 基 on 2025/8/1.
//

#import "ViewController.h"

@interface ViewController ()
@property (strong, nonatomic) IBOutlet UIButton *button;
-(IBAction)sizeChange:(UIButton *)sender;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.button = [[UIButton alloc]init];
    [self.button setTitle:@"点我" forState:UIControlStateNormal];
    [self.button setTitle:@"666" forState:UIControlStateHighlighted];
    UIImage *imageNormal= [UIImage imageNamed:@"bin-1"];
    UIImage *imageHighlighted= [UIImage imageNamed:@"bin-2"];
    [self.button setBackgroundImage:imageNormal forState:UIControlStateNormal];
    [self.button setBackgroundImage:imageHighlighted forState:UIControlStateHighlighted];
    self.button.frame=CGRectMake(100, 100, 100, 100);
    [self.button setTitleColor:[UIColor redColor] forState:UIControlStateNormal];
    [self.button setTitleColor:[UIColor blueColor] forState:UIControlStateHighlighted];
    [self.view addSubview:self.button];
    [self.button addTarget:self action:@selector(buttonclick) forControlEvents:UIControlEventTouchUpInside];
    
    UIButton *button1= [[UIButton alloc] init];
    UIButton *button2= [[UIButton alloc] init];
    UIImage *image1=[UIImage imageNamed:@"bin-3"];
    UIImage *image2= [UIImage imageNamed:@"bin-4"];
    [button1 setBackgroundImage:image1 forState:UIControlStateNormal];
    [button2 setBackgroundImage:image2 forState:UIControlStateNormal];
    button1.tag=10;
    button2.tag=20;
    button1.frame = CGRectMake(100, 220, 100, 100);
    button2.frame = CGRectMake(100, 340, 100, 100);
    [button1 addTarget:self action:@selector(sizeChange:) forControlEvents:UIControlEventTouchUpInside];
    [button2 addTarget:self action:@selector(sizeChange:) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:button1];
    [self.view addSubview:button2];
    
    
}
-(IBAction)sizeChange:(UIButton *)sender{
    CGRect currentFrame= self.button.frame;
    switch (sender.tag) {
        case 10:
            currentFrame.size.width+=10;
            currentFrame.size.height+=10;
            break;
        case 20:
            currentFrame.size.width-=10;
            currentFrame.size.height-=10;
            break;
        default:
            break;
    }
    [UIView animateWithDuration:0.5 animations:^{
            self.button.frame=currentFrame;
    }];
    
}
-(void)buttonclick{
    NSLog(@"按钮被点击了");
}

@end

