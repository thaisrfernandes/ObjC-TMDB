//
//  TMDBService.h
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 21/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>
#import "Movie.h"
#import "TemporaryMovie.h"


@interface TMDBService : NSObject

@property NSString * _Nullable BASE_IMAGE_URL; // = "https://image.tmdb.org/t/p/w154";

@property NSMutableArray<Movie*>* _Nullable movie;

- (NSString *_Nullable)getUrl:(NSString*_Nullable)param :(NSNumber*_Nullable)pages;

- (void)requestMovies:(NSString*_Nullable)type :(NSNumber*_Nullable)pages andCompletionHandler:(void(^_Nullable)(Movie* _Nullable movie))completionHandler;
 
- (void)fetchMoviePoster:(NSURL*_Nullable)url andCompletionHandler:(void(^_Nullable)(UIImage* _Nullable image))completionHandler;

@end

