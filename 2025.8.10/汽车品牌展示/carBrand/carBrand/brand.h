//
//  brand.h
//  carBrand
//
//  Created by 基 on 2025/8/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface brand : NSObject
@property (nonatomic,copy)NSString *brand;
@property (nonatomic,copy)NSString *imageName;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)brandWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
