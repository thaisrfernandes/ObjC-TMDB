//
//  MovieDetailViewController.m
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 23/03/22.
//

#import "MovieDetailViewController.h"
#import "../MovieOverviewCell/MovieOverviewCell.h"

@interface MovieDetailViewController () <UITableViewDelegate, UITableViewDataSource>
@end

@implementation MovieDetailViewController

-(void)viewDidLoad {
    [super viewDidLoad];
    [self initializeProperties];
    
    self.tableView.rowHeight = UITableViewAutomaticDimension;
    self.tableView.estimatedRowHeight = 900;
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
}

-(void)initializeProperties {
    if(!_movieOverViewCellID) {
        _movieOverViewCellID = @"moviePresentationCell";
    }
    if(!_moviePresentationCellID) {
        _moviePresentationCellID = @"moviePresentationCellID";
    }
    if(!_movie) {
        _movie = [[Movie alloc] init];
    }
}

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView {
    return !_movie ? 0 : 2;
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!_movie.id) {
        [NSException raise:@"InvalidMovie" format:@"No movie was received to diplay"];
    }
    
    if(indexPath.row == 0) {
        MovieOverviewCell *cell = [tableView dequeueReusableCellWithIdentifier:_movieOverViewCellID forIndexPath:indexPath];
        
        //        let cell = tableView.dequeueReusableCell(withIdentifier: moviePresentationCellID, for: indexPath) as! MoviePresentationCell
        //
        //                    cell.imageCover.image = unwrappedMovie.imageCover
        //                    cell.titleLabel.text = unwrappedMovie.title
        //                    cell.infoLabel.text = unwrappedMovie.title
        //                    cell.ratingLabel.text = String(unwrappedMovie.rating)
        //
        //                    return cell
        return cell;
    } else {
        MovieOverviewCell *cell = [tableView dequeueReusableCellWithIdentifier:_movieOverViewCellID forIndexPath:indexPath];
        
        cell.titleLabel.text = @"Overview";
        cell.descriptionLabel.text = _movie.overview;
        
        return cell;
    }
}

@end

