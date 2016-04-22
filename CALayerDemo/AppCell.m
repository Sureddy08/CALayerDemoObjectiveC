//
//  AppCell.m
//  CALayerDemo
//
//  Created by VKS on 4/21/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "AppCell.h"

@implementation AppCell

-(void)awakeFromNib{
    _imageView.layer.shadowRadius = 4.0;
    _imageView.layer.shadowOpacity = 0.5;
    _imageView.layer.shadowOffset = CGSizeZero;
}

@end
