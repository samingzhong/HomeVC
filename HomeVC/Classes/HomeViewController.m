//
//  HomeViewController.m
//  HomeVC
//
//  Created by zhongxiaoming on 5/24/22.
//

#import "HomeViewController.h"
#import "Masonry.h"
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
    
    UIButton *btn = [[UIButton alloc] init];
    [btn setTitle:@"back" forState:UIControlStateNormal];
    [btn addTarget:self action:@selector(back) forControlEvents:UIControlEventTouchUpInside];
    [self.view addSubview:btn];
    [btn mas_makeConstraints:^(MASConstraintMaker *make) {
        make.left.right.mas_equalTo(self.imageView);
        make.top.mas_equalTo(self.imageView.mas_bottom);
        make.height.mas_equalTo(50);
    }];
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

@end
