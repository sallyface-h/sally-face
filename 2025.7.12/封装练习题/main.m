//
//  main.m
//  2025.7.12
//
//  Created by 基 on 2025/7/10.
//

#import <Foundation/Foundation.h>
#import "Kline.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Kline *k =[Kline new];
        [k setMaxPrice:32.2];
        [k setMinPrice:11.4];
        NSLog(@"平均价格为：%f",[k averagePrice]);
    }
    return 0;
}
