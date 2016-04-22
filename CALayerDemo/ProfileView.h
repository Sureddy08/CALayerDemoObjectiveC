//
//  ProfileView.h
//  CALayerDemo
//
//  Created by VKS on 4/21/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import <UIKit/UIKit.h>
IB_DESIGNABLE
@interface ProfileView : UIView

@property (assign) CGFloat margin;
@property (retain,nonatomic) UILabel *label;
@property (retain,nonatomic) UIImageView *imageView;
@property (nonatomic) CAGradientLayer *layerGradient;
@property (nonatomic) IBInspectable UIColor *strokeColor;
@property (nonatomic) IBInspectable UIColor *startColor;
@property (nonatomic) IBInspectable UIColor *endColor;
@property (nonatomic) IBInspectable UIImage *profileImage;
@property (nonatomic) IBInspectable NSString *profileName;

-(void) configure;
-(void) setup;

@end
