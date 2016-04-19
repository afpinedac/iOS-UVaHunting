#import "Foundation/Foundation.h"
#import "UvaClient.h"
#import "Util.h"
#import "View.h"



//START THE APPLICATION;
int main(){
    
    UVAClient * UvaClient = [[UVAClient alloc] init];
    
    bool exit = NO;
    while(!exit){
        
        [View displayMenu];
        
        NSString * option = [Util scanf];
        int selectedOption = [option intValue];
        
        switch (selectedOption) {
            case 1:
                NSLog(@"Getting submission list");
                [Util displayData:[UvaClient getSubmissions:[[Util scanf] intValue]]];
                break;
                
            case 2:
                NSLog(@"Getting problems full list");
                [Util displayData:[UvaClient getProblemsList]];
                break;
            case 3:
                [Util displayData:[UvaClient getProblem:[[Util scanf] intValue]]];
            case 4:
            case 5:
            case 6:
            case 7:
            case 8:
            case 9:
                NSLog(@"To be implemented");
                break;
                
            case 10 :
                exit = YES;
            default:
                break;
        }
        
    }
    
    NSLog(@"Finishing the application");
    
    
}