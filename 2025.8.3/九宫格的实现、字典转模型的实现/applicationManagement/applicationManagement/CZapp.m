//
//  CZapp.m
//  applicationManagement
//
//  Created by 基 on 2025/8/5.
//

#import "CZapp.h"

@implementation CZapp
-(instancetype)initWithDict:(NSDictionary *)dict{
    if (self=[super init]){
        self.name=dict[@"title"];
        self.icon=dict[@"icon"];
    }
    return  self;
}
+(instancetype)appWithIDict:(NSDictionary *)dict{
    return [[self alloc]initWithDict:dict ];
}
@end
