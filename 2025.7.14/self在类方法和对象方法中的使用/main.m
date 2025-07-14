//
//  main.m
//  2025.7.14
//
//  Created by 基 on 2025/7/14.
//

#import <Foundation/Foundation.h>
#import "Person.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [Person new];
        [p run];
        [Person run];
    }
    return 0;
}
