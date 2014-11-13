#import <Foundation/Foundation.h>
#import "GADInterstitialDelegate.h"
#import "AdmobAPI.h"
@class AdmobAPI;
@interface AdmobFullDelege : NSObject <GADInterstitialDelegate>{
}
@property (nonatomic,retain) AdmobAPI* context;
@end
