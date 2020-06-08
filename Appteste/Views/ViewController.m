//
//  ViewController.m
//  Appteste
//
//  Created by Space Needle on 05/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import "ViewController.h"

#import "AmiguinhoRepository.h"//repository

#import "AmiguinhoModel.h"//models

#import "AmiguinhoTableViewCell.h"//componentes

#import "AmiguinhoViewController.h"

//Faz a pagina ter metodos de extensão de uma TableViewController
//TODO : Mover pra um componente separado (?)
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>

@property (strong,nonatomic) AmiguinhoRepository *repos;

// Input de nome (Da pra fazer um componente disso)
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UILabel *nameErrorMessage;

//Input idade
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;
@property (weak, nonatomic) IBOutlet UILabel *ageErrorMessage;

//Table View
@property (weak, nonatomic) IBOutlet UITableView *tableView;
//Table View Data
@property (nonatomic,strong) NSMutableArray *amiguinhos;

@property (nonatomic) NSInteger selectedAmiguinho;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
}

- (void) viewDidAppear:(BOOL)animated{
    [self getAmiguinhos];
    [_amiguinhos addObject:[[AmiguinhoModel alloc] initAmiguinho:@"Nome" lastName:@"aaaa" age:12]];
}

-(void) getAmiguinhos{
    _repos = [[AmiguinhoRepository alloc] init];
    _amiguinhos = [_repos getAllAmiguinhos];
    [_tableView reloadData];
}

- (void) clearFields{
    self.nameTextField.text = @"";
    self.ageTextField.text = @"";
    self.nameErrorMessage.hidden = YES;
    self.ageErrorMessage.hidden = YES;
}

- (IBAction)createMyAmiguinho:(id)sender {
    if(!self.nameTextField.text || [self.nameTextField.text length] == 0){
        self.nameErrorMessage.hidden = NO;
        self.nameErrorMessage.text = @"Seu amiguinho precisa de um nome";
        return;
    }
    
    //TODO: Talvez um metodo pra validação melhor
    if(!self.ageTextField.text || [self.ageTextField.text length] == 0){
        self.ageErrorMessage.hidden = NO;
        self.ageErrorMessage.text = @"Seu amiguinho precisa de idade";
        return;
    }
        
    //separa por espaços o sobrenome
    NSArray *fullName = [self.nameTextField.text componentsSeparatedByString:@" "];
    NSInteger size = (NSInteger)[fullName count];
    
    NSString *firstName = fullName[0];
    NSString *lastName = @"";
    
    if(size > 1)
        lastName = [[fullName subarrayWithRange:NSMakeRange(1,size-1)] componentsJoinedByString:@" "];
    
    NSInteger age = [self.ageTextField.text integerValue];
    
    if(age < 1 || age > 120){//120 pq eu quero
        self.ageErrorMessage.hidden = NO;
        self.ageErrorMessage.text = @"Idade do seu amiguinho é invalida";
        return;
    }
    
    AmiguinhoModel *amiguinho = [[AmiguinhoModel alloc] initAmiguinho:firstName lastName:lastName age:age];
    
    [_amiguinhos addObject:amiguinho];//adciona
    
    [_tableView reloadData];//recarrega dados
    [self clearFields];//limpa campos
    
}
//metodo chamado antes do redirecionamento
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender{
    if ([segue.identifier isEqualToString:@"goto_amiguinho"]) {//verifica um segue (fdefinido da UI do storyboard
        AmiguinhoViewController *contr = (AmiguinhoViewController *)segue.destinationViewController;
        
        contr.amiguinho = self.amiguinhos[_selectedAmiguinho];
    }
}

- (void)touchesBegan:(NSSet<UITouch *> *)touches withEvent:(UIEvent *)event{
    [self.view endEditing:YES];
}

#pragma metodo de extensão pra classe tableView
- (nonnull UITableViewCell *)
tableView:(nonnull UITableView *)tableView//define a classe que vai ter extensão
cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {//define metodo (nesse caso há parametros)
    static NSString *cellId = @"amiguinhoCell";
    AmiguinhoTableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:cellId];
    
    AmiguinhoModel *model = _amiguinhos[indexPath.row];
    cell.ageLabel.text = [NSString stringWithFormat:@"%ld", model.age];
    cell.nameLabel.text = model.fullName;
    
    return cell;
}

- (NSInteger)
tableView:(nonnull UITableView *)tableView
numberOfRowsInSection:(NSInteger)section {
    return _amiguinhos.count;
}

- (void)
tableView:(UITableView *)tableView
didSelectRowAtIndexPath:(NSIndexPath *)indexPath{
    _selectedAmiguinho = indexPath.row;//seleciona a linha clicada
    [self performSegueWithIdentifier:@"goto_amiguinho" sender:tableView];//faz um redirecionamento para um segue nomeado
}

@end
