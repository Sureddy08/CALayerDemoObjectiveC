//
//  StatsView.m
//  CALayerDemo
//
//  Created by VKS on 4/21/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "StatsView.h"
#define DEGREES_TO_RADIANS(value) ((value) * M_PI / 180.0)
#define RADIANS_TO_DEGREES(value) ((value) * 180.0 /M_PI)

@interface StatsView()

-(void)setupShapeLayer:(CAShapeLayer *) shapeLayer;
-(void)animate;

@end

@implementation StatsView

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

-(void)setCurValue:(CGFloat)curValue{
    self->_curValue = curValue;
    [self animate];
}

-(void)setup{
    self.percentLabel = [[UILabel alloc] init];
    self.captionLabel = [[UILabel alloc] init];
    self.range = 10.0;
    self.curValue = 0;
    self.margin = 10.0;
    self.bgLayer = [CAShapeLayer layer];
    self.fgLayer = [CAShapeLayer layer];
    self.bgColor = [UIColor grayColor];
    self.fgColor = [UIColor blackColor];
    
    // Setup background layer
    _bgLayer.lineWidth = 20.0;
    _bgLayer.fillColor = nil;
    _bgLayer.strokeEnd = 1;
    [self.layer addSublayer:_bgLayer];
    _fgLayer.lineWidth = 20.0;
    _fgLayer.fillColor = nil;
    _fgLayer.strokeEnd = 0;
    [self.layer addSublayer:_fgLayer];
    
    // Setup percent label
    _percentLabel.font = [UIFont systemFontOfSize:26];
    _percentLabel.textColor = [UIColor whiteColor];
    _percentLabel.text = @"0/0";
    _percentLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:_percentLabel];
    
    // Setup caption label
    _captionLabel.font = [UIFont systemFontOfSize:(26)];
    _captionLabel.text = @"Downloads";
    _captionLabel.textColor = [UIColor whiteColor];
    _captionLabel.translatesAutoresizingMaskIntoConstraints = false;
    [self addSubview:_captionLabel];
    
    NSLayoutConstraint *percentLabelCenterX = [self.percentLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *percentLabelCenterY = [self.percentLabel.centerYAnchor constraintEqualToAnchor:self.centerYAnchor constant:-_margin];
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:(id) percentLabelCenterX,(id) percentLabelCenterY,nil]];
    
    NSLayoutConstraint *captionLabelCenterX = [self.captionLabel.centerXAnchor constraintEqualToAnchor:self.centerXAnchor];
    NSLayoutConstraint *captionLabelBottom = [self.captionLabel.bottomAnchor constraintEqualToAnchor:self.bottomAnchor constant:-_margin];
    [NSLayoutConstraint activateConstraints:[NSArray arrayWithObjects:(id) captionLabelCenterX,(id) captionLabelBottom,nil]];
}

-(void)configure{
    self.bgLayer.strokeColor = _bgColor.CGColor;
    self.fgLayer.strokeColor = _fgColor.CGColor;    
}

-(void)layoutSubviews{
    [super layoutSubviews];
    [self setupShapeLayer:self.bgLayer];
    [self setupShapeLayer:self.fgLayer];
}

-(void)setupShapeLayer:(CAShapeLayer *)shapeLayer{
    shapeLayer.frame = self.bounds;
    CGPoint center = self.percentLabel.center;
    CGFloat startAngle = DEGREES_TO_RADIANS(135.0);
    CGFloat endAngle = DEGREES_TO_RADIANS(45.0);
    CGFloat radius = CGRectGetWidth(self.bounds) * 0.35;
    UIBezierPath *path = [UIBezierPath bezierPathWithArcCenter:center radius:radius startAngle:startAngle endAngle:endAngle clockwise:true];
    shapeLayer.path = path.CGPath;
}

-(void)animate{
    self.percentLabel.text = [NSString stringWithFormat:@"%.0f/%.0f",_curValue,_range];
    
    CGFloat fromValue = self.fgLayer.strokeEnd;
    CGFloat toValue = _curValue/_range;
    CAShapeLayer *presentationLayer = [self.fgLayer presentationLayer];
    fromValue = presentationLayer.strokeEnd;
    
    CGFloat percentageChange = ABS(fromValue - toValue);
    
    CABasicAnimation *animation = [CABasicAnimation animationWithKeyPath:@"strokeEnd"];
    animation.fromValue = [NSNumber numberWithFloat:fromValue];
    animation.toValue = [NSNumber numberWithFloat:toValue];
    animation.duration = percentageChange*4;
    
    [self.fgLayer removeAnimationForKey:@"stroke"];
    [self.fgLayer addAnimation:animation forKey:@"stroke"];
    
    [CATransaction begin];
    [CATransaction setDisableActions:true];
    self.fgLayer.strokeEnd = toValue;
    [CATransaction commit];
}




/*
// Only override drawRect: if you perform custom drawing.
// An empty implementation adversely affects performance during animation.
- (void)drawRect:(CGRect)rect {
    // Drawing code
}
*/

@end
