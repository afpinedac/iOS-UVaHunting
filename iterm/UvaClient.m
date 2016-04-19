

#import "UvaClient.h"

NSString * const UVA_API_URL = @"http://uhunt.felix-halim.net/api/{endpoint}";

@implementation UVAClient:NSObject

/*CONVERT A USERNAME INTO A USERID*/

-(NSString * ) convertUserNameToID : (NSString*) username {
    return  [[NSString alloc] init];
}

/* READ ALL THE SUBMISSIONS OF A USER */
-(NSArray * ) getSubmissions:(int)userID {
    NSArray* data = [self readData:[UVAClient generateURL:[NSString stringWithFormat:@"/api/subs-user/%d", userID]]];
    return data;
}


/*RETURN THE FULL LIST OF PROBLEMS */
-(NSArray * ) getProblemsList {
    return [self readData:[UVAClient generateURL:@"/p"]];
}


/* GENERATE THE LINK TO THE ENDPOINT */
+(NSString * ) generateURL:(NSString *) endpoint {
    
    return [UVA_API_URL stringByReplacingOccurrencesOfString:@"{endpoint}" withString: endpoint];
}
/*------------------------------*/



/* READ A URL AND RETURN THE CONTENT AS A JSON */
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


@end

