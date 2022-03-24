//
//  MovieListViewController.h
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 23/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "../../Model/TMDBService.h"


@interface MovieListViewController : UIViewController

@property (weak) IBOutlet UITableView * tableView;

- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id  )sender;

@property TMDBService *  service;

@property NSMutableArray<Movie*>*  filteredPopularMovies;
@property NSMutableArray<Movie*>*  filteredNowPlayingMovies;
@property NSMutableArray<Movie*>*  popularMovies;
@property NSMutableArray<Movie*>*  nowPlayingMovies;
@property NSString*  cellID;
@property UISearchController*  searchController;

@end




