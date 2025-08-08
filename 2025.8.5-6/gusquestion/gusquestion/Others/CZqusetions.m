//
//  CZqusetions.m
//  gusquestion
//
//  Created by 基 on 2025/8/7.
//

#import "CZqusetions.h"

@implementation CZqusetions
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self==[super init]) {
        self.answer=dict[@"answer"];
        self.icon=dict[@"icon"];
        self.options=dict[@"options"];
    }
    return self;
}
+(instancetype)questionWithDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict];
}

@end
