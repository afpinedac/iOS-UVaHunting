#import "Foundation/Foundation.h"
#import "UvaClient.h"
#import "Util.h"
#import "View.h"



//START THE APPLICATION;
int main(){
    
    UVAClient * UvaClient = [[UVAClient alloc] init];
    while(true){
        
        [View displayMenu];
        
        NSString * option = [Util scanf];
        if([option isEqualToString:@"1"]){
            NSLog(@"Getting submission list");
            [Util displayData:[UvaClient getSubmissions:[[Util scanf] intValue]]];
        }else if([option isEqualToString:@"2"]){
            NSLog(@"Getting problem list");
            [Util displayData:[UvaClient getProblemsList]];
            break;
        }else if([option isEqualToString:@"10"]){
        }            else{
            NSLog(@"Invalid option");
        }
    }
    
    
}