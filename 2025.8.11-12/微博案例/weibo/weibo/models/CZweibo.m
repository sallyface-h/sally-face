//
//  CZweibo.m
//  weibo
//
//  Created by 基 on 2025/8/15.
//

#import "CZweibo.h"

@implementation CZweibo
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)weiboWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
