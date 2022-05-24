//
//  XMViewController.m
//  HomeVC
//
//  Created by samingzhong on 05/24/2022.
//  Copyright (c) 2022 samingzhong. All rights reserved.
//

#import "XMViewController.h"
#import <HomeViewController.h>

@interface XMViewController ()

@end

@implementation XMViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    
    dispatch_after(dispatch_time(DISPATCH_TIME_NOW, (int64_t)(5 * NSEC_PER_SEC)), dispatch_get_main_queue(), ^{
        HomeViewController *home = [HomeViewController new];
        [self presentViewController:home animated:YES completion:nil];
    });
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
