//
//  NSString+CZNSStringExt.m
//  QQ
//
//  Created by 基 on 2025/8/19.
//

#import "NSString+CZNSStringExt.h"

@implementation NSString (CZNSStringExt)
-(CGSize)sizeOfTextWithMaxSize:(CGSize)maxSize font:(UIFont *)font{
    NSDictionary *attrs=@{NSFontAttributeName:font};
    return [self boundingRectWithSize:maxSize options:NSStringDrawingUsesLineFragmentOrigin attributes:attrs context:nil].size;
}
+(CGSize)sizeWitehText:(NSString *)text maxSize:(CGSize)maxSize font:(UIFont *)font{
    return [text sizeOfTextWithMaxSize:maxSize font:font];
}
@end
