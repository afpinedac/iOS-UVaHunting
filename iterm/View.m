//
//  View.m
//  iterm
//
//  Created by Andres Pineda on 4/19/16.
//  Copyright © 2016 Andres Pineda. All rights reserved.
//



#import "View.h"


@implementation View
+(void) displayMenu {
    NSLog(@"Select an option:\n");
    NSLog(@"1. List user submissions:\n");
    NSLog(@"2. List all problems in the UVA \n");
    NSLog(@"3. Read information of a specific problem\n");
    NSLog(@"4. Read submissions to specific problem\n");
    NSLog(@"5. Problem ranklist \n");
    NSLog(@"6. User Ranklist\n");
    NSLog(@"7. Convert username into an ID");
    NSLog(@"100. EXIT \n");
}
@end

