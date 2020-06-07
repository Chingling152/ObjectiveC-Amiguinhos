//
//  AmiguinhoViewController.m
//  Appteste
//
//  Created by Space Needle on 07/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import "AmiguinhoViewController.h"

@interface AmiguinhoViewController ()

@property (weak, nonatomic) IBOutlet UILabel *nomeAmiguinho;

@end
	
@implementation AmiguinhoViewController

- (void)viewDidLoad {
    [super viewDidLoad];
    
    if(!_amiguinho)
        [self.navigationController popViewControllerAnimated:YES];
    else
        _nomeAmiguinho.text = _amiguinho.fullName;
}

- (void) initWithAmiguinho:(AmiguinhoModel *) amiguinho{
    
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
