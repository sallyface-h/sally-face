//
//  CZweibo.h
//  weibo
//
//  Created by 基 on 2025/8/15.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZweibo : NSObject
@property (nonatomic,copy)NSString *text;
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *picture;
@property (nonatomic,assign,getter=isVip)BOOL Vip;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)weiboWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
