

#import <Foundation/Foundation.h>

@protocol AdmobWebPluginDelegate <NSObject>
@required
-(void) fireEvent:(NSString*) eventType withEventData:(NSString*) jsonString;
@end
