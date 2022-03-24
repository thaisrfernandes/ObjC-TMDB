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

@property (weak) IBOutlet UITableView * _Nullable tableView;

- (void)prepareForSegue:(UIStoryboardSegue *_Nullable)segue sender:(id _Nullable )sender;

@property TMDBService * _Nullable service;


@property NSMutableArray<Movie*>* _Nullable filteredPopularMovies;
@property NSMutableArray<Movie*>* _Nullable filteredNowPlayingMovies;
@property NSMutableArray<Movie*>* _Nullable popularMovies;
@property NSMutableArray<Movie*>* _Nullable nowPlayingMovies;
@property NSString* _Nullable cellID;
@property UISearchController* _Nullable searchController;

@end




