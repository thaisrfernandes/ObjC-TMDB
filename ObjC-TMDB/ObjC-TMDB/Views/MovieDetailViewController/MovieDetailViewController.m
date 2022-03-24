//
//  MovieDetailViewController.m
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 23/03/22.
//

#import "MovieDetailViewController.h"
#import "../MovieOverviewCell/MovieOverviewCell.h"
#import "../MoviePresentationCell/MoviePresentationCell.h"

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
        _movieOverViewCellID = @"movieOverViewCellID";
    }
    if(!_moviePresentationCellID) {
        _moviePresentationCellID = @"moviePresentationCellID";
    }
    if(!_movie) {
        _movie = [[Movie alloc] init];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath {
    if(!_movie.id) {
        [NSException raise:@"InvalidMovie" format:@"No movie was received to diplay"];
    }
    
    NSLog(@"%ld <- print", (long)indexPath.row);
    
    if(indexPath.row == 0) {
        MoviePresentationCell *cell = [tableView dequeueReusableCellWithIdentifier:_moviePresentationCellID forIndexPath:indexPath];
        
        cell.imageCover.image = _movie.imageCover;
        cell.titleLabel.text = _movie.title;
        cell.infoLabel.text = _movie.title;
        cell.ratingLabel.text = [NSString stringWithFormat: @"%@", _movie.rating];

        return cell;
    } else {
        MovieOverviewCell *cell = [tableView dequeueReusableCellWithIdentifier:_movieOverViewCellID forIndexPath:indexPath];
        
        cell.titleLabel.text = @"Overview";
        cell.descriptionLabel.text = _movie.overview;
        
        return cell;
    }
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return 2;
}


@end

