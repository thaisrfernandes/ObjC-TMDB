//
//  TMDBService.m
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 21/03/22.
//

#import <Foundation/Foundation.h>
#import "TMDBService.h"

@implementation TMDBService

NSString *BASE_IMAGE_URL = @"https://image.tmdb.org/t/p/w154";
NSArray<Movie*>* movie = @[];


- (NSString *)getUrl:(NSString *)param :(NSNumber *)pages
{
    return [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@?api_key=ed59a401ccb87b2fa3fd6a859f9563c4&language=en-US&page=%@",  param, pages];
}

- (void)requestMovies:(NSString*_Nullable)type :(NSNumber*_Nullable)pages andCompletionHandler:(void(^_Nullable)(Movie* _Nullable movie))completionHandler{
    
    if (pages < 0) {
        [NSException raise:@"NumberPagesInvalid" format:@"The number of pages is invalid. Pages count: (pages)"];
    }
    
    NSString *baseURL = [self getUrl:type :pages];
    NSURL *URL = [NSURL URLWithString:baseURL];
    
    
    if (URL == NULL){
        return;
    }

    dispatch_semaphore_t dispatchSemaphore = dispatch_semaphore_create(0);


    NSArray<Movie*>* localMovies = @[];
    
//
//       TemporaryMovie = (id: Int, title: String, overview: String, rating: Double, posterPath: String)
//            var localTempMovies: [TemporaryMovie] = []

}
 
- (void)fetchMoviePoster:(NSURL*_Nullable)url andCompletionHandler:(void(^_Nullable)(UIImage* _Nullable image))completionHandler{
    
}


@end
