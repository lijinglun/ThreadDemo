//
//  ViewController.m
//  ResponseEvent
//
//  Created by lijinglun on 2019/6/12.
//  Copyright © 2019 lijinglun. All rights reserved.
//

#import "ViewController.h"
#import "SubView.h"
@interface ViewController ()
@property (nonatomic,strong)SubView *sub3;
@property (nonatomic,strong)SubView *sub4;
@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    
    self.view.backgroundColor = [UIColor whiteColor];
    
    SubView *sub1 = [[SubView alloc]initWithFrame:CGRectMake(100, 100, 50, 150)];
    sub1.backgroundColor = [UIColor orangeColor];
    sub1.subName = @"orangeColor";
    [self.view addSubview:sub1];
    
    SubView *sub2 = [[SubView alloc]initWithFrame:CGRectMake(100, 200, 150, 50)];
    sub2.backgroundColor = [UIColor greenColor];
    sub2.subName = @"greenColor";
   // sub2.userInteractionEnabled = NO;
    [self.view addSubview:sub2];
    
    _sub3 = [[SubView alloc]initWithFrame:CGRectMake(150, 300, 100, 100)];
    _sub3.backgroundColor = [UIColor redColor];
    _sub3.subName = @"redColor";
    [self.view addSubview:_sub3];
    
    _sub4 = [[SubView alloc]initWithFrame:CGRectMake(0, -30, 50, 50)];
    _sub4.backgroundColor = [UIColor brownColor];
    _sub4.subName = @"brownColor";
    [_sub3 addSubview:_sub4];
    
    UITapGestureRecognizer *productImageViewTap = [[UITapGestureRecognizer alloc]initWithTarget:self action:@selector(productImageViewTap:)];
    productImageViewTap.numberOfTapsRequired = 1;
    [_sub4 addGestureRecognizer:productImageViewTap];
}
- (void)productImageViewTap:(id)sender{
    NSLog(@"点击图片");
}

@end
