//
//  main.m
//  lei
//
//  Created by 基 on 2025/7/2.
//

#import <Foundation/Foundation.h>

@interface Person : NSObject
{
    @public
    NSString *_name;
    NSString *_sex;
}
-(void)displayPerson:(Person *)person;
-(Person *)changePerson:(Person *)person;
@end

@implementation Person
-(void)displayPerson:(Person *)person
{
   NSLog(@"姓名：%@，性别：%@",person->_name,person->_sex);
}
-(Person *)changePerson:(Person *)person
{
    person->_name=@"刘德华";
    return person;
}
@end

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        Person *p=[Person new];
        Person *p1=[Person new];
        p1->_name=@"华哥";
        p1->_sex=@"男";
        [p displayPerson:p1];
        Person *p2=[p changePerson:p1];
        NSLog(@"姓名：%@，性别：%@",p2->_name,p2->_sex);
    }
    return 0;
}

