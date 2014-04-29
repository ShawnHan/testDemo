//
//  ViewController.m
//  githubTestDemo
//
//  Created by Shawn on 14-4-24.
//  Copyright (c) 2014年 hanlong. All rights reserved.
//

#import "ViewController.h"
#import "WelcomeViewController.h"

@interface ViewController ()

@end

@implementation ViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    NSLog(@"%s",__PRETTY_FUNCTION__);
    self.navigationController.interactivePopGestureRecognizer.enabled = YES;
    UIButton *detailButton = [UIButton buttonWithType:UIButtonTypeCustom];
    detailButton.frame = CGRectMake(80, 100, 100, 40);
    [detailButton setTitle:@"gotodetail" forState:UIControlStateNormal];
    [detailButton setTitleColor:[UIColor darkGrayColor] forState:UIControlStateNormal];
    [detailButton addTarget:self action:@selector(gotoDetail) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:detailButton];
	// Do any additional setup after loading the view, typically from a nib.
}
-(void)gotoDetail
{
    NSLog(@"%s",__PRETTY_FUNCTION__);
    WelcomeViewController *welView = [[WelcomeViewController alloc] init];
    [self.navigationController pushViewController:welView animated:YES];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
