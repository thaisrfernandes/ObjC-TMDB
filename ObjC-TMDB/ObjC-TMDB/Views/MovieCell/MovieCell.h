//
//  MovieCell.h
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 23/03/22.
//

#import <UIKit/UIKit.h>


@interface MovieCell : UITableViewCell

@property (weak) IBOutlet UIImageView *coverImage;
@property (weak) IBOutlet UILabel *titleLabel;
@property (weak) IBOutlet UILabel *overviewLabel;
@property (weak) IBOutlet UILabel *rating;

@end
