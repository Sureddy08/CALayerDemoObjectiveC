//
//  AppViewController.m
//  CALayerDemo
//
//  Created by VKS on 4/21/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "AppViewController.h"
#import "StatsView.h"
@interface AppViewController()
@property (weak, nonatomic) IBOutlet UIImageView *appImageView;
@property (weak, nonatomic) IBOutlet UILabel *appName;
@property (weak, nonatomic) IBOutlet UILabel *companyName;
@property (weak, nonatomic) IBOutlet StatsView *statsView;
@property (weak, nonatomic) IBOutlet UIStepper *stepper;
@property (weak, nonatomic) IBOutlet UIView *topView;
@property (weak, nonatomic) IBOutlet UIButton *donButton;


@end
@implementation AppViewController

-(void)viewWillAppear:(BOOL)animated{
    self.donButton.layer.cornerRadius = CGRectGetHeight(self.donButton.bounds)/2.0;
    self.appImageView.layer.borderColor = [UIColor blackColor].CGColor;
    self.appImageView.layer.borderWidth = 1.0;
    
    
    self.appImageView.image = self.app.image;
    self.appName.text = self.app.name;
    self.companyName.text = self.app.companyName;
    _statsView.range = (CGFloat)self.app.maximumDownloads;
    _statsView.curValue = (CGFloat)self.app.downloads;
    _stepper.value = (double)self.app.downloads;
    _stepper.maximumValue = (double)self.app.maximumDownloads;


}
- (IBAction)stepperValueDidChange:(UIStepper *)sender {
    _statsView.curValue = (CGFloat) sender.value;
}

@end
