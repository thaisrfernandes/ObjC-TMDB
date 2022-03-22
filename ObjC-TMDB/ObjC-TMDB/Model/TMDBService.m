//
//  TMDBService.m
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 21/03/22.
//

#import <Foundation/Foundation.h>
#import "TMDBService.h"

@implementation TMDBService

- (NSString *)getUrl:(NSString *)param :(NSNumber *)pages
{
    return [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@?api_key=ed59a401ccb87b2fa3fd6a859f9563c4&language=en-US&page=%@",  param, pages];
}

- (void)requestMovies:(NSString*_Nullable)type :(NSNumber*_Nullable)pages andCompletionHandler:(void(^_Nullable)(Movie* _Nullable movie))completionHandler{
    
}
 
- (void)fetchMoviePoster:(NSURL*_Nullable)url andCompletionHandler:(void(^_Nullable)(UIImage* _Nullable image))completionHandler{
    
}


@end
