

#import <UIKit/UIKit.h>
#import "GADBannerView.h"
#import "AdmobAPI.h"
@class AdmobAPI;
@interface AdmobBannerController : UIViewController <GADBannerViewDelegate>{
    CGSize adSize;
    int _position;//0 abs position
    int _targetX;
    int _targetY;
}
@property (nonatomic,retain) GADBannerView *adBanner;
@property (nonatomic,retain) AdmobAPI* context;
+(GADRequest *) createRequest:(NSDictionary*)param;
-(void) initAdmobBanner:(NSString*)_bannerID;
-(void) destroyADView;
-(void) createView:(int) w  withHeight: (int) h andGid:(NSString*) gid;
-(void) showBanner:(int)position bannerWidth:(int)bwidth bannerHeight:(int)bheight withPara:(NSDictionary *)param;
-(void) showBannerAbsolute:(int)x withY:(int)y bannerWidth:(int)bwidth bannerHeight:(int)bheight withPara:(NSDictionary *)param;
-(void) hideBanner;
@end
