//
//  main.m
//  runtimeTest
//
//  Created by lonlife on 2019/3/15.
//

#import <Foundation/Foundation.h>
#import "objc-runtime.h"

// 把一个十进制的数转为二进制
NSString * binaryWithInteger(NSUInteger decInt){
    NSString *string = @"";
    NSUInteger x = decInt;
    while(x > 0){
        string = [[NSString stringWithFormat:@"%lu",x&1] stringByAppendingString:string];
        x = x >> 1;
    }
    return string;
}

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        // insert code here...
//        NSObject *object = [[NSObject alloc] init];
//        NSLog(@"Hello, World!");
        // 把对象转为objc_object结构体
        struct objc_object *object = (__bridge struct objc_object *)([NSObject new]);
        NSLog(@"binary = %@",binaryWithInteger(object->isa));
        // uintptr_t实际上就是unsigned long
        NSLog(@"binary = %@",binaryWithInteger((uintptr_t)[NSObject class]));
    }
    return 0;
}
