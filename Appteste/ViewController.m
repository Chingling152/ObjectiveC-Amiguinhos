//
//  ViewController.m
//  Appteste
//
//  Created by Space Needle on 05/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import "ViewController.h"

#import "AmiguinhoModel.h"//models

#import "AmiguinhoTableViewCell.h"//componentes

//Faz a pagina ter metodos de extensão de uma TableViewController
//TODO : Mover pra um componente separado (?)
@interface ViewController ()<UITableViewDataSource,UITableViewDelegate>
@property (weak, nonatomic) IBOutlet UITextField *nameTextField;
@property (weak, nonatomic) IBOutlet UITextField *ageTextField;

@property (weak, nonatomic) IBOutlet UITableView *tableView;

@property (nonatomic,strong) AmiguinhoModel *amiguinho;

@property (nonatomic,strong) NSMutableArray *amiguinhos;

@end

@implementation ViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    _amiguinhos = [[NSMutableArray alloc] init];
    AmiguinhoModel *amiguinho = [[AmiguinhoModel alloc] initAmiguinho:@"Nome" lastName:@"aaaa" age:12];
    
    [_amiguinhos addObject:amiguinho];
    
}

- (void) clearFields{
    self.nameTextField.text = @"";
    self.ageTextField.text = @"";
}

- (IBAction)createMyAmiguinho:(id)sender {
    if(!self.nameTextField.text || [self.nameTextField.text length] == 0){
        return;
    }
    
    if(!self.ageTextField.text || [self.ageTextField.text length] == 0){
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
    
    AmiguinhoModel *amiguinho = [[AmiguinhoModel alloc] initAmiguinho:firstName lastName:lastName age:age];
    
    [_amiguinhos addObject:amiguinho];//adciona
    
    [_tableView reloadData];//recarrega dados
    [self clearFields];//limpa campos
    
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

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return _amiguinhos.count;
}

@end
