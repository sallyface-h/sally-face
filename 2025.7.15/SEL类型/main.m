//
//  main.m
//  sel
//
//  Created by 基 on 2025/7/14.
//

#import <Foundation/Foundation.h>
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p = [Person new];
        [p test];
        SEL s = @selector(test);
        [p performSelector:s];
    }
    return 0;
}
