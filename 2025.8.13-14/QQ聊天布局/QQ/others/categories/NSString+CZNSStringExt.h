//
//  NSString+CZNSStringExt.h
//  QQ
//
//  Created by 基 on 2025/8/19.
//

#import <Foundation/Foundation.h>
#import "UIKit/UIKit.h"
NS_ASSUME_NONNULL_BEGIN

@interface NSString (CZNSStringExt)
-(CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font;
+(CGSize)sizeWitehText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font;
@end

NS_ASSUME_NONNULL_END
