//
//  RevMobAdAdapter.m
//  DragonCalc
//
//  Created by Зловред on 06.06.14.
//  Copyright (c) 2014 Max Matveev. All rights reserved.
//

#import "RevMobAdAdapter.h"
@interface RevMobAdAdapter()

@property (nonatomic, readwrite) BOOL adLoaded;

@end

@implementation RevMobAdAdapter

- (void)dealloc{
    _bannerView.delegate = nil;
    _bannerView = nil;
    
    self.adManager = nil;
    
    TOLLog(@"Dealloc");
}

#pragma mark - Required Adapter Implementation
+ (BOOL)requiresPublisherId{
    return YES;
}
- (void)setPublisherId:(NSString *)publisherId{
    _publisherId = [publisherId copy];
}

- (RevMobBannerView *)bannerView {
    if (!_publisherId) {
        TOLLog(@"RevMob publisherId not set");
        return nil;
    }
    if (!_bannerView) {
        [RevMobAds startSessionWithAppID:_publisherId];
//        [[RevMobAds session] setTestingMode:RevMobAdsTestingModeWithAds];
        
        _bannerView = [[RevMobAds session] bannerView];
        _bannerView.frame = CGRectMake(0, 0, 320, 50);

        _bannerView.delegate = self;
        
        [_bannerView loadAd];
        
    }
    return _bannerView;
}

#pragma mark - Optional Adapter Implementation
- (NSString *)friendlyNetworkDescription{
    return @"RevMob";
}

#pragma mark -
#pragma mark iAd Delegate Methods
-(void)revmobAdDidReceive {
    _adLoaded = YES;
    if ([self.adManager respondsToSelector:@selector(adSucceededForNetworkAdapterClass:)]) {
        [self.adManager adSucceededForNetworkAdapterClass:self.class];
    }
    
    TOLLog(@"RevMob did load ad");
}
-(void)revmobAdDidFailWithError:(NSError *)error {
    _adLoaded = NO;
    if ([self.adManager respondsToSelector:@selector(adFailedForNetworkAdapterClass:)]) {
        [self.adManager adFailedForNetworkAdapterClass:self.class];
    }
    
    TOLLog(@"RevMob did fail to receive ad: %@", error);
}

- (void)layoutBannerForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
}

@end
