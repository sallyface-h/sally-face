//
//  main.m
//  2025.7.11
//
//  Created by 基 on 2025/7/11.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Gun.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p= [Person new];
        p->_name=@"刘德华";
        Gun *g= [Gun new];
        g->_size=@"95式步枪";
        g->_bulletCount=3;
        [p fireByGun:g];
        [p fireByGun:g];
        [p fireByGun:g];
        [p fireByGun:g];
    }
    return 0;
}
