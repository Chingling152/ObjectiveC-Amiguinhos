//
//  AmiguinhoModel.h
//  Appteste
//
//  Created by Space Needle on 05/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import <Foundation/Foundation.h>

NS_ASSUME_NONNULL_BEGIN
// .h são arquivos de inferface
@interface AmiguinhoModel : NSObject//tudo aqui fica publico

@property (readonly) NSInteger age;

//instanceType : tipo da instancia atual
- (instancetype) initAmiguinho:(NSString *)firstName
                      lastName:(NSString *)lastName
                           age:(NSInteger)age;

- (NSString *) fullName;

@end

NS_ASSUME_NONNULL_END
