//
//  MovieDetailViewController.h
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 23/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "../../Model/Movie.h"

@interface MovieDetailViewController : UIViewController

@property (weak) IBOutlet UITableView *tableView;
@property NSString *moviePresentationCellID;
@property NSString *movieOverViewCellID;
@property Movie *movie;

@end

