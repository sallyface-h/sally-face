//
//  group.m
//  carBrand
//
//  Created by 基 on 2025/8/13.
//

#import "group.h"
#import "brand.h"
@implementation group
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self==[super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arrayModel=[NSMutableArray array];
        for (NSDictionary *item_dict in dict[@"cars"]) {
            brand *model=[brand brandWithDict:item_dict];
            [arrayModel addObject:model];
        }
        self.cars=arrayModel;
    }
    return self;
}
+(instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
