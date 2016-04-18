#import <Foundation/Foundation.h>


//INTERFACE DECLARATIONS
@interface UVAClient:NSObject
@end

@interface Util:NSObject
@end

@interface View:NSObject

@end



//CLASSES IMPLEMENTATIONS

@implementation Util
+(NSString*) scanf{
    
    char word[40];
    
    scanf("%s", word);
    
    return [[NSString alloc] initWithCString:word encoding:NSUTF8StringEncoding];
}

+(void) displayData:(NSArray * ) data {
    
    for(NSString * key in data){
        NSLog(@"KEY : %@\n", key);
        NSLog(@"VALUE : %@\n", [data valueForKey:key]);
    }
    
}
@end

@implementation View
+(void) displayMenu {
    NSLog(@"Select an option:\n");
        NSLog(@"1. List submissions:\n");
        NSLog(@"2. TODO \n");
            NSLog(@"10. EXIT \n");

}
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




//START THE APPLICATION;
int main(){
    
    UVAClient * UvaClient = [[UVAClient alloc] init];

    
    
    while(true){
        
        NSString * option = [Util scanf];
        
        [View displayMenu];
        
        if([option isEqualToString:@"1"]){
            [Util displayData:[UvaClient getSubmissions:[[Util scanf] intValue]]];
        }else if([option isEqualToString:@"10"]){
            NSLog(@"Saliendo de la aplicación..");
            break;
        }else{
            NSLog(@"Invalid option");
        }
    }
    
    
    
    
//    NSLog(@"@the option selected was %@", );
    
    
    
    

/*    NSArray * response =  [uc getSubmissions:339];
    
    for (NSString * key in response) {
        NSLog(@"%@", [response valueForKey:key]);
    }  
    
    
    
    NSLog(@"%@", [response valueForKey:@"name" ]);*/
 }