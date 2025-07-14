//
//  Kline.h
//  2025.7.12
//
//  Created by 基 on 2025/7/10.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Kline : NSObject{
    float _maxPrice;
    float _minPrice;
}
-(void)setMaxPrice:(float)maxPrice;
-(void)setMinPrice:(float)minPrice;
-(float)maxPrice;
-(float)minPrice;
-(float)averagePrice;

@end

NS_ASSUME_NONNULL_END
