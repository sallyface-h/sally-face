//
//  ViewController.m
//  qqLogIn
//
//  Created by 基 on 2025/7/31.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)logIn;
@property (weak, nonatomic) IBOutlet UITextField *password;
@property (weak, nonatomic) IBOutlet UITextField *QQ;


@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}



- (IBAction)logIn {
    NSString *qq=self.QQ.text;
    NSString *mm=self.password.text;
    NSLog(@"QQ:%@,密码:%@",qq,mm);
    [self.view endEditing:YES];
}
@end
