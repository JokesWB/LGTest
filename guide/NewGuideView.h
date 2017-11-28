//
//  NewGuideView.h
//  WFTravel
//
//  Created by 刘广 on 2017/11/18.
//  Copyright © 2017年 lg. All rights reserved.
//

#import <UIKit/UIKit.h>

typedef enum : NSUInteger {
    NewGuideViewTypeWithMine,       // 我的页面引导，有两个引导页面
    NewGuideViewTypeWithTicket,     // 我的券包引导页
    NewGuideViewTypeWithLicai,      // 理财页面引导页
} NewGuideViewType;

@interface NewGuideView : UIView

+ (instancetype)guideViewWithType:(NewGuideViewType)type;

// 设置 “我的” 页面中，“我的券包” 的位置
- (void)setMinePageMyTicketFrame:(CGRect)frame;

// 设置 “理财” 页面中，第一张图片的位置，其余的位置可以写死
- (void)setLicaiPageFrame:(CGRect)frame;

@end


