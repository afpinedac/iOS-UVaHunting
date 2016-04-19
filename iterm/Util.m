//
//  Util.m
//  iterm
//
//  Created by Andres Pineda on 4/19/16.
//  Copyright © 2016 Andres Pineda. All rights reserved.
//

#import "Util.h"

//CLASSES IMPLEMENTATIONS

@implementation Util
+(NSString*) scanf{
    
    char word[40];
    
    scanf("%s", word);
    
    return [[NSString alloc] initWithCString:word encoding:NSUTF8StringEncoding];
}

+(void) displayData:(NSArray * ) data {
    
    
    NSLog(@"%@", data);
    
    //    for(NSString * key in data){
    //     NSLog(@"KEY : %@\n", key);
    //   NSLog(@"VALUE : %@\n", [data valueForKey:key]);
    //    }
    
}
@end