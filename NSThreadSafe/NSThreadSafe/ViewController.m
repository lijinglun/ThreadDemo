//
//  ViewController.m
//  NSThreadSafe
//
//  Created by lijinglun on 2019/6/11.
//  Copyright © 2019 lijinglun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,strong) NSThread *th1;
@property (nonatomic,strong) NSThread *th2;
@property (nonatomic,strong) NSThread *th3;

@property (nonatomic,assign) NSInteger tickets;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.tickets = 1000;
    
    self.th1 = [[NSThread alloc]initWithTarget:self selector:@selector(sellTickrts) object:@"th1"];
    self.th1.name = @"小丽";
    
    self.th2 = [[NSThread alloc]initWithTarget:self selector:@selector(sellTickrts) object:@"th2"];
    self.th2.name = @"小张";
    
    self.th3 = [[NSThread alloc]initWithTarget:self selector:@selector(sellTickrts) object:@"th3"];
    self.th3.name = @"小明";
    
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.th1 start];
    [self.th2 start];
    [self.th3 start];
}
- (void)sellTickrts{
    while (self.tickets > 0) {
        //token 锁对象 锁对象是同一个 是唯一的
        @synchronized (self) {
            NSInteger currentTickets = self.tickets;
            if (currentTickets>0) {
                NSLog(@"%@卖了一张票,还剩%ld张票",[NSThread currentThread].name,--self.tickets);
            }else{
                NSLog(@"票已售完!!!");
            }
        }
    }
}

@end
