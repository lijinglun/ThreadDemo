//
//  ViewController.m
//  GCD
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
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[self concurrentSync];
    //[self concurrentaSync];
    //[self globalSync];
    //[self globalaSync];
    //[self serialSync];
    [self serialaSync];
    //[self mainSync];
    //[self mainaSync];
}
/**
 *主队列+异步任务 没有开启新的线程 任务是逐个执行的
 */
- (void)mainaSync{
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    //异步任务
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
/**
 *主队列+同步任务 会造成死锁的线程 切记 不能在主队列添加同步任务
 */
- (void)mainSync{
    //获取主队列
    dispatch_queue_t queue = dispatch_get_main_queue();
    //同步任务
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
/**
 * 串行队列+异步任务 开启新的线程 任务是逐个执行的
 */
-(void)serialaSync{
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
    //异步任务
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
/**
 * 串行队列+同步任务 没有开启新的线程 任务是逐个执行的
 */
-(void)serialSync{
    //创建串行队列
    dispatch_queue_t queue = dispatch_queue_create("queue", NULL);
    //同步任务
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
/**
 * 全局队列+同步任务 启新的线程 任务是并发的
 */
- (void)globalaSync{
    //获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //异步任务
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
/**
 * 全局队列+同步任务 没有开启新的线程 任务是逐个执行的
 */
- (void)globalSync{
    //获取全局队列
    dispatch_queue_t queue = dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);
    //同步任务
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
/**
 *并发队列+异步任务 开启新的线程 任务是并发的
 */
- (void)concurrentaSync{
    dispatch_queue_t queue = dispatch_queue_create("queue", DISPATCH_QUEUE_CONCURRENT);
    //异步任务
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_async(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
/**
 *并发队列+同步任务 没有开启新的线程 任务是逐个执行的
 */
- (void)concurrentSync{
    //创建并发队列
    dispatch_queue_t queue = dispatch_queue_create("myQueue", DISPATCH_QUEUE_CONCURRENT);
    //在队列里面添加任务
    //同步任务
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---1---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---2---%@",[NSThread currentThread]);
        }
    });
    dispatch_sync(queue, ^{
        for (NSInteger i = 0 ; i < 5; i++) {
            NSLog(@"---3---%@",[NSThread currentThread]);
        }
    });
}
@end
