
#ifndef UvaClient_h
#define UvaClient_h


#endif /* UvaClient_h */

#import <Foundation/Foundation.h>


extern NSString *const MyThingNotificationKey;

@interface UVAClient:NSObject
    @property NSString * API_ENDPOINT ;

-(NSArray * ) convertUserNameToID : (NSString*) username;
-(NSArray * ) getUserSubmissions:(int)userID;
-(NSArray * ) getProblemsList ;
-(NSArray * ) getProblem: (int) pid ;
-(NSArray * ) getSubmissionsToaProblem: (int) pid ;
-(NSArray * ) getProblemRanking: (int)pid rank:(int)rank count:(int)count;
-(NSArray * ) getUserRanking: (int)uid nabove:(int)nabove nbelow:(int)nbelow;
+(NSString * ) generateURL:(NSString *) endpoint;
@end
