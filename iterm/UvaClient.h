//
//  UvaClient.h
//  iterm
//
//  Created by Andres Pineda on 4/19/16.
//  Copyright © 2016 Andres Pineda. All rights reserved.
//

#ifndef UvaClient_h
#define UvaClient_h


#endif /* UvaClient_h */


#import <Foundation/Foundation.h>

@interface UVAClient:NSObject
    @property NSString * API_ENDPOINT;

-(NSArray * ) getSubmissions:(int)userID;
-(NSArray * ) getProblemsList ;
@end
