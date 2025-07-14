//
//  Person.m
//  2025.7.14
//
//  Created by 基 on 2025/7/14.
//

#import "Person.h"

@implementation Person
-(void)run{
    NSLog(@"人在跑道上走");
    [self eat];
}
-(void)eat{
    NSLog(@"吃油条");
}
+(void)run{
    NSLog(@"人在马路上走");
    [self eat];
}
+(void)eat{
    NSLog(@"吃西瓜");
}

@end
