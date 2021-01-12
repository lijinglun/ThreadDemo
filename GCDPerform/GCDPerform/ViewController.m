//
//  ViewController.m
//  GCDPerform
//
//  Created by lijinglun on 2019/6/11.
//  Copyright © 2019 lijinglun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,copy)NSString *url;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@property (nonatomic,assign)NSInteger count;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.count = 0;
    self.url = @"http://e.hiphotos.baidu.com/image/pic/item/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg";
    // Do any additional setup after loading the view.
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
//        //耗时操作
//        NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:self.url]];
//        UIImage *image = [UIImage imageWithData:data];
//        //回归主线程
//        dispatch_async(dispatch_get_main_queue(), ^{
//            self.iconImageView.image = image;
//        });
//    });
    [self group];
}
- (void)group{
    dispatch_group_t group = dispatch_group_create();
    dispatch_group_enter(group);
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        for (NSInteger i=0; i<100; i++) {
            NSLog(@"i=%ld",i);
            if (i==89) {
                self.count = i;
                dispatch_group_leave(group);
            }
        }
//    });
    dispatch_group_enter(group);
//    dispatch_group_async(group, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0), ^{
        if (self.count==89) {
            NSLog(@"count=%ld",self.count);
            self.count += 100;
            dispatch_group_leave(group);
        }
//    });
    dispatch_group_notify(group, dispatch_get_main_queue(), ^{
        NSLog(@"last count =%ld",self.count);
    });
}
@end
