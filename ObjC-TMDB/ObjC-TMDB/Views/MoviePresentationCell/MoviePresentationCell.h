//
//  MoviePresentationCell.h
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 23/03/22.
//

#import <UIKit/UIKit.h>


@interface MoviePresentationCell : UITableViewCell

@property (weak) IBOutlet UIImageView *imageCover;
@property (weak) IBOutlet UILabel *titleLabel;
@property (weak) IBOutlet UILabel *infoLabel;
@property (weak) IBOutlet UILabel *ratingLabel;

@end


