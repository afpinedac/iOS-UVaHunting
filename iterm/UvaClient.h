
#ifndef UvaClient_h
#define UvaClient_h


#endif /* UvaClient_h */

#import <Foundation/Foundation.h>


extern NSString *const MyThingNotificationKey;

@interface UVAClient:NSObject
    @property NSString * API_ENDPOINT ;

-(NSArray * ) getSubmissions:(int)userID;
-(NSArray * ) getProblemsList ;
+(NSString * ) generateURL:(NSString *) endpoint;
@end
