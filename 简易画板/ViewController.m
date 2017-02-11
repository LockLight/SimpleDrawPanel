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


- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}


@end
