//
//  group.h
//  carBrand
//
//  Created by 基 on 2025/8/13.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface group : NSObject
@property (nonatomic,copy)NSArray *cars;
@property (nonatomic,copy)NSString *firstLetter;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
