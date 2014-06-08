//
//  RevMobAdAdapter.h
//  DragonCalc
//
//  Created by Зловред on 06.06.14.
//  Copyright (c) 2014 Max Matveev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TOLAdAdapter.h"
#import "LARSAdController.h"
#import <RevMobAds/RevMobAds.h>

@interface RevMobAdAdapter : NSObject<TOLAdAdapter, RevMobAdsDelegate>

@property (copy, nonatomic) NSString *publisherId;
@property (strong, nonatomic) RevMobBannerView *bannerView;
@property (nonatomic) BOOL adVisible;
@property (weak, nonatomic) id <LARSAdControllerDelegate> adManager;

@end
