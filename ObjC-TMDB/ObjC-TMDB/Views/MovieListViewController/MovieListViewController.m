//
//  MovieListViewController.m
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 23/03/22.
//

#import "MovieListViewController.h"
#import "../MovieDetailViewController/MovieDetailViewController.h"
#import "../MovieCell/MovieCell.h"

@interface MovieListViewController () <UITableViewDelegate, UITableViewDataSource, UISearchResultsUpdating>

@end

@implementation MovieListViewController


//MARK: Class setup
-(void)viewDidLoad {
    [super viewDidLoad];
    [self initializeProperties];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
    self.searchController = [[UISearchController alloc] initWithSearchResultsController:nil];
    self.searchController.searchResultsUpdater =  self;
    self.searchController.obscuresBackgroundDuringPresentation = false;
    self.navigationItem.searchController = self.searchController;
    
    
    [_service requestMovies:@"popular" :@1 andCompletionHandler:^(NSMutableArray<Movie *> * _Nullable movies) {
        self.popularMovies = movies;
        self.filteredPopularMovies = movies;

        dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
              });
    }];
    
    
    [_service requestMovies:@"now_playing" :@1 andCompletionHandler:^(NSMutableArray<Movie *> * _Nullable movies) {
       self.nowPlayingMovies = movies;
       self.filteredNowPlayingMovies = movies;

        dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
              });
    }];
}
    

//MARK: Segues - To Movie Details
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    if ([[segue identifier] isEqualToString:@"toMovieDetails"] && [sender isKindOfClass:[NSIndexPath class]]) {
        MovieDetailViewController* destination = [segue destinationViewController];
        
        NSIndexPath* indexPath = sender;
        
        if (indexPath.section == 0) {
            destination.movie = _popularMovies[indexPath.row];
        }
        else {
            destination.movie = _nowPlayingMovies[indexPath.row];
        }
    }
}


-(void)initializeProperties {
    if(!_service) {
        _service = [[TMDBService alloc] init];
    }
    if(!_filteredPopularMovies){
        _filteredPopularMovies = [NSMutableArray array];
    }
    if(!_filteredNowPlayingMovies){
        _filteredNowPlayingMovies = [NSMutableArray array];
    }
    if(! _popularMovies){
        _popularMovies = [NSMutableArray array];
    }
    if(! _nowPlayingMovies){
        _nowPlayingMovies = [NSMutableArray array];
    }
    if(! _cellID){
        _cellID =  @"movieCell";
    }
}


//MARK: - TableView - Delegate

//MARK: Row Selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [self performSegueWithIdentifier:@"toMovieDetails" sender:indexPath];
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString* title = @"";

    if (section == 0) {
        title = @"Popular Movies";
    }else if (section == 1){
        title = @"Now Playing";
    }
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 60)];
    header.backgroundColor = [UIColor clearColor];
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 16, [[UIScreen mainScreen] bounds].size.width, 22)];
    label.text = title;
    label.font = [UIFont systemFontOfSize:17 weight: UIFontWeightSemibold ];
            
    [header addSubview:label];
    return header;
}


//MARK: - TableView - DataSource

//MARK: Row in section setup

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{
    if(_filteredPopularMovies.count > 0 && section == 0){
        return _filteredPopularMovies.count > 2 ? 2 : _filteredPopularMovies.count;
    }
    if( section == 1){
        return _filteredNowPlayingMovies.count;
    }
    return 0;
}

//MARK: Section count setup
- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{
    return 2;
}

//MARK: Cell setup

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{
    
    MovieCell *cell = [tableView dequeueReusableCellWithIdentifier:_cellID forIndexPath:indexPath];

    Movie *movie = indexPath.section == 0 ? _filteredPopularMovies[indexPath.row] : _filteredNowPlayingMovies[indexPath.row];
    
    cell.coverImage.image = movie.imageCover;
    cell.titleLabel.text = movie.title;
    cell.overviewLabel.text = movie.overview;
    cell.rating.text = [NSString stringWithFormat: @"%@", movie.rating];

    return cell;
}

//MARK: - SearchControllerDelegate

//MARK: Update view while searching
- (void)updateSearchResultsForSearchController:(UISearchController *)searchController{
    NSString* searchText = searchController.searchBar.text ? searchController.searchBar.text: @"";
    
    if([searchText length] == 0){
        _filteredPopularMovies = _popularMovies;
        _filteredNowPlayingMovies = _nowPlayingMovies;
    }else{
        [_filteredNowPlayingMovies removeAllObjects];
        [_filteredPopularMovies removeAllObjects];
        NSArray *arrayMovies=_popularMovies?[_popularMovies arrayByAddingObjectsFromArray:_nowPlayingMovies]:[[NSArray alloc] initWithArray:_nowPlayingMovies];
        for(Movie* movie in arrayMovies){
            NSString* searchTextLowercased = [NSString stringWithFormat:@"%@", searchText.lowercaseString];
            if([movie.title.lowercaseString containsString:(searchTextLowercased)]){
                if([_popularMovies containsObject:movie] && ![_filteredPopularMovies containsObject:movie]){
                    [_filteredPopularMovies addObject:movie];
                }
                if([_nowPlayingMovies containsObject:movie] && ![_filteredNowPlayingMovies containsObject:movie]){
                    [_filteredNowPlayingMovies addObject:movie];
                }
            }
        }
    }
    [self.tableView reloadData];
}


@end
