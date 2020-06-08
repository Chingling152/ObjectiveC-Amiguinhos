//
//  AmiguinhoRepository.m
//  Appteste
//
//  Created by Space Needle on 07/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import "AmiguinhoRepository.h"

NSString *const URL = @"https://5edd5cadae06ed0016ee34fc.mockapi.io/api/amiguinho";

@implementation AmiguinhoRepository

-(void) createAmiguinho:(AmiguinhoModel *) amiguinho{
    NSMutableURLRequest *request =  [NSMutableURLRequest new];
    
    [request setURL:[NSURL URLWithString:URL]];
    [request setValue:@"application/json" forHTTPHeaderField:@"Content-Type"];
    [request setValue:@"application/json" forHTTPHeaderField:@"Accept"];
    
    //[NSDictionary ]
    
    [request setHTTPBody:<#(NSData * _Nullable)#>]
}

-(NSMutableArray *) getAllAmiguinhos{
    NSMutableArray *amiguinhos = [NSMutableArray new];
    NSError *error;
    NSData *data = [NSData dataWithContentsOfURL:[NSURL URLWithString:URL]];
    
    NSMutableArray *arr = [NSJSONSerialization JSONObjectWithData:data options:kNilOptions error:&error];
    
    if(!error && arr){
        for (NSDictionary *item in arr) {
            [amiguinhos addObject:[[AmiguinhoModel alloc] initAmiguinhoFromJson:item]];
        }
    }
    return amiguinhos;

}
@end
