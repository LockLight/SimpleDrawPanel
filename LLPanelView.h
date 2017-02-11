//
//  LLPanelView.h
//  简易画板
//
//  Created by locklight on 17/2/11.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface LLPanelView : UIView

@property (nonatomic, assign) CGFloat lineSize;
@property (nonatomic, strong) UIColor *lineColor;

@property (nonatomic, strong) NSMutableArray <UIBezierPath *> *pathList;

@end
