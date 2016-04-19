

#import "UvaClient.h"

NSString * const UVA_API_URL = @"http://uhunt.felix-halim.net/api/{endpoint}";

@implementation UVAClient:NSObject

/*CONVERT A USERNAME INTO A USERID*/

-(NSString * ) convertUserNameToID : (NSString*) username {
    return  [[NSString alloc] init];
}

/* READ ALL THE SUBMISSIONS OF A USER */
-(NSArray * ) getSubmissions:(int)userID {
    NSArray* data = [self readData:[UVAClient generateURL:[NSString stringWithFormat:@"/subs-user/%d", userID]]];
    return data;
}


/*RETURN THE FULL LIST OF PROBLEMS */
-(NSArray * ) getProblemsList {
    return [self readData:[UVAClient generateURL:@"/p"]];
}

/*RETURN THE PROBLEM INFORMATION */
-(NSArray * ) getProblem: (int) pid{
    NSArray *data = [self readData:[UVAClient generateURL:[NSString stringWithFormat:@"/p/id/%d", pid]]];
    return data;
}



/* GENERATE THE LINK TO THE ENDPOINT */
+(NSString * ) generateURL:(NSString *) endpoint {
    //remove the slash
    if([endpoint length] >0 && [endpoint hasPrefix:@"/"]){
        endpoint = [endpoint substringFromIndex:1];
    }
    
    return [UVA_API_URL stringByReplacingOccurrencesOfString:@"{endpoint}" withString: endpoint];
}
/*------------------------------*/



/* READ A URL AND RETURN THE CONTENT AS A JSON */
-(NSArray * ) readData: (NSString*) url {
    
    NSLog(@"calling the URL %@", url );
    
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
        NSLog(@"Error making the requests\n");
        NSLog(@"An exception occurred: %@\n", e.name);
        NSLog(@"Here are some details: %@\n", e);
    }
    
}


@end

