//
//  CZgroup.m
//  QQfriends
//
//  Created by 基 on 2025/8/21.
//

#import "CZgroup.h"

@implementation CZgroup
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self==[super init]) {
        [self setValuesForKeysWithDictionary:dict];
        NSMutableArray *arrayModels=[NSMutableArray array];
        for (NSDictionary *dict_sub in self.friends) {
            CZfriends *model= [CZfriends friendsWithDict:dict_sub];
            [arrayModels addObject:model];
        }
        self.friends=arrayModels;
    }
    return self;
}
+(instancetype)groupWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}
@end
