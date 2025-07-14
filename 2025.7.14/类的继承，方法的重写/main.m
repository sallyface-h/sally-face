//
//  main.m
//  2025.7.14
//
//  Created by 基 on 2025/7/11.
//

#import <Foundation/Foundation.h>
#import "Person.h"
#import "Kid.h"
int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p=[Person new];
        [p run];
        [Person run];
        NSLog(@"************");
        Kid *k= [Kid new];
        [k run];
        [Kid run];
    }
    return 0;
}
