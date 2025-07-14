//
//  Gun.h
//  2025.7.11
//
//  Created by 基 on 2025/7/12.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Gun : NSObject{
    @public
    NSString *_size;
    int _bulletCount;
}
-(void)shoot;
@end

NS_ASSUME_NONNULL_END
