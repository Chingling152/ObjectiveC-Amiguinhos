//
//  AmiguinhoViewController.h
//  Appteste
//
//  Created by Space Needle on 07/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import "ViewController.h"

#import "AmiguinhoModel.h"

NS_ASSUME_NONNULL_BEGIN

@interface AmiguinhoViewController : ViewController

@property AmiguinhoModel *amiguinho;

- (void) initWithAmiguinho:(AmiguinhoModel *) amiguinho;


@end

NS_ASSUME_NONNULL_END
