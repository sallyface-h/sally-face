//
//  Person.h
//  2025.7.11
//
//  Created by 基 on 2025/7/12.
//

#import <Foundation/Foundation.h>
#import "Gun.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject{
    @public
    NSString *_name;
}
-(void)fireByGun:(Gun *)gun;
@end

NS_ASSUME_NONNULL_END
