//
//  ProfileView.m
//  CALayerDemo
//
//  Created by VKS on 4/21/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "ProfileView.h"

@implementation ProfileView
@synthesize startColor;

-(void)awakeFromNib{
    [super awakeFromNib];
    [self setup];
    [self configure];
}

-(void)prepareForInterfaceBuilder{
    [super prepareForInterfaceBuilder];
    [self setup];
    [self configure];
}

- (id) initWithCoder:(NSCoder *)aDecoder;
{
    self = [super initWithCoder: aDecoder];
    if (!self) {
        return nil;
    }
    self.profileName = @"";
    self.profileImage = [[UIImage alloc] init];
    return self;
}

-(void)setup{
    
    self.margin = 30.0;
    self.label = [[UILabel alloc] init];
    self.imageView = [[UIImageView alloc] init];
    
    self.layerGradient = [CAGradientLayer layer];
    self.strokeColor = [UIColor blackColor];
    self.startColor = [UIColor blueColor];
    self.endColor = [UIColor blueColor];
    [[self layer] addSublayer:self.layerGradient];
    
    // Stroke Person Image
    _imageView.layer.borderColor = _strokeColor.CGColor;
    _imageView.layer.borderWidth = 2;
    _imageView.layer.masksToBounds = true;
    
    // Setup image view
    _imageView.contentMode = UIViewContentModeScaleAspectFit;
    _imageView.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:_imageView];
    
    self.label.font = [UIFont fontWithName:@"AvenirNext-Bold" size:28.0];
    self.label.textColor = [UIColor blackColor];
    self.label.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:self.label];
    
    [_label setContentCompressionResistancePriority:1000 forAxis:(UILayoutConstraintAxisVertical)];
    
    NSLayoutConstraint *labelCenterX = [self.label.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *labelBottom  = [self.label.bottomAnchor constraintEqualToAnchor:self.bottomAnchor];
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:(id) labelCenterX,(id) labelBottom,nil]];
    
    NSLayoutConstraint *imageViewCenterX = [_imageView.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *imageViewTop = [_imageView.topAnchor constraintEqualToAnchor:self.topAnchor constant:self.margin];
    NSLayoutConstraint *imageViewBottom = [_imageView.bottomAnchor constraintEqualToAnchor:_label.topAnchor constant:-self.margin];
    NSLayoutConstraint *imageViewWidth = [_imageView.widthAnchor constraintEqualToAnchor:_imageView.heightAnchor];
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:(id)imageViewCenterX,(id)imageViewTop,(id) imageViewBottom,(id)imageViewWidth, nil]];
}




-(void)configure{
    self.imageView.image = self.profileImage;
    self.label.text = self.profileName;
    
    self.layerGradient.colors = [NSArray arrayWithObjects:(id) startColor.CGColor,(id)self.endColor.CGColor,nil];
    self.layerGradient.startPoint = CGPointMake(0.5,0);
    self.layerGradient.endPoint = CGPointMake(0.5, 1);
}

-(void)layoutSubviews{
    [super layoutSubviews];
    _imageView.layer.cornerRadius = CGRectGetHeight(_imageView.bounds)/2.0;
    
    _layerGradient.frame = CGRectMake(0, 0, CGRectGetWidth(self.bounds), CGRectGetHeight(_imageView.frame));
}

/*
 // Only override drawRect: if you perform custom drawing.
 // An empty implementation adversely affects performance during animation.
 - (void)drawRect:(CGRect)rect {
 // Drawing code
 }
 */
@end
