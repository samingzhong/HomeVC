//
//  HomeViewController.m
//  HomeVC
//
//  Created by zhongxiaoming on 5/24/22.
//

#import "HomeViewController.h"
#import "Masonry.h"

// 依赖模块
#import "CTMediator+SettingVC.h"

@interface HomeViewController ()

@property (nonatomic, strong) UILabel *myTitleLabel;

@property (nonatomic, strong) UIImageView *imageView;

@end

@implementation HomeViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    self.view.backgroundColor = UIColor.whiteColor;
    [self setupUI];
}

/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

- (void)back {
    [self toSettingVC];
    return;
    
    if (self.navigationController) {
        [self.navigationController popViewControllerAnimated:YES];
    } else {
        [self dismissViewControllerAnimated:YES completion:nil];
    }
}


- (void)setupUI {
    [self.view addSubview:self.myTitleLabel];
    [self.view addSubview:self.imageView];
    
    [self.myTitleLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.right.mas_equalTo(0);
        if (@available(iOS 11.0, *)) {
            make.top.mas_equalTo(self.view.mas_safeAreaLayoutGuideTop).offset(20);
        } else {
            // Fallback on earlier versions
        }
            make.height.mas_equalTo(50);
    }];
    
    [self.imageView mas_makeConstraints:^(MASConstraintMaker *make) {
            make.left.mas_equalTo(30);
            make.right.mas_equalTo(-30);
            make.height.mas_equalTo(300);
            make.centerY.mas_equalTo(0);
    }];
    
    UIStackView *stackView = UIStackView.new;
    stackView.axis = UILayoutConstraintAxisVertical;
    stackView.spacing = 2;
    [self.view addSubview:stackView];
    [stackView mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.imageView);
        make.top.mas_equalTo(self.imageView.mas_bottom).offset(10);
        make.bottom.mas_lessThanOrEqualTo(0);
    }];
    
    NSArray *titles = @[@"back", @"to settingVC", @"to setting VC,methodA"];
    
    for (NSString *title in titles) {
        NSInteger index = [titles indexOfObject:title];
        UIButton *btn = [[UIButton alloc] init];
        btn.tag = index;
        [btn setTitle:title forState:UIControlStateNormal];
        [btn addTarget:self action:@selector(btnDidClick:) forControlEvents:UIControlEventTouchUpInside];
        btn.backgroundColor = UIColor.grayColor;
        [stackView insertArrangedSubview:btn atIndex:index];
    }
}

- (void)btnDidClick:(UIButton *)btn {
    switch (btn.tag) {
        case 0:
            [self back];
            break;
        case 1:
            [self toSettingVC];
            break;
        case 2:
            [self toSettingVC_MethodA];
            break;
        default:
            break;
    }
}


- (void)toSettingVC {
    UIViewController *vc = [CTMediator.sharedInstance CTMediator_viewControllerForSetting];
    [self.navigationController pushViewController:vc animated:YES];
}

- (void)toSettingVC_MethodA {
    [CTMediator.sharedInstance CTMediator_methodA];
}

- (UILabel *)myTitleLabel {
    if (!_myTitleLabel) {
        _myTitleLabel = [[UILabel alloc] init];
        _myTitleLabel.backgroundColor = UIColor.purpleColor;
    }
    
    return _myTitleLabel;
}

- (UIImageView *)imageView {
    if (!_imageView) {
        _imageView = [[UIImageView alloc] init];
        _imageView.backgroundColor = UIColor.orangeColor;
    }
    return _imageView;
}

- (void)setTitle:(NSString *)title {
    self.myTitleLabel.text = title;
}

- (void)setImage:(UIImage *)image {
    self.imageView.image = image;
}

@end
