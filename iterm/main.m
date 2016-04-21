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
        
        
        //options to select
        int pid, rank, count;
        
        switch (selectedOption) {
            case 1:
                NSLog(@"Getting submission list");
                [Util displayData:[UvaClient getUserSubmissions:[[Util scanf] intValue]]];
                break;
                
            case 2:
                NSLog(@"Getting problems full list");
                [Util displayData:[UvaClient getProblemsList]];
                break;
            case 3:
                [Util displayData:[UvaClient getProblem:[[Util scanf] intValue]]];
            case 4:
                //[Util displayData:[UvaClient  ]]
                break;
            case 5:
                NSLog(@"Getting problem ranklist");
                pid = [[Util scanf] intValue];
                rank = [[Util scanf] intValue];
                count = [[Util scanf] intValue];
                [Util displayData:[UvaClient getProblemRanking:pid rank:rank count:count]];
                break;
                
            case 6:
            NSLog(@"Getting the user position in ranking");
                [Util displayData:[UvaClient getUserRanking:[[Util scanf] intValue] nabove:[[Util scanf] intValue] nbelow: [[Util scanf] intValue]]] ;                
            case 7:
                [Util displayData:[UvaClient convertUserNameToID:[Util scanf]]];
                break;
                
            case 100:
                break;

            default:
                break;
        }
        
    }
    
    NSLog(@"Finishing the application");
    
    
}