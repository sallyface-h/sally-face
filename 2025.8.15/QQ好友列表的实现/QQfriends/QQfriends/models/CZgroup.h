//
//  CZgroup.h
//  QQfriends
//
//  Created by 基 on 2025/8/21.
//

#import <Foundation/Foundation.h>
#import "CZfriends.h"
NS_ASSUME_NONNULL_BEGIN

@interface CZgroup : NSObject
@property (nonatomic,strong)NSArray *friends;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign)int online;
@property (nonatomic,assign,getter=isVisible)BOOL visible;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
