//
//  ViewController.m
//  运动类-环形进度Demo
//
//  Created by vera on 16/3/16.
//  Copyright © 2016年 vera. All rights reserved.
//

#import "ViewController.h"
#import "DLCircleProgessView.h"

@interface ViewController ()
{
    DLCircleProgessView *_circleProgessView;
    DLCircleProgessView *_circleProgessView2;
}

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    
    int width = 300;
    
    /**
     蓝色
    */
    DLCircleProgessView *circleProgessView = [[DLCircleProgessView alloc] initWithFrame:CGRectMake(30, 40, width, width)];
    circleProgessView.backgroundColor = [UIColor whiteColor];
    [self.view addSubview:circleProgessView];
    
    _circleProgessView = circleProgessView;
    
    /**
     红色
    */
    DLCircleProgessView *circleProgessView2 = [[DLCircleProgessView alloc] initWithFrame:CGRectMake(30, 360, width, width)];
    circleProgessView2.backgroundColor = [UIColor whiteColor];
    circleProgessView2.fillLineColor = [UIColor redColor];
    circleProgessView2.value = 30;
    [self.view addSubview:circleProgessView2];
    
    _circleProgessView2 = circleProgessView2;
    
    
//    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(3 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
//        circleProgessView.lineColor = [UIColor redColor];
//    });
   
    [NSTimer scheduledTimerWithTimeInterval:0.1 target:self selector:@selector(update:) userInfo:nil repeats:YES];
    
}

- (void)update:(NSTimer *)timer
{
    _circleProgessView.value++;
    
    if (_circleProgessView.value >= 100)
    {
        [timer invalidate];
    }
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
