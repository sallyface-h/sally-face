//
//  CZqusetions.h
//  gusquestion
//
//  Created by 基 on 2025/8/7.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZqusetions : NSObject
@property(nonatomic,copy)NSString *answer;
@property(nonatomic,copy)NSString *icon;
@property(nonatomic,copy)NSArray *options;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)questionWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
