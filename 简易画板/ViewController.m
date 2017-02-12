//
//  ViewController.m
//  简易画板
//
//  Created by locklight on 17/2/11.
//  Copyright © 2017年 LockLight. All rights reserved.
//

#import "ViewController.h"
#import "LLPanelView.h"

@interface ViewController ()
@property (weak, nonatomic) IBOutlet LLPanelView *panelView;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
}

- (IBAction)changeLineWidth:(UISlider *)sender {
    self.panelView.lineSize = sender.value;
}

- (IBAction)ChangeLineColor:(UIButton *)sender {
    self.panelView.lineColor = sender.backgroundColor;
    NSLog(@"%@",sender.backgroundColor);
}

- (IBAction)clearPanelView:(UIButton *)sender {
    //清空路径数组
    [self.panelView.pathList removeAllObjects];
    //重绘
    [self.panelView setNeedsDisplay];
}

- (IBAction)savePanelView:(UIButton *)sender {
    //获取当前图像上下文
    UIGraphicsBeginImageContextWithOptions(self.panelView.bounds.size, YES, 0);
    
    //渲染绘图视图
    [_panelView drawViewHierarchyInRect:self.panelView.bounds afterScreenUpdates:YES];
    
    //获取当前渲染图片
    UIImage *currentImg = UIGraphicsGetImageFromCurrentImageContext();
    
    //截图到相册
    UIImageWriteToSavedPhotosAlbum(currentImg, self, @selector(image:didFinishSavingWithError:contextInfo:), NULL);
    
    //结束图像上下文
    UIGraphicsEndImageContext();
}

- (void)image:(UIImage *)image didFinishSavingWithError:(NSError *)error contextInfo:(void *)contextInfo{
    if(error){
        NSLog(@"保存失败");
        NSLog(@"%@",error);
    }else{
        NSLog(@"保持成功");
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
