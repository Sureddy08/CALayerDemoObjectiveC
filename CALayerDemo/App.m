//
//  App.m
//  CALayerDemo
//
//  Created by VKS on 4/22/16.
//  Copyright © 2016 VKS. All rights reserved.
//

#import "App.h"

@implementation App
-(id)initWithName:(NSString *)name companyName:(NSString *)companyName image:(UIImage *)image downloads:(int)downloads maximumDownloads:(int)maximumDownloads{
    if ((self = [super init])) {
        _name = name;
        _companyName = companyName;
        _image = image;
        _downloads = downloads;
        _maximumDownloads = maximumDownloads;
    }
    return self;
}

+(NSMutableArray *)favApps{
    App *calender = [[App alloc] initWithName:@"Calender" companyName:@"by Apple" image:[UIImage imageNamed:@"Calendar"] downloads:67 maximumDownloads:100];
    App *contacts = [[App alloc] initWithName:@"Contacts" companyName:@"by Apple" image:[UIImage imageNamed:@"Contacts"] downloads:67 maximumDownloads:100];
    App *health = [[App alloc] initWithName:@"Health" companyName:@"by Apple" image:[UIImage imageNamed:@"Health"] downloads:67 maximumDownloads:100];
    App *gameCenter = [[App alloc] initWithName:@"Game Center" companyName:@"by Apple" image:[UIImage imageNamed:@"GameCenter"] downloads:67 maximumDownloads:100];
    App *iBook = [[App alloc] initWithName:@"iBook" companyName:@"by Apple" image:[UIImage imageNamed:@"iBook"] downloads:67 maximumDownloads:100];
    App *spotlight = [[App alloc] initWithName:@"Spotlight" companyName:@"by Apple" image:[UIImage imageNamed:@"Spotlight"] downloads:67 maximumDownloads:100];
    App *tips = [[App alloc] initWithName:@"Tips" companyName:@"by Apple" image:[UIImage imageNamed:@"Tips"] downloads:67 maximumDownloads:100];
    return [@[calender,contacts,gameCenter,health,iBook,spotlight,tips] mutableCopy];
}
@end
