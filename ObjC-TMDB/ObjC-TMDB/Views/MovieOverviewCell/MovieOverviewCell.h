//
//  OverviewCell.h
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 23/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MovieOverviewCell : UITableViewCell

@property (weak) IBOutlet UILabel *titleLabel;
@property (weak) IBOutlet UILabel *descriptionLabel;

@end
