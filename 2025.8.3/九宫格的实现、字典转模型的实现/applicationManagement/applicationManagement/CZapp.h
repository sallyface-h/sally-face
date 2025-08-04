//
//  CZapp.h
//  applicationManagement
//
//  Created by 基 on 2025/8/5.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZapp : NSObject
@property (nonatomic,strong)NSString *icon;
@property (nonatomic,strong)NSString *name;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appWithIDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
