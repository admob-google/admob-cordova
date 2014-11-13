
#import "Cordova/CDV.h"
#import <AdmobAPI/AdmobAPI.h>
#import <AdmobAPI/AdmobWebPluginDelegate.h>
@interface AdmobAdPlugin : CDVPlugin <AdmobWebPluginDelegate>
@property (nonatomic,strong) AdmobAPI *admobAPI;
@property (nonatomic,assign) CGRect srcFrame;
@property (nonatomic,assign) int lastPosition;
- (void)admobHideBanner:(CDVInvokedUrlCommand *)command;
- (void)admobShowBannerAbsolute:(CDVInvokedUrlCommand *)command;
- (void)admobShowBanner:(CDVInvokedUrlCommand *)command;
- (void)admobInitAdmob:(CDVInvokedUrlCommand *)command ;
- (void)admobIsInterstitialReady:(CDVInvokedUrlCommand *)command ;
- (void)admobShowInterstitial:(CDVInvokedUrlCommand *)command;
- (void)admobCacheInterstitial:(CDVInvokedUrlCommand *)command;
@end
