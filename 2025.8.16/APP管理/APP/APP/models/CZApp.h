//
//  CZApp.h
//  APP
//
//  Created by 基 on 2025/8/23.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface CZApp : NSObject
@property (nonatomic,copy)NSString *name;
@property (nonatomic,copy)NSString *icon;
@property (nonatomic,copy)NSString *download;
@property (nonatomic,copy)NSString *size;
@property (nonatomic,assign)BOOL isdownLoaded;

-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)appWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
