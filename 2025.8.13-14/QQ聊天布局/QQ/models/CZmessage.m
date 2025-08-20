//
//  CZmessage.m
//  QQ
//
//  Created by 基 on 2025/8/18.
//

#import "CZmessage.h"

@implementation CZmessage
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self== [super init]) {
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)messageWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
