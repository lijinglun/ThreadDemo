//
//  ViewController.m
//  RunLoop
//
//  Created by lijinglun on 2019/6/12.
//  Copyright © 2019 lijinglun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    [self observer];
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self performSelector];
}
- (IBAction)buttonClick:(id)sender {
    NSLog(@"---btn---");
}
- (void)performSelector{
    [self performSelector:@selector(run) withObject:nil afterDelay:2.0 inModes:@[NSRunLoopCommonModes]];
}
-(void)observer{
    //如果给RunLoop添加观察者 需要CF类
    CFRunLoopObserverRef observer = CFRunLoopObserverCreateWithHandler(CFAllocatorGetDefault(), kCFRunLoopAllActivities, YES, 0, ^(CFRunLoopObserverRef observer, CFRunLoopActivity activity) {
        NSLog(@"---%lu---",activity);
    });
    CFRunLoopAddObserver(CFRunLoopGetCurrent(), observer, kCFRunLoopDefaultMode);
}
- (void)timer{
    //[NSTimer scheduledTimerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    NSTimer *timer = [NSTimer timerWithTimeInterval:2.0 target:self selector:@selector(run) userInfo:nil repeats:YES];
    //只应用于默认模式下
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:NSDefaultRunLoopMode];
    
    //[[NSRunLoop currentRunLoop] addTimer:timer forMode:UITrackingRunLoopMode];
    
    //NSRunLoopCommonModes = NSDefaultRunLoopMode + UITrackingRunLoopMode
    [[NSRunLoop currentRunLoop] addTimer:timer forMode:NSRunLoopCommonModes];
}
-(void)run{
    NSLog(@"---run---");
}
@end
