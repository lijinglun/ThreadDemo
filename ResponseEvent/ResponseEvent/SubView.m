//
//  SubView.m
//  ResponseEvent
//
//  Created by lijinglun on 2019/6/12.
//  Copyright © 2019 lijinglun. All rights reserved.
//

#import "SubView.h"

@implementation SubView

/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/
- (UIView *)hitTest:(CGPoint)point withEvent:(UIEvent *)event{

    UIView *view = [super hitTest:point withEvent:event];
    if (view == nil) {
        for (UIView *subView in self.subviews) {
            CGPoint myPoint = [subView convertPoint:point fromView:self];
            if (CGRectContainsPoint(subView.bounds, myPoint)) {
                return subView;
            }
        }
    }
    return view;
}
- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //[super touchesBegan:touches withEvent:event];
    NSLog(@"---%@---%@---",self.subName,NSStringFromSelector(_cmd));
}
@end
