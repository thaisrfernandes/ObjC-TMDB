//
//  MovieListViewController.m
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 23/03/22.
//

#import "MovieListViewController.h"
#import "../../Model/TMDBService.h"
//#import "../MovieOverviewCell/MovieOverviewCell.h"

@interface MovieListViewController () <UITableViewDelegate, UITableViewDataSource>
@property TMDBService * service; //private let service = TMDBService()

@end

@implementation MovieListViewController

NSString* cellID = @"movieCell";


NSArray<Movie*>* filteredPopularMovies = @[];
NSArray<Movie*>* filteredNowPlayingMovies = @[];
NSArray<Movie*>* popularMovies = @[];
NSArray<Movie*>* nowPlayingMovies = @[];

//var searchController = UISearchController(searchResultsController: nil)

//MARK: Class setup
-(void)viewDidLoad {
    [super viewDidLoad];
    [self initializeProperties];
    
    self.tableView.dataSource = self;
    self.tableView.delegate = self;
    
//    navigationItem.searchController = searchController
//    searchController.searchResultsUpdater = self
//    searchController.obscuresBackgroundDuringPresentation = false
    
    
    [_service requestMovies:@"popular" :@1 andCompletionHandler:^(NSArray<Movie *> * _Nullable movies) { //service.requestMovies(type: "popular") { (popularMovies) in
//       self.popularMovies = popularMovies;
//       self.filteredPopularMovies = popularMovies

        dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
              });
    }];
    
    
    [_service requestMovies:@"now_playing" :@1 andCompletionHandler:^(NSArray<Movie *> * _Nullable movies) { //service.requestMovies(type: "now_playing") { (nowPlayingMovies) in
//       self.nowPlayingMovies = nowPlayingMovies;
//       self.filteredNowPlayingMovies = nowPlayingMovies

        dispatch_async(dispatch_get_main_queue(), ^{
                [self.tableView reloadData];
              });
    }];
    
    

//MARK: Segues - To Movie Details
//    - (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
//    {
//        // Make sure your segue name in storyboard is the same as this line
//        if ([[segue identifier] isEqualToString:@"toMovieDetails"])
//        {
//            NSIndexPath* indexPath = sender{
//
//                if indexPath section
//            }
//        }
//
//    }
    
    
    //override func prepare(for segue: UIStoryboardSegue, sender: Any?) {
    //    if segue.identifier == "toMovieDetails", let indexPath = sender as? IndexPath {
    //        let destination = segue.destination as! MovieDetailViewController
    //
    //        if indexPath.section == 0 {
    //            destination.movie = popularMovies[indexPath.row]
    //        }
    //        else {
    //            destination.movie = nowPlayingMovies[indexPath.row]
    //        }
    //    }
    //}
        
       

}

//MARK: - TableView - Delegate

//extension MovieListViewController:  UITableViewDelegate {

//    MARK: Row Selection
- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath {
    [tableView deselectRowAtIndexPath:indexPath animated:YES];
    //performSegue(withIdentifier: "toMovieDetails", sender: indexPath)
}

- (UIView *)tableView:(UITableView *)tableView viewForHeaderInSection:(NSInteger)section {
    NSString* title = @"";    //        var title: String = ""

    if (section == 0) {
        title = @"Popular Movies";
    }else if (section == 1){
        title = @"Now Playing";
    }
    
    UIView *header = [[UIView alloc] initWithFrame:CGRectMake(0, 0, [[UIScreen mainScreen] bounds].size.width, 60)];
   //header.backgroundColor = .clear
   
    UILabel *label = [[UILabel alloc] initWithFrame:CGRectMake(20, 16, [[UIScreen mainScreen] bounds].size.width, 22)];
    label.text = title;
   //label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
        
    [header addSubview:label];
    return header;
}



-(void)initializeProperties {
    if(!_service) {
        _service = [[TMDBService alloc] init];
    }
}






@end



//
//    //MARK: Header Setup
//
//    func tableView(_ tableView: UITableView, viewForHeaderInSection section: Int) -> UIView? {
//        var title: String = ""
//
//        if section == 0 {
//            title = "Popular Movies"
//
//        } else if section == 1 {
//            title = "Now Playing"
//        }
//
//        let header = UIView(frame: CGRect(x: 0, y: 0, width: view.frame.size.width, height: 60))
//        header.backgroundColor = .clear
//
//        let label = UILabel(frame: CGRect(x: 20, y: 16, width: view.frame.size.width, height: 22))
//        label.font = UIFont.systemFont(ofSize: 17, weight: .semibold)
//        label.text = title
//
//        header.addSubview(label)
//
//        return header
//    }
//}
