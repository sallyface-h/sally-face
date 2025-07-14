//
//  main.m
//  2025.7.11
//
//  Created by 基 on 2025/7/14.
//

#import <Foundation/Foundation.h>
#import "Student.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Student *s= [Student new];
        s->_birthday = (Date){2000,7,7};
        NSLog(@"%d,%d,%d",s->_birthday.year,s->_birthday.month,s->_birthday.day);
    }
    return 0;
}
