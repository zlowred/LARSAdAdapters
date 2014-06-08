//
//  InmobiAdAdapter.h
//  DragonCalc
//
//  Created by Зловред on 06.06.14.
//  Copyright (c) 2014 Max Matveev. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "TOLAdAdapter.h"
#import "LARSAdController.h"
#import "InMobi.h"
#import "IMBanner.h"
#import "IMBannerDelegate.h"
#import "IMInterstitial.h"
#import "IMInterstitialDelegate.h"
#import "IMIncentivisedDelegate.h"
#import "IMError.h"
#import "InMobiAnalytics.h"


@interface InmobiAdAdapter : NSObject<TOLAdAdapter, IMBannerDelegate>

@property (copy, nonatomic) NSString *publisherId;
@property (strong, nonatomic) IMBanner *bannerView;
@property (nonatomic) BOOL adVisible;
@property (weak, nonatomic) id <LARSAdControllerDelegate> adManager;

@end
