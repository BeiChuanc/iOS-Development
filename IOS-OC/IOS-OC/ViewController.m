//
//  ViewController.m
//  IOS-OC
//
//  Created by 北川 on 2025/2/28.
//

#import "ViewController.h"
#import <Foundation/Foundation.h>

// MARK: Test data.
@interface ViewController ()

@end

@implementation ViewController

// 基础数据类型（数组、字典）
int i = 10;         // 整型

float f = 20.0;     // 浮点

double d = 20.0;    // 双浮点

bool b = YES;       // 布尔类型

char const c = 'a'; // 单字符

NSString *myString = @"hello word!"; // 不可变字符
NSMutableString *myString1 = nil;
//NSMutableString *myMutableString = [NSMutableString stringWithString: myString]; // 非编译时常量在编译外调用会报错

int arr[];

// 指针



// 枚举、结构体
enum { // 周一到周天
    Mon,
    TUe,
    Wed,
    Tur,
    Fri,
    Sta,
    Sun
} day; // 无名称的匿名枚举

// 类声明、类实现、普通方法

// 类方法、实例方法

// RunLoop、RunTime、GCD

- (void)viewDidLoad {
    [super viewDidLoad];
    
    @autoreleasepool {
        myString1 = [NSMutableString stringWithString: myString]; // 可变字符串赋值正确方式
    }
}

- (NSString *) getDay:(int)day {
    switch (day) {
        case 1:
            return @"This is Monday";
            break;
        case 2:
            return @"This is Tuesday";
            break;
        case 3:
            return @"This is Wednesday";
            break;
        case 4:
            return @"This is Thursday";
            break;
        case 5:
            return @"This is Friday";
            break;
        case 6:
            return @"This is Saturday";
            break;
        case 7:
            return @"This is Sunday";
            break;
        default:
            break;
    }
    return @"Other";
};

@end
