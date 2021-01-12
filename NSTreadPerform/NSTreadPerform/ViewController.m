//
//  ViewController.m
//  NSTreadPerform
//
//  Created by lijinglun on 2019/6/11.
//  Copyright © 2019 lijinglun. All rights reserved.
//

#import "ViewController.h"

@interface ViewController ()
@property (nonatomic,copy) NSString *url;
@property (weak, nonatomic) IBOutlet UIImageView *iconImageView;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.url = @"http://e.hiphotos.baidu.com/image/pic/item/4610b912c8fcc3cef70d70409845d688d53f20f7.jpg";
    // Do any additional setup after loading the view.
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
//    NSURL *url = [NSURL URLWithString:self.url];
//    NSDate *begin = [NSDate date];
//    NSData *data = [NSData dataWithContentsOfURL:url];
//    NSDate *end = [NSDate date];
    //self.iconImageView.image = [UIImage imageWithData:data];
    
//    NSLog(@"%f",[end timeIntervalSinceDate:begin]);
    [NSThread detachNewThreadSelector:@selector(downLoadImage) toTarget:self withObject:nil];
}
- (void)downLoadImage{
    
    NSURL *url = [NSURL URLWithString:self.url];
    NSData *data = [NSData dataWithContentsOfURL:url];
    UIImage *image = [UIImage imageWithData:data];
    
    //线程通信
    //由子线程回归到主线程1
    //[self performSelectorOnMainThread:@selector(loadImage:) withObject:image waitUntilDone:YES];
    //由子线程回归到主线程2
    //[self performSelector:@selector(loadImage:) onThread:[NSThread mainThread] withObject:image waitUntilDone:YES];
    //由子线程回归到主线程3
    [self.iconImageView performSelectorOnMainThread:@selector(setImage:) withObject:image waitUntilDone:NO];
    NSLog(@"111");
}
- (void)loadImage:(id)obj{
    self.iconImageView.image = obj;
}
@end
