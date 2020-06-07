//
//  AmiguinhoModel.m
//  Appteste
//
//  Created by Space Needle on 05/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import "AmiguinhoModel.h"

//aqui ficam propriedades privadas
@interface AmiguinhoModel ()
    @property (nonatomic,nonnull,strong) NSString *firstName;
    @property (nonatomic,strong) NSString *lastName;
@end

//tudo aqui são implementações da interface em .h
@implementation AmiguinhoModel

- (instancetype) initAmiguinho:(NSString *)firstName lastName:(NSString *)lastName age:(NSInteger)age{
    //aloca na memoria e inicia construtor padrão
    // *amiguinho = [[AmiguinhoModel alloc] init];
    // * são usados pra valores alocados (ponteiros?)
    
    if(self = [super init]){
        if(!firstName)//validação de null
            _firstName = @"Amiguinho";
        else
            _firstName = firstName;
        
        if(lastName)
            _lastName = lastName;
        
        if(age)
            _age = age;
    }
    
    return self;
}

- (NSString *) fullName{
    if(_lastName)
        return [NSString stringWithFormat:@"%@ %@",_firstName,_lastName];
    else
        return _firstName;
}

@end
