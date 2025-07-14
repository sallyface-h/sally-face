//
//  Kid.m
//  2025.7.14
//
//  Created by 基 on 2025/7/11.
//

#import "Kid.h"

@implementation Kid
-(void)run{
    NSLog(@"小孩在跑道上跑");
    [self eat];
}
+(void)run{
    NSLog(@"小孩在公路上跑");
    [self eat];
}
-(void)eat{
    NSLog(@"小孩吃了鸡蛋");
}
+(void)eat{
    NSLog(@"小孩吃了油条");
}
@end
