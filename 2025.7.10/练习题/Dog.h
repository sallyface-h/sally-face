//
//  Dog.h
//  2025.7.10
//
//  Created by 基 on 2025/7/8.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN

@interface Dog : NSObject{
    @public
    NSString *_color;
    NSString *_sex;
    float _speed;
    float _weight;
}
-(void)eat;
-(void)bark;
-(void)run;
-(BOOL)compareColor:(Dog *)dog1 and:(Dog *)dog2;
-(float)compareSpeed:(Dog *)dog1 and:(Dog *)dog2;
@end

NS_ASSUME_NONNULL_END
