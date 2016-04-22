//
//  ViewController.m
//  CALayerDemo
//
//  Created by VKS on 4/20/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "ViewController.h"
#import "AppCell.h"
#import "App.h"
#import "AppViewController.h"

@interface ViewController ()
@property (strong,nonatomic) NSMutableArray *favApps;
@property (weak, nonatomic) IBOutlet UICollectionView *collectionView;
@property (weak, nonatomic) IBOutlet UIButton *followButton;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    self.favApps = [App favApps];
    _followButton.layer.cornerRadius = CGRectGetHeight(_followButton.bounds)/2.0;
    // Do any additional setup after loading the view, typically from a nib.
}

-(void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if([segue.identifier  isEqual: @"showAppView"]){
        AppViewController *appViewVC = (AppViewController *) [segue destinationViewController];
        AppCell *cell = (AppCell *)sender;
        NSIndexPath *indexPath = [self.collectionView indexPathForCell:cell];
        appViewVC.app = self.favApps[indexPath.row];
    }
}

-(IBAction)unwindToProfileView:(UIStoryboardSegue *)sender{

}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

-(NSInteger)numberOfSectionsInCollectionView:(UICollectionView *)collectionView{
    return 1;
}

-(NSInteger)collectionView:(UICollectionView *)collectionView numberOfItemsInSection:(NSInteger)section{
    return self.favApps.count;
}

-(UICollectionViewCell *)collectionView:(UICollectionView *)collectionView cellForItemAtIndexPath:(NSIndexPath *)indexPath{
    AppCell *cell = [collectionView dequeueReusableCellWithReuseIdentifier:@"AppCell" forIndexPath:indexPath];
    App *app = self.favApps[indexPath.row];
    cell.imageView.image = app.image;
    return cell;
}


-(CGSize)collectionView:(UICollectionView *)collectionView layout:(UICollectionViewLayout *)collectionViewLayout sizeForItemAtIndexPath:(NSIndexPath *)indexPath{
    App *app = self.favApps[indexPath.row];
    if(app.image.size.height < 0){
        return self.collectionView.bounds.size;
    }
    
    CGFloat ratio = CGRectGetHeight(self.collectionView.bounds) / app.image.size.height;
    CGSize size = CGSizeMake(app.image.size.width*ratio, app.image.size.height*ratio);
    return size;
}


@end
