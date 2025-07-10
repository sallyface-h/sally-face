//
//  main.m
//  2025.7.10
//
//  Created by 基 on 2025/7/8.
//

#import <Foundation/Foundation.h>
#import "Dog.h"
#import "Person.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Dog *d=[Dog new];
        Dog *d1=[Dog new];
        d->_color=@"灰色";
        d->_speed=10.5f;
        d->_weight=33.5f;
        d->_sex=@"母";
        d1->_color=@"灰色";
        d1->_speed=14.5f;
        d1->_weight=45.5f;
        d1->_sex=@"公";
        [d bark];
        [d eat];
        [d run];
        [d bark];
        BOOL issame=[d compareColor:d and:d1];
        NSLog(@"issame=%d",issame);
        float suducha=[d compareSpeed:d and:d1];
        NSLog(@"速度相差%.2fkm/h",suducha);
        Person *p = [Person new];
        [p feedDog:d];
        [p walkDog:d];
        
    }
    return 0;
}
