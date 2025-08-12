//
//  Group.m
//  UItabldView
//
//  Created by 基 on 2025/8/11.
//

#import "Group.h"

@implementation Group
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self==[super init]) {
        //self.title=dict[@"title"];
        //self.car=dict[@"car"];
        //self.decs=dict[@"decs"];
        [self setValuesForKeysWithDictionary:dict];
    }
    return self;
}
+(instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
