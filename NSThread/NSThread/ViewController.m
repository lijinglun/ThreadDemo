//
//  ViewController.m
//  NSThread
//
//  Created by lijinglun on 2019/6/11.
//  Copyright © 2019 lijinglun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}
- (IBAction)buttonClicked:(id)sender {
   
    NSLog(@"main = %@", [NSThread mainThread]);
    
    [self createThread3];
}

- (void)createThread1{
    //创建一个线程
    NSThread * thread = [[NSThread alloc]initWithTarget:self selector:@selector(run:) object:@"abc"];
    //命名
    thread.name = @"myThread";
    //启动线程
    [thread start];
}
- (void)createThread2{
    [NSThread detachNewThreadSelector:@selector(run:) toTarget:self withObject:@"miss"];
}
- (void)createThread3{
    //开一个后台线程(子线程)
    [self performSelectorInBackground:@selector(run:) withObject:@"back"];
}
- (void)run:(id)obj{
    NSLog(@"run -- %@ --%@",[NSThread currentThread],obj);
    for (NSInteger i = 0; i < 100000; i++) {
        NSLog(@"i = %ld",i);
    }
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [NSThread detachNewThreadSelector:@selector(run1:) toTarget:self withObject:@"miss"];
}
- (void)run1:(id)obj{
    //线程休眠
    NSLog(@"---run---%@---%@",[NSThread currentThread],obj);
    //休眠方式1
    //[NSThread sleepForTimeInterval:2];
    //休眠方式2
    [NSThread sleepUntilDate:[NSDate dateWithTimeIntervalSinceNow:2]];
    NSLog(@"再次执行");
    
    //强制退出线程
    for (NSInteger i = 0; i < 100000; i++) {
        NSLog(@"i == %ld",i);
        if (i == 99) {
            //线程退出
            [NSThread exit];
        }
    }
}
@end
