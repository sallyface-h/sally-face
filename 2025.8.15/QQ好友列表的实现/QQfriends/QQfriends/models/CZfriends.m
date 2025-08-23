//
//  CZfriends.m
//  QQfriends
//
//  Created by 基 on 2025/8/21.
//

#import "CZfriends.h"

@implementation CZfriends
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self==[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)friendsWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
