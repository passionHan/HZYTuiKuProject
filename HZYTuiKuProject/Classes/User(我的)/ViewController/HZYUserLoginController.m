//
//  HZYUserLoginController.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/25.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "HZYUserLoginController.h"
#import <Masonry.h>
@interface HZYUserLoginController ()

@property (weak, nonatomic) IBOutlet UIImageView *logoImage;
@property (weak, nonatomic) IBOutlet UITextField *emailTextField;
@property (weak, nonatomic) IBOutlet UITextField *passWordTextField;

@property (nonatomic,strong) UIView *errorLoginView;

@property (nonatomic,strong) UILabel *errorTextLabel;

@property (nonatomic,strong) MASConstraint *topConstraint;


@end

@implementation HZYUserLoginController

-(instancetype)init{
    
    if (self = [super init]) {
        
        //加载storyboard
        UIStoryboard *story = [UIStoryboard storyboardWithName:@"HZYUserLoginController" bundle:nil];
        
        self = [story instantiateInitialViewController];
    }
    return self;
    
}

- (void)viewDidLoad {
    [super viewDidLoad];
    
    
    [self makeCircleWithview:self.logoImage];
    
    [self setNav];
    
    self.errorTextLabel.text = @"";
}

#pragma mark - 懒加载
#pragma mark 懒加载登录错误的提示试图
-(UILabel *)errorTextLabel{
    
    if (_errorTextLabel == nil) {
        _errorTextLabel = [[UILabel alloc]init];
        [self.errorLoginView addSubview:self.errorTextLabel];
        _errorTextLabel.textAlignment = NSTextAlignmentCenter;
        _errorTextLabel.textColor = [UIColor whiteColor];
        _errorTextLabel.font = [UIFont systemFontOfSize:15];
        UILabel *label = [[UILabel alloc]init];
        label.text = @"登录失败";
        label.font = [UIFont systemFontOfSize:15];
        label.textColor = [UIColor whiteColor];
        label.textAlignment = NSTextAlignmentCenter;
        [self.errorLoginView addSubview:label];
        
        [label mas_makeConstraints:^(MASConstraintMaker *make) {
            
            make.top.equalTo(self.errorLoginView.mas_top).with.offset(20);
            make.centerX.equalTo(self.errorLoginView.mas_centerX);
            
        }];
        [self.errorTextLabel mas_makeConstraints:^(MASConstraintMaker *make) {
            make.centerX.equalTo(self.errorLoginView.mas_centerX);
            make.top.equalTo(label.mas_bottom).with.offset(10);
            make.right.left.equalTo(self.errorLoginView);
        }];
        
    }
    
    return _errorTextLabel;
}

-(UIView *)errorLoginView{
    
    if (_errorLoginView == nil) {
        
        _errorLoginView = [[UIView alloc]init];
        _errorLoginView.backgroundColor = [UIColor colorWithRed:247 / 255.0 green:151 / 255.0 blue:40 / 255.0 alpha:1];
        
        [self.navigationController.view addSubview:_errorLoginView];
        
        [_errorLoginView mas_makeConstraints:^(MASConstraintMaker *make) {
            
            self.topConstraint =  make.top.equalTo(self.navigationController.view.mas_top).with.offset(-95);
            make.right.left.equalTo(self.navigationController.view);
            make.height.mas_equalTo(95);
            
        }];
        
    }
    return _errorLoginView;
}

/**
 *  使view变圆
 *
 *  @param originalView 需要变圆的view
 */
-(void)makeCircleWithview:(UIView *)originalView{
    
    originalView.layer.cornerRadius = 30;
    //很耗性能
    originalView.layer.masksToBounds = YES;
    originalView.layer.borderWidth = 1;
    originalView.layer.borderColor = [UIColor grayColor].CGColor;
}


#pragma mark - 设置导航栏
-(void)setNav{
    
    self.title = @"登录";
    UIBarButtonItem *registItem = [[UIBarButtonItem alloc]initWithTitle:@"注册" style:UIBarButtonItemStylePlain target:self action:@selector(registItemClick)];
    self.navigationItem.rightBarButtonItem = registItem;
}

-(void)registItemClick{
    
}


- (IBAction)weibologin:(UIButton *)sender {
}

- (IBAction)qqLogin {
    
    NSLog(@"asdf");
}
- (IBAction)weiChatLogin {
}

#pragma mark - 点击登录
- (IBAction)loginBtnClick {
    
    NSDictionary *nameAndPassWord = @{
                                      @"email":self.emailTextField.text,
                                      @"password":self.passWordTextField.text
                                      };
    
    //向服务器发送请求
    [[HZYUserLoginModel sharedUserLoginModel] getUserInfoWith:nameAndPassWord sendLoginRequest:^(NSString *loginResult) {
        
        //登录成功
        if ([loginResult isEqualToString:@"success"]) {
            
            [super.tabBarController setSelectedIndex:0];
            
            [[NSNotificationCenter defaultCenter] postNotificationName:@"HZYUserLoginControllerLoginSuccess" object:nil];
            
            [self.navigationController popViewControllerAnimated:YES];
            
        }else{
            //登录失败
            
            self.errorTextLabel.text = loginResult;
            
            [self.topConstraint uninstall];
            
            [self.errorLoginView mas_updateConstraints:^(MASConstraintMaker *make) {
                
                self.topConstraint = make.top.equalTo(self.navigationController.view.mas_top);
            }];
            
            [UIView animateWithDuration:1.0 animations:^{
                
                [self.navigationController.view layoutIfNeeded];
                
            } completion:^(BOOL finished) {
                
                [self.topConstraint uninstall];
                
                [self.errorLoginView mas_updateConstraints:^(MASConstraintMaker *make) {
                    
                    self.topConstraint = make.top.equalTo(self.navigationController.view.mas_top).with.offset(-95);
                }];
                
                [self.navigationController.view layoutIfNeeded];
                
            }];
            
        }

    } requestFailed:^(NSError *error) {
        
        NSLog(@"%@",error);
    }];
    
}

/**
 *  点击屏幕其他地方退出键盘
 */
- (void)touchesBegan:(NSSet *)touches withEvent:(UIEvent *)event{
    
    [self.view endEditing:YES];
}



@end
