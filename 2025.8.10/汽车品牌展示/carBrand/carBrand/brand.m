//
//  brand.m
//  carBrand
//
//  Created by 基 on 2025/8/13.
//

#import "brand.h"

@implementation brand
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self==[super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)brandWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
