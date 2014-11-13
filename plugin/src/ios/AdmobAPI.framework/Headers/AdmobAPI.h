#import <Foundation/Foundation.h>
#import "AdmobWebPluginDelegate.h"
#import "GADBannerView.h"
#import "GADInterstitial.h"
#import "GADBannerView.h"

@class AdmobFullDelege;
@class AdmobBannerController;
@interface AdmobAPI : NSObject
@property(nonatomic,retain) id<AdmobWebPluginDelegate> plugin;


@property(nonatomic,retain) GADInterstitial *admobInterstial;
@property(nonatomic,retain) AdmobFullDelege *admobFullDelegete;
@property(nonatomic,retain) AdmobBannerController *admobController;



-(void) fireEvent:(NSString*) eventType withEventData:(NSString*) jsonString;

-(void) initAdmob:(NSString *)bannerID with:(NSString *) instertitialID;



- (void)hideBanner;
- (void)showBannerAbsolute:(int) x withY:(int) y bannerWidth:(int) bwidth bannerHeight:(int) bheight withPara:(NSDictionary *)param;
- (void)showBanner:(int) position bannerWidth:(int) bwidth bannerHeight:(int) bheight withPara:(NSDictionary *)param;

- (BOOL)isInterstitialReady ;
- (void)showInterstitial;
- (void)cacheInterstitial:(NSDictionary *)param;
@end
