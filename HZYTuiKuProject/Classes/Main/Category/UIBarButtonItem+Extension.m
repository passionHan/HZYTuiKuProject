//
//  UIBarButtonItem+Extension.m
//  HZYTuiKuProject
//
//  Created by passion on 16/3/21.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import "UIBarButtonItem+Extension.h"

@implementation UIBarButtonItem (Extension)

+(instancetype)barButtonItemByCustomButtonWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightName target:(id)target action:(SEL)action{
    
    UIButton *btn = [UIButton buttonWithType:UIButtonTypeCustom];
    [btn setImage:[UIImage imageNamed:imageName] forState:UIControlStateNormal];
    [btn setImage:[UIImage imageNamed:highlightName] forState:UIControlStateDisabled];
    btn.bounds = CGRectMake(0, 0, 38, 38);
    [btn addTarget:target action:action forControlEvents:UIControlEventTouchUpInside];
    UIBarButtonItem *barButtonItem = [[UIBarButtonItem alloc]initWithCustomView:btn];
    
    return barButtonItem;
}

@end
