//
//  UIBarButtonItem+Extension.h
//  HZYTuiKuProject
//
//  Created by passion on 16/3/21.
//  Copyright (c) 2016年 passionHan. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface UIBarButtonItem (Extension)

+(instancetype)barButtonItemByCustomButtonWithImage:(NSString *)imageName highlightedImage:(NSString *)highlightName target:(id)target action:(SEL)action;

@end
