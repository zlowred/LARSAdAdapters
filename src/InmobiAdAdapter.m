//
//  InmobiAdAdapter.m
//  DragonCalc
//
//  Created by Зловред on 06.06.14.
//  Copyright (c) 2014 Max Matveev. All rights reserved.
//

#import "InmobiAdAdapter.h"
@interface InmobiAdAdapter()

@property (nonatomic, readwrite) BOOL adLoaded;

@end

@implementation InmobiAdAdapter

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

- (IMBanner *)bannerView {
    if (!_publisherId) {
        TOLLog(@"InMobi publisherId not set");
        return nil;
    }
    if (!_bannerView) {
//        [InMobi setLogLevel:IMLogLevelVerbose];
        [InMobi initialize:_publisherId];
        
        _bannerView = [[IMBanner alloc] initWithFrame:CGRectMake(0, 0, 320, 50) appId:_publisherId adSize:IM_UNIT_320x50];
        _bannerView.delegate = self;
        [_bannerView loadBanner];
        
    }
    return _bannerView;
}

#pragma mark - Optional Adapter Implementation
- (NSString *)friendlyNetworkDescription{
    return @"InMobi";
}

#pragma mark -
#pragma mark iAd Delegate Methods
-(void)bannerDidReceiveAd:(IMBanner *)banner {
    _adLoaded = YES;
    if ([self.adManager respondsToSelector:@selector(adSucceededForNetworkAdapterClass:)]) {
        [self.adManager adSucceededForNetworkAdapterClass:self.class];
    }
    
    TOLLog(@"InMobi did load ad");
}
-(void)banner:(IMBanner *)banner didFailToReceiveAdWithError:(IMError *)error {
    _adLoaded = NO;
    if ([self.adManager respondsToSelector:@selector(adFailedForNetworkAdapterClass:)]) {
        [self.adManager adFailedForNetworkAdapterClass:self.class];
    }
    
    TOLLog(@"InMobi did fail to receive ad: %@", error);
}

- (void)layoutBannerForInterfaceOrientation:(UIInterfaceOrientation)interfaceOrientation {
}

@end
