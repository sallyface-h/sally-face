//
//  main.m
//  2025.7.15
//
//  Created by 基 on 2025/7/14.
//

#import <Foundation/Foundation.h>
#import "Rewrite.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Rewrite *r = [Rewrite new];
        r->_age=11;
        r->_weight=45;
        NSLog(@"%@",r);
    }
    return 0;
}
