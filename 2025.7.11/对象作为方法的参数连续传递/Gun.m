//
//  Gun.m
//  2025.7.11
//
//  Created by 基 on 2025/7/12.
//

#import "Gun.h"
#import "Person.h"
@implementation Gun
-(void)shoot{
    if (_bulletCount>0){
        _bulletCount--;
    NSLog(@"%@正在射击，剩余子弹量为%d",_size,_bulletCount);
    } else {
        NSLog(@"子弹已用尽");
    }
}
@end
