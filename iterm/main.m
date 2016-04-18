#import <Foundation/Foundation.h>



@interface UVAClient:NSObject
@end



@implementation UVAClient:NSObject

 NSString *API_ENDPOINT = @"http://uhunt.felix-halim.net/api/";

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
            return  [self readData:username];
}

-(NSArray * ) getSubmissions:(int)userID {
    
    NSString * EP = @"http://uhunt.felix-halim.net/api/subs-user/";
    
    NSArray* data = [self readData:[NSString stringWithFormat:@"%@%d", EP, userID]];
    return data;
}


@end





int main(){
    
    UVAClient * uc = [[UVAClient alloc] init];

    NSArray * response =  [uc getSubmissions:339];
    
    for (NSString * key in response) {
        NSLog(@"%@", [response valueForKey:key]);
    }
    
    
    
    
    NSLog(@"%@", [response valueForKey:@"name" ]);
 }