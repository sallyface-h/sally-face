//
//  CZApp.m
//  APP
//
//  Created by 基 on 2025/8/23.
//

#import "CZApp.h"

@implementation CZApp
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self==[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)appWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
