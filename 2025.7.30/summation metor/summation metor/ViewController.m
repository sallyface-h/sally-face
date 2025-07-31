//
//  ViewController.m
//  summation metor
//
//  Created by 基 on 2025/7/30.
//

#import "ViewController.h"

@interface ViewController ()
- (IBAction)calculate;
@property (weak, nonatomic) IBOutlet UITextField *txt1;
@property (weak, nonatomic) IBOutlet UITextField *txt2;
@property (weak, nonatomic) IBOutlet UILabel *result;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)calculate {
    int n1= [self.txt1.text intValue];
    int n2= [self.txt2.text intValue];
    int result=n1+n2;
    self.result.text=[NSString stringWithFormat:@"%d",result];
    //[self.txt1 resignFirstResponder];
    //[self.txt2 resignFirstResponder];
    [self.view endEditing:YES];
}
@end
