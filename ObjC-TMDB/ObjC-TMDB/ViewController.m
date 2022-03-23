//
//  ViewController.m
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 21/03/22.
//

#import "ViewController.h"
#import "Model/Movie.h"
#import "Model/TMDBService.h"

@interface ViewController ()
@property Movie * movie;
@property TMDBService * tmdbService;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeProperites];
    NSLog(@"%@", _movie.title);
    [_tmdbService requestMovies:@"popular" :@1 andCompletionHandler:^(NSArray<Movie*> * _Nullable movies) {
        NSLog(@"Funcionando");
        
        for (Movie *mv in movies) {
            NSLog(@"%@", mv.title);
        }
    }];
}

- (void) initializeProperites {
  if (_movie == nil) {
    _movie = [[Movie alloc] init];
      _movie.id = @19;
      _movie.title = @"Homem Aranha";
      _movie.overview = @"Miranha multiverso";
  }

    if(_tmdbService == nil){
        _tmdbService = [[TMDBService alloc] init];
    }
}

@end
