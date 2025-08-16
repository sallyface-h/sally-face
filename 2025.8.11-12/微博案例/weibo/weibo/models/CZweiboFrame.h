//
//  CZweiboFrame.h
//  weibo
//
//  Created by 基 on 2025/8/16.
//

#import <Foundation/Foundation.h>
#import <CoreGraphics/CoreGraphics.h>
#import <UIKit/UIKit.h>
#import "CZweibo.h"
@class CZweiboCell;

#define nameFont [UIFont systemFontOfSize:12]
#define textFont [UIFont systemFontOfSize:14]
NS_ASSUME_NONNULL_BEGIN

@interface CZweiboFrame : NSObject
@property (nonatomic,strong)CZweibo *weibo;
@property (nonatomic,assign,readonly)CGRect iconFrame;
@property (nonatomic,assign,readonly)CGRect pictureFrame;
@property (nonatomic,assign,readonly)CGRect vipFrame;
@property (nonatomic,assign,readonly)CGRect lblNameFrame;
@property (nonatomic,assign,readonly)CGRect lblTextFrame;
@property (nonatomic,assign,readonly)CGFloat rowHeight;
@end

NS_ASSUME_NONNULL_END
