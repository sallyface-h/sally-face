//
//  ViewController.m
//  TomCat
//
//  Created by 基 on 2025/8/3.
//

#import "ViewController.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet UIImageView *imageViewCat;
- (IBAction)drink;
- (IBAction)knockout;
- (IBAction)angry;
- (IBAction)scratch;
- (IBAction)eat;
- (IBAction)pie;
- (IBAction)fart;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}


- (IBAction)fart {
    [self startAnimating:28 :@"fart" ];
}

- (IBAction)pie {
   [ self startAnimating:24 :@"pie"];
}

- (IBAction)eat {
    [self startAnimating:40 :@"eat"];
    
}

- (IBAction)scratch {
    [self startAnimating:56 :@"scratch"];
}

- (IBAction)angry {
    [self startAnimating:26 :@"angry"];
}

- (IBAction)knockout {
    [self startAnimating:81 :@"knockout"];
}

- (IBAction)drink {
    [self startAnimating:81 :@"drink"];
}

-(void)startAnimating:(int)count :(NSString *)picName{
    NSMutableArray *arrM = [NSMutableArray array];
    for (int i=0; i<count; i++) {
        NSString *image = [NSString stringWithFormat:@"%@_%02d.jpg",picName,i];
      //  UIImage *imageName = [UIImage imageNamed:image];
        NSString *path=  [[NSBundle mainBundle]pathForResource:image ofType:nil];
        UIImage *imageName= [UIImage imageWithContentsOfFile:path];
        [arrM addObject:imageName];
    }
    self.imageViewCat.animationImages=arrM;
    self.imageViewCat.animationDuration=arrM.count*0.1;
    self.imageViewCat.animationRepeatCount=1;
    [self.imageViewCat startAnimating];
    [self.imageViewCat performSelector:@selector(setAnimationImages:) withObject:nil afterDelay:arrM.count*0.1];
}
@end
