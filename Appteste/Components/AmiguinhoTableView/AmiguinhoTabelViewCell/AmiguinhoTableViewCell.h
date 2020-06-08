//
//  AmiguinhoTableViewCell.h
//  Appteste
//
//  Created by Space Needle on 05/06/20.
//  Copyright © 2020 Space Needle. All rights reserved.
//

#import <UIKit/UIKit.h>

NS_ASSUME_NONNULL_BEGIN

@protocol AmiguinhoCellProtocol <NSObject>

- (void) deleteCell:(NSIndexPath *) indexPath;

@end

//COmponente que herda de TableViewCell
@interface AmiguinhoTableViewCell : UITableViewCell

@property (weak, nonatomic) IBOutlet UILabel *nameLabel;
@property (weak, nonatomic) IBOutlet UILabel *ageLabel;

@property (nonatomic,weak) id <AmiguinhoCellProtocol> delegate;
- (IBAction)onDeleteButtonClicked:(id)sender;

@end

NS_ASSUME_NONNULL_END
