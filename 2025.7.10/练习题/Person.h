//
//  Person.h
//  2025.7.10
//
//  Created by 基 on 2025/7/9.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
NS_ASSUME_NONNULL_BEGIN

@interface Person : NSObject{
    NSString *_name;
    Dog *_dog;
}
-(void)feedDog:(Dog *)dog;
-(void)walkDog:(Dog *)dog;
@end

NS_ASSUME_NONNULL_END
