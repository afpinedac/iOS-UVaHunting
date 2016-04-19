//
//  UvaClient.m
//  iterm
//
//  Created by Andres Pineda on 4/19/16.
//  Copyright © 2016 Andres Pineda. All rights reserved.
//


#import "UvaClient.h"



@implementation UVAClient:NSObject

-(NSArray * ) readData: (NSString*) url {
    
    
    @try{
        
        NSError * error = NULL;
        NSData * data = [NSData dataWithContentsOfURL:[NSURL URLWithString:url]];
        
        NSArray * response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if(error != NULL){
            NSLog(@"We had an error in the request:  %@", error);
        }
        
        // NSLog(@"%@, %@", [response valueForKey:@"subs"], error);
        
        return response;
        
    }@catch(NSException * e){
        NSLog(@"Error making the requests");
    }
    
    
}


-(NSString * ) convertUserNameToID : (NSString*) username {
    return  [[NSString alloc] init];
}

-(NSArray * ) getSubmissions:(int)userID {
    
    NSString * EP = @"http://uhunt.felix-halim.net/api/subs-user/";
    
    NSArray* data = [self readData:[NSString stringWithFormat:@"%@%d", EP, userID]];
    return data;
}

-(NSArray * ) getProblemsList {
    
    NSString * EP = @"http://uhunt.felix-halim.net/api/p";
    
    return [self readData:EP];
}

@end

