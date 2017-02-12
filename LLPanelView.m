//
//  LLPanelView.m
//  简易画板
//
//  Created by locklight on 17/2/11.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "LLPanelView.h"
#import "LLBezierPath.h"


@implementation LLPanelView


#pragma mark 重写getter方法实现懒加载(启用懒加载后调用set方法无法使用成员变量)
- (NSMutableArray *)pathList{
    if(_pathList == nil){
        //实例化路径数组
        _pathList = [NSMutableArray array];
//        //默认线宽
//        _lineSize = 3;
    }
    return _pathList;
}

- (void)drawRect:(CGRect)rect {
    if(self.pathList == nil){
        return;
    }
    for (LLBezierPath *path in self.pathList) {
        
        [path.lineColor set];
        //渲染描边
        [path stroke];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建触摸时间集合对象
    UITouch *touch = touches.anyObject;
    //获取当前开始点按坐标
    CGPoint location = [touch locationInView:self];
    
    //创建路径对象
    LLBezierPath *path = [LLBezierPath bezierPath];
    
    //设置路径属性
    path.lineWidth = self.lineSize == 0 ? 3 :self.lineSize;
    //设置路径颜色
    path.lineColor = self.lineColor;
    
    //添加到路径对象数组
    [self.pathList addObject:path];
    //添加绘图起点
    [path moveToPoint:location];
}

- (void)touchesMoved:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    //创建触摸时间集合对象
    UITouch *touch = touches.anyObject;
    //获取当前开始点按坐标
    CGPoint location = [touch locationInView:self];
    
    //创建路径对象
    LLBezierPath *path = self.pathList.lastObject;

    
    [path addLineToPoint:location];
    
    //重绘
    [self setNeedsDisplay];
}
@end
