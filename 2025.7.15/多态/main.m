//
//  main.m
//  2025.7.13
//
//  Created by 基 on 2025/7/13.
//

#import <Foundation/Foundation.h>
#import "Animal.h"
#import "Dog.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Animal *a = [Animal new];
        [a run];
        Animal *a1 = [Dog new];
        [a1 run];
        [(Dog *)a1 eat];
    }
    return 0;
}
