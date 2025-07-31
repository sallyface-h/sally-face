//
//  ViewController.m
//  controlPicture
//
//  Created by 基 on 2025/7/31.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton * picyure;
- (IBAction)move:(UIButton *)sender;
- (IBAction)sizeChange:(UIButton *)sender;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)sizeChange:(UIButton *)sender {
    CGRect sizeFrame= self.picyure.frame;
    switch (sender.tag) {
        case 10:
            sizeFrame.size.width+=10;
            sizeFrame.size.height+=10;
            break;
        case 20:
            sizeFrame.size.width-=10;
            sizeFrame.size.height-=10;
            break;
        default:
            break;
    }
    self.picyure.frame=sizeFrame;
}

- (IBAction)move:(UIButton *)sender {
    CGRect originFrame= self.picyure.frame;
    switch (sender.tag) {
        case 10:
            originFrame.origin.y-=10;
            break;
        case 20:
            originFrame.origin.x+=10;
            break;
        case 30:
            originFrame.origin.y+=10;
            break;
        case 40:
            originFrame.origin.x-=10;
            break;
        default:
            break;
    }
    self.picyure.frame=originFrame;
}
@end
