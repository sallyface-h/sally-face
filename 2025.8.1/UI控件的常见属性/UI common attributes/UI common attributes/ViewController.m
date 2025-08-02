//
//  ViewController.m
//  UI common attributes
//
//  Created by 基 on 2025/8/2.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIButton *button;
- (IBAction)move;
- (IBAction)rotate;
- (IBAction)zoom;
- (IBAction)reset;
- (IBAction)show1;
- (IBAction)show2;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)show2 {
    for (UIView *view in self.view.subviews) {
        view.backgroundColor= [UIColor blueColor];
    }
}

- (IBAction)show1 {
    self.button.superview.backgroundColor= [UIColor yellowColor];
}

- (IBAction)reset {
    self.button.transform=CGAffineTransformIdentity;
}

- (IBAction)zoom {
    [UIView animateWithDuration:2 animations:^{
        self.button.transform=CGAffineTransformScale(self.button.transform, 2, 2);
    }];
}
- (IBAction)rotate {
    [UIView animateWithDuration:2 animations:^{
            self.button.transform=CGAffineTransformRotate(self.button.transform, M_PI_4);
    }];

}

- (IBAction)move {
    [UIView animateWithDuration:2 animations:^{
            self.button.transform=CGAffineTransformTranslate(self.button.transform, 0, 50);
    }];
}
@end
