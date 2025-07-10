//
//  Dog.m
//  2025.7.10
//
//  Created by 基 on 2025/7/8.
//

#import "Dog.h"

@implementation Dog
-(void)eat{
    _weight=_weight+0.5;
    NSLog(@"吃完后的体重为：%.2f",_weight);
}
-(void)bark{
    NSLog(@"当前体重为：%.2fkg，速度为：%.2fkm/h，颜色为：%@，性别为：%@",_weight,_speed,_color,_sex);
}
-(void)run{
    _weight=_weight-0.5;
    NSLog(@"速度为：%.2fkm/h,跑完后的体重为：%.2fkg",_speed,_weight);
}
-(BOOL)compareColor:(Dog *)dog and:(Dog *)dog1{
    if(dog->_color==dog1->_color){
        return YES;
    }
    else{
        return NO;
    }
}
-(float)compareSpeed:(Dog *)dog and:(Dog *)dog1{
    return dog->_speed-dog1->_speed;
}
@end
