//
//  Student.h
//  2025.7.11
//
//  Created by 基 on 2025/7/14.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
typedef struct {
    int year;
    int month;
    int day;
}Date;
@interface Student : NSObject{
    @public
    Date _birthday;
}

@end

NS_ASSUME_NONNULL_END
