//
//  Group.h
//  UItabldView
//
//  Created by 基 on 2025/8/11.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Group : NSObject
@property (nonatomic,strong)NSArray *car;
@property (nonatomic,strong)NSString *desc;
@property (nonatomic,strong)NSString *title;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)groupWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END
