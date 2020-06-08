//
//  AmiguinhoRepository.h
//  Appteste
//
//  Created by Space Needle on 07/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "AmiguinhoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AmiguinhoRepository : NSObject

-(void) createAmiguinho:(AmiguinhoModel *) amiguinho;

-(NSMutableArray *) getAllAmiguinhos;

@end

NS_ASSUME_NONNULL_END
