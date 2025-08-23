//
//  CZfriends.h
//  QQfriends
//
//  Created by 基 on 2025/8/21.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZfriends : NSObject
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *intro;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,assign,getter=isVip)BOOL vip;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)friendsWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
