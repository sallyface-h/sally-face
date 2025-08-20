//
//  CZmessage.h
//  QQ
//
//  Created by 基 on 2025/8/18.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef enum {
    typeMe=0,
    typeOthers=1
}messageType;
@interface CZmessage : NSObject
@property (nonatomic,copy)NSString *time;
@property (nonatomic,copy)NSString *text;
@property (nonatomic,assign)messageType type;
@property (nonatomic,assign)BOOL hideTime;
-(instancetype)initWithDict:(NSDictionary *)dict;
+(instancetype)messageWithDict:(NSDictionary *)dict;
@end

NS_ASSUME_NONNULL_END

