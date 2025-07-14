//
//  Kline.m
//  2025.7.12
//
//  Created by 基 on 2025/7/10.
//

#import "Kline.h"

@implementation Kline
-(void)setMaxPrice:(float)maxPrice{
    _maxPrice=maxPrice;
}
-(void)setMinPrice:(float)minPrice{
    _minPrice=minPrice;
}
-(float)maxPrice{
    return _maxPrice;
}
-(float)minPrice{
    return _minPrice;
}
-(float)averagePrice{
    float _averagePrice=(_maxPrice+_minPrice)/2;
    return _averagePrice;
}
@end
