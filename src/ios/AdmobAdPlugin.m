
#import "AdmobAdPlugin.h"
#import <AdmobAPI/AdmobAPI.h>
//#import <AdmobAPI/AdmobBannerController.h>
#import <UIKit/UIKit.h>
@implementation AdmobAdPlugin
@synthesize admobAPI;
@synthesize srcFrame,lastPosition;
#pragma mark   private util Function------------------
-(void) fireEvent:(NSString*) eventType withEventData:(NSString*) jsonData{
    NSString *js =@"cordova.fireDocumentEvent('%@',{ 'data': '%@' });";
    NSString *json=[NSString stringWithFormat:js,eventType,jsonData];
   //[self writeJavascript:json];
    [[self commandDelegate ]evalJs:json];
}
#pragma mark   CDVPlugin Function------------------
/*
- (CDVPlugin *)initWithWebView:(UIWebView *)theWebView {
    self = (AdmobAdPlugin *)[super initWithWebView:theWebView];
    if (self) {
        admobAPI=[[AdmobAPI alloc] init];
        admobAPI.plugin=self;
    }
    return self;
}
 */
- (void)pluginInitialize
{
    admobAPI=[[AdmobAPI alloc] init];
    admobAPI.plugin=self;
}

-(void) updateWebView:(int)position bannerWidth:(int) bwidth bannerHeight:(int) bheight{
    if(!(position<=9&&lastPosition<=9)&&position!=lastPosition){
        lastPosition=position;
        CGRect adFrame=[admobAPI bannerFrame];//.frame;
        CGRect webFrame=[self.webView frame];
      
        if(srcFrame.size.height==0){
            srcFrame=CGRectMake(webFrame.origin.x, webFrame.origin.y, webFrame.size.width, webFrame.size.height);
        }
        if(position==10){//top
            webFrame.size.height=srcFrame.size.height-adFrame.size.height;
            webFrame.origin.y= srcFrame.origin.y+adFrame.size.height;
        }else if(position==11){//bottom
            webFrame.size.height=srcFrame.size.height-adFrame.size.height;
            webFrame.origin.y=srcFrame.origin.y;
        }else{
            webFrame.size.height=srcFrame.size.height;
            webFrame.origin.y= srcFrame.origin.y;
        }
        self.webView.frame=webFrame;
        NSString* js=@"window.scrollBy(1, 20); window.scrollBy(-1, -20);";
        [[self commandDelegate ]evalJs:js];
        //[self.webView reload];//reload can fix banner over webview problem,but will reload the page.
        
        //transform can fix banner over webview problem too 
        //self.webView.transform = CGAffineTransformMakeScale(webFrame.size.width / srcFrame.size.width, webFrame.size.height / srcFrame.size.height);
    }
}
#pragma mark   Cordova API Function------------------
- (void)admobHideBanner:(CDVInvokedUrlCommand *)command {
    [admobAPI hideBanner];
    [self updateWebView:0 bannerWidth:0 bannerHeight:0];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
- (void)admobShowBannerAbsolute:(CDVInvokedUrlCommand *)command {
    NSDictionary *params = [command argumentAtIndex:0];
    /*int adx=(int)[params integerValueForKey:@"x" defaultValue:0];
    int ady=(int)[params integerValueForKey:@"y" defaultValue:0];
    int width= (int)[params integerValueForKey:@"bannerWidth" defaultValue:0];
    int height=(int) [params integerValueForKey:@"bannerHeight" defaultValue:0];
    */
    int adx=(int) [[params objectForKey:@"x"] integerValue];
    int ady=(int) [[params objectForKey:@"y"] integerValue];
    int width= (int)[[params objectForKey:@"bannerWidth"] integerValue];
    int height=(int) [[params objectForKey:@"bannerHeight"] integerValue];
    
    NSDictionary *extra=[params objectForKey:@"param"];
    
    [admobAPI showBannerAbsolute:adx withY:ady bannerWidth:width bannerHeight:height withPara:extra];
    
    [self updateWebView:0 bannerWidth:width bannerHeight:height];
    
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
- (void)admobShowBanner:(CDVInvokedUrlCommand *)command {
    NSDictionary *params = [command argumentAtIndex:0];
    int position=(int) [[params objectForKey:@"position"] integerValue];
    int width= (int)[[params objectForKey:@"bannerWidth"] integerValue];
    int height=(int) [[params objectForKey:@"bannerHeight"] integerValue];
    NSDictionary *extra=[params objectForKey:@"param"];
    [admobAPI showBanner:position bannerWidth:width bannerHeight:height withPara:extra];
    
    [self updateWebView:position bannerWidth:width bannerHeight:height];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
- (void)admobInitAdmob:(CDVInvokedUrlCommand *)command {
    NSDictionary *params = [command argumentAtIndex:0];
    NSString *bannerID=[params objectForKey:@"bannerID"];
    NSString *intertitialID=[params objectForKey:@"intertitialID"];
    [admobAPI initAdmob:bannerID with:intertitialID];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
- (void)admobIsInterstitialReady:(CDVInvokedUrlCommand *)command {
    BOOL isready=[admobAPI isInterstitialReady];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK messageAsBool:isready] callbackId:command.callbackId];
}
- (void)admobShowInterstitial:(CDVInvokedUrlCommand *)command {
    [admobAPI showInterstitial];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
- (void)admobCacheInterstitial:(CDVInvokedUrlCommand *)command {
    NSDictionary *params = [command argumentAtIndex:0];
    [admobAPI cacheInterstitial:params];
    [self.commandDelegate sendPluginResult:[CDVPluginResult resultWithStatus:CDVCommandStatus_OK] callbackId:command.callbackId];
}
@end
