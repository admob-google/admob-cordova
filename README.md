admob phonegap plugin(cordova plugin for admob)
====================
Google AdMob plugin for Cordova, Phonegap and Intel XDK ,support ios and android,support admob v1 and admob v2 ,Monetize your html5 app with one javascript line.api is easy to use.<br/>
admob phonegap plugin(admob cordova plugin) is built base on 
- phonegap 3.4 or cordova 6.0
- admob ios sdk 7.14.0 
- admob android sdk 9
- project home:https://github.com/admob-google/admob-cordova<br/>
- project can been used with no limit


### 1.install admob phonegap plugin
install with npm

	npm install admob
	cordova plugin add admob

use the cordova command<br/>
download the plugin ,then install with local location

    cordova plugin add c:\phonegap-admob-plugin 

or install cordova plugin online 

    cordova plugin add com.admob.plugin

use the phonegap command<br/>
download the plugin ,then install with local location

    phonegap plugin add c:\phonegap-admob-plugin 

use phonegap builder ,add config<br/>

    <gap:plugin name="com-admob-plugin" version="5.3.1" source="npm"/>
    

### 2.init admob phonegap plugin
init plugin after deviceready event 

    admob.initAdmob("admob banner ID","admob interstitial ID");//admob id format ca-app-pub-xxxxxxxxxxxxxxxxxxx/xxxxxxxxxx

### 3.show banner  at relation position 
there are some banner size in admob.BannerSize,and you can create your own banner size that is available in admob platform.
admob.Position hold all relation position const .

    admob.showBanner(admob.BannerSize.BANNER,admob.Position.TOP_APP);//show banner at the top of app 

and more you can set more param for admob such as test mode and is your app made for child.
```
	var admobParam=new  admob.Params();
        //admobParam.extra={'keyword':"admob phonegame"};
        //admobParam.isForChild=true;
        admobParam.isTesting=true;
        admob.showBanner(admob.BannerSize.BANNER,admob.Position.TOP_CENTER,admobParam);
```
### 4.show banner  at absolute position
you can put admob banner at absolute position as easy as relation position.

    admob.showBannerAbsolute(admob.BannerSize.BANNER,0,70);//show banner at absolute position x 0,y 70

###  5.show admob Interstitial 
show admob Interstitial in phonegap,cordova or xdk application is the same step.
cache Interstitial ,and then show it in onInterstitialReceive function or show it when your game over.
```
 document.addEventListener(admob.Event.onInterstitialReceive, onInterstitialReceive, false);//show in ad receive event fun need add receive listener
 admob.cacheInterstitial();// load admob Interstitial
 function onInterstitialReceive(message) {//show in ad receive event fun
     admob.showInterstitial();
 }
 function onGameOver(){//call this fun to show when game over
        admob.isInterstitialReady(function(isReady){
            if(isReady){
                admob.showInterstitial();
            }
        });
  }
```
###  6.handle admob ad event
you can handler all native event of admob ,as onInterstitialReceive <br/>
all event type is in admob.Event<br/>
```
function onAdmobEvent (message) {
    //do some on admob event
}
document.addEventListener(admob.Event.onAdmobBannerDismiss, onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobBannerFailedReceive), onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobBannerLeaveApplication), onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobBannerPresent), onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobBannerReceive), onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobInterstitialDismiss), onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobInterstitialFailedReceive), onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobInterstitialLeaveApplication), onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobInterstitialPresent), onAdmobEvent, false);
document.addEventListener(admob.Event.onAdmobInterstitialReceive), onAdmobEvent, false);
```
###  7.more function
1.hide admob banner

    admob.hideBanner()

2.test if Interstitial has loaded success
```
admob.isInterstitialReady(function(isReady){
    if(isReady){
        alert("admob Interstitial loaded");
    }
});
```

3.for more usage ,ref to files in Example folder ,it is a good way to get start<br/>

4. Admob sdk for ios used IDFA ,so remember to check up app service as ad.

email:gooogleadmob@gmail.com


## Screenshots (banner Ad / interstitial Ad) ##

![ScreenShot](https://github.com/admob-google/admob-cordova/blob/master/resource/screenshot/admob0.png?raw=true)
![ScreenShot](https://github.com/admob-google/admob-cordova/blob/master/resource/screenshot/admob5.png?raw=true)

