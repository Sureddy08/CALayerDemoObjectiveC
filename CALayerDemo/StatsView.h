//
//  StatsView.h
//  CALayerDemo
//
//  Created by VKS on 4/21/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface StatsView : UIView
@property (retain,nonatomic) UILabel *percentLabel;
@property(retain,nonatomic) UILabel *captionLabel;
@property (assign) CGFloat range;
@property (assign,nonatomic) CGFloat curValue;
@property (assign) CGFloat margin;
@property (nonatomic) CAShapeLayer *bgLayer;
@property (nonatomic) IBInspectable UIColor *bgColor;
@property (nonatomic) CAShapeLayer *fgLayer;
@property (nonatomic) IBInspectable UIColor *fgColor;

-(void)setup;
-(void)configure;
@end
