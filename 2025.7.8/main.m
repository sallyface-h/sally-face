//
//  main.m
//  增强for
//
//  Created by 基 on 2025/7/8.
//

#import <Foundation/Foundation.h>

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //增强for
        NSArray *arr = @[@"one",@"two",@"three"];
        for(NSString *str in arr){
            NSLog(@"%@",str);
        }
        //Boolean
        Boolean flag = true;
        NSLog(@"%d",flag);
        //BOOL
        BOOL flag1 = NO;
        NSLog(@"%d",flag1);
        //异常捕捉
        @try {
            int result = 1/0;
        } @catch (NSException *exception) {
            
        } @finally {
            NSLog(@"结束");
        }
    }
    return 0;
}
