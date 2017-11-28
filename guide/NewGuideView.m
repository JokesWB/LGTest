//
//  NewGuideView.m
//  WFTravel
//
//  Created by 刘广 on 2017/11/18.
//  Copyright © 2017年 lg. All rights reserved.
//

#import "NewGuideView.h"

@interface NewGuideView ()

@property (nonatomic, strong) UIView *bgView;   // 背景view
@property (nonatomic, strong) UIImageView *picImageView;  // 图片
@property (nonatomic, strong) UIImageView *textImageView;  // 文字图片
@property (nonatomic, assign) NewGuideViewType type;
@property (nonatomic, assign) BOOL isFirst;                 // 针对我的页面，标记是不是第一次点击

@end

@implementation NewGuideView

+ (instancetype)guideViewWithType:(NewGuideViewType)type
{
    if ([[UIApplication sharedApplication].keyWindow.rootViewController isKindOfClass:[UITabBarController class]]) {
        UITabBarController *tabbarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
        
        CGRect rect = CGRectZero;
        if (type == NewGuideViewTypeWithMine || type == NewGuideViewTypeWithLicai) {
            rect = tabbarVC.view.bounds;
        } else if (type == NewGuideViewTypeWithTicket) {
            UINavigationController *nav = (UINavigationController *)tabbarVC.selectedViewController;
            rect = nav.view.bounds;
        }
        return [[self alloc] initWithFrame:rect guideType:type];
    }
    return [[self alloc] initWithFrame:CGRectZero guideType:0];
}

- (instancetype)initWithFrame:(CGRect)frame guideType:(NewGuideViewType)type
{
    self = [super initWithFrame:frame];
    if (self) {
        
        self.isFirst = YES;
        self.bgView.frame = frame;
        self.type = type;
        [self setupWithGuidetype:type];
        
    }
    return self;
}


- (void)setupWithGuidetype:(NewGuideViewType)type
{
    if (type == NewGuideViewTypeWithMine) {
        //        // 我的
        //        self.picImageView.frame = CGRectMake(10, 300, 160, 50);
        //        self.picImageView.backgroundColor = [UIColor redColor];
        //        self.textImageView.frame = CGRectMake(180, 300, 160, 200);
        //        self.textImageView.backgroundColor = [UIColor orangeColor];
        
    } else if (type == NewGuideViewTypeWithLicai) {
        //        // 理财
        //        self.picImageView.frame = CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width - 20, 150);
        //        self.picImageView.backgroundColor = [UIColor yellowColor];
        //        self.textImageView.frame = CGRectMake(0, CGRectGetMaxY(self.picImageView.frame) + 5, [UIScreen mainScreen].bounds.size.width, 200);
        //        self.textImageView.backgroundColor = [UIColor grayColor];
        
    } else if (type == NewGuideViewTypeWithTicket) {
        // 券包
        self.picImageView.frame = CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width - 20, 150);
        self.picImageView.backgroundColor = [UIColor greenColor];
        self.textImageView.frame = CGRectMake(0, CGRectGetMaxY(self.picImageView.frame) + 5, [UIScreen mainScreen].bounds.size.width, 200);
        self.textImageView.backgroundColor = [UIColor blueColor];
        
    }
}

// 我的
- (void)setMinePageMyTicketFrame:(CGRect)frame
{
    //    CGRectMake(10, 300, 160, 50)
    self.picImageView.frame = frame;
    self.picImageView.backgroundColor = [UIColor redColor];
    self.textImageView.frame = CGRectMake(180, 300, 160, 200);
    self.textImageView.backgroundColor = [UIColor orangeColor];
}

// 理财
- (void)setLicaiPageFrame:(CGRect)frame
{
    //    CGRectMake(10, 200, [UIScreen mainScreen].bounds.size.width - 20, 150)
    self.picImageView.frame = frame;
    self.picImageView.backgroundColor = [UIColor yellowColor];
    self.textImageView.frame = CGRectMake(0, CGRectGetMaxY(self.picImageView.frame) + 5, [UIScreen mainScreen].bounds.size.width, 200);
    self.textImageView.backgroundColor = [UIColor grayColor];
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event
{
    if (self.type == NewGuideViewTypeWithLicai || self.type == NewGuideViewTypeWithTicket) {
        [self removeFromSuperview];
    } else if (self.type == NewGuideViewTypeWithMine) {
        if (self.isFirst) {
            
            // 获取第二个 tabbarBtn 的位置
            UITabBarController *tabbarVC = (UITabBarController *)[UIApplication sharedApplication].keyWindow.rootViewController;
            UIView *view =  (UIView *)tabbarVC.tabBar.subviews[2];
            
            CGRect viewFrame = [view convertRect:view.bounds toView:tabbarVC.view];
            NSLog(@">>> %@", NSStringFromCGRect(viewFrame));
            
            self.picImageView.frame = viewFrame;
            self.picImageView.backgroundColor = [UIColor redColor];
            self.textImageView.frame = CGRectMake(10, 400, [UIScreen mainScreen].bounds.size.width - 20, 200);
            self.textImageView.backgroundColor = [UIColor orangeColor];
            self.isFirst = NO;
            
        } else {
            [self removeFromSuperview];
        }
        
    }
}


- (UIView *)bgView
{
    if (!_bgView) {
        _bgView = [[UIView alloc] init];
        _bgView.backgroundColor = [UIColor colorWithWhite:0 alpha:0.3];
        [self addSubview:_bgView];
    }
    return _bgView;
}

- (UIImageView *)picImageView
{
    if (!_picImageView) {
        _picImageView = [[UIImageView alloc] init];
        _picImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.bgView addSubview:_picImageView];
    }
    return _picImageView;
}

- (UIImageView *)textImageView
{
    if (!_textImageView) {
        _textImageView = [[UIImageView alloc] init];
        _textImageView.contentMode = UIViewContentModeScaleAspectFit;
        [self.bgView addSubview:_textImageView];
    }
    return _textImageView;
}

@end


