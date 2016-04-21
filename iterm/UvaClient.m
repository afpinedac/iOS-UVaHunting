

#import "UvaClient.h"

NSString * const UVA_API_URL = @"http://uhunt.felix-halim.net/api/{endpoint}";

@implementation UVAClient:NSObject

/*CONVERT A USERNAME INTO A USERID*/

-(NSArray * ) convertUserNameToID : (NSString*) username {
    return [self readData:[UVAClient generateURL:[NSString stringWithFormat:@"/uname2uid/%@", username]]];
}

/* READ ALL THE SUBMISSIONS OF A USER */
-(NSArray * ) getUserSubmissions:(int)userID {
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

/*RETURN THE SUBMISSIONS TO A PROBLEM*/

-(NSArray * ) getSubmissionsToaProblem: (int) pid {

    return [[NSArray alloc] init];
}
/*RETURN THE PROBLEM RANKING*/

-(NSArray * ) getProblemRanking: (int)pid rank:(int)rank count:(int)count {
    return [self readData:[UVAClient generateURL:[NSString stringWithFormat:@"/rank/%d/%d/%d", pid, rank, count]]];
}

-(NSArray * ) getUserRanking: (int)uid nabove:(int)nabove nbelow:(int)nbelow {
    return [self readData:[UVAClient generateURL:[NSString stringWithFormat:@"/ranklist/%d/%d/%d", uid,nbelow,nabove]]];

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
        
NSLog(@">>%d", [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error]);
        NSArray * response = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
        
        if(error != NULL){
            //wasn't able to convert the response in a json then it is just a text
            return @[[[NSString alloc] initWithData:data encoding:NSUTF8StringEncoding]];
        }
        return response;
        
    }@catch(NSException * e){
        NSLog(@"Error making the requests\n");
        NSLog(@"An exception occurred: %@\n", e.name);
        NSLog(@"Here are some details: %@\n", e);
    }
    
}


@end

