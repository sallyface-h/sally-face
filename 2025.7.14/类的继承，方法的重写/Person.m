//
//  Person.m
//  2025.7.14
//
//  Created by 基 on 2025/7/11.
//

#import "Person.h"

@implementation Person
-(void)run{
    NSLog(@"人在跑道上跑");
    [self eat];
}
+(void)run{
    NSLog(@"人在公路上跑");
    [self eat];
}
-(void)eat{
    NSLog(@"人吃了鸡蛋");
}
+(void)eat{
    NSLog(@"人吃了油条");
}

@end
