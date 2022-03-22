//
//  ViewController.m
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 21/03/22.
//

#import "ViewController.h"
#import "Model/Movie.h"
@interface ViewController ()
@property Movie * movie;
@end

@implementation ViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self initializeProperites];
    NSLog(@"%@", _movie.title);
}

- (void) initializeProperites {
  if (_movie == nil) {
    _movie = [[Movie alloc] init];
      _movie.id = @19;
      _movie.title = @"Homem Aranha";
      _movie.overview = @"Miranha multiverso";
  }
}



@end
