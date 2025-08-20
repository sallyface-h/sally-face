//
//  CZmessageFrame.h
//  QQ
//
//  Created by 基 on 2025/8/18.
//

#import <Foundation/Foundation.h>
@class CZmessage;
#define textFont [UIFont systemFontOfSize:14]
NS_ASSUME_NONNULL_BEGIN

@interface CZmessageFrame : NSObject
@property (nonatomic,strong)CZmessage *message;
@property (nonatomic,assign,readonly)CGRect iconFrame;
@property (nonatomic,assign,readonly)CGRect textFrame;
@property (nonatomic,assign,readonly)CGRect timeFrame;
@property (nonatomic,assign,readonly)CGFloat rowHeight;
@end

NS_ASSUME_NONNULL_END
