//
//  Target_HomeVC.m
//  HomeVC
//
//  Created by zhongxiaoming on 5/24/22.
//

#import "Target_HomeVC.h"
#import "HomeViewController.h"

@implementation Target_HomeVC


- (UIViewController *)Action_FetchHomeViewController:(NSDictionary *)params {
    HomeViewController *vc = [HomeViewController new];
    return vc;
}


@end
