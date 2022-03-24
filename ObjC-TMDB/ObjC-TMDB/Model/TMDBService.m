//
//  TMDBService.m
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 21/03/22.
//

#import <Foundation/Foundation.h>
#import "TMDBService.h"
#import <UIKit/UIKit.h>

@implementation TMDBService

NSString *BASE_IMAGE_URL = @"https://image.tmdb.org/t/p/w154";
NSArray<Movie*>* movie = @[];

- (NSString *)getUrl:(NSString *)param :(NSNumber *)pages
{
    return [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@?api_key=ed59a401ccb87b2fa3fd6a859f9563c4&language=en-US&page=%@",  param, pages];
}

- (void)requestMovies:(NSString*_Nullable)type :(NSNumber*_Nullable)pages andCompletionHandler:(void(^_Nullable)(NSMutableArray<Movie*>* _Nullable movies))completionHandler{
    
    if (pages < 0) {
        [NSException raise:@"NumberPagesInvalid" format:@"The number of pages is invalid. Pages count: (pages)"];
    }
    
    NSString *baseURL = [self getUrl:type :pages];
    NSURLRequest *url = [NSURLRequest requestWithURL: [NSURL URLWithString:baseURL]];
    
    if (url == NULL) {
        return;
    }
    
    dispatch_semaphore_t dispatchSemaphore = dispatch_semaphore_create(0);
    
    NSMutableArray<Movie*>* localMovies = [NSMutableArray array];
    
    NSMutableArray<TemporaryMovie*>* localTempMovies = [NSMutableArray array];

    NSURLSession *session = [NSURLSession sharedSession];
    
    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
                                      {
        NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
        if(httpResponse.statusCode == 200)
        {
            NSError *parseError = nil;
            NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
            NSDictionary *movies = [responseDictionary objectForKey:@"results"];
            
            if (responseDictionary == nil) {
                dispatch_semaphore_signal(dispatchSemaphore);
                return;
            }
            
            for (id movieJSONObject in movies)
            {
                TemporaryMovie *tempMovie = [[TemporaryMovie alloc] init];
                
                tempMovie.id = [movieJSONObject objectForKey:@"id"];
                tempMovie.title = [movieJSONObject objectForKey:@"original_title"];
                tempMovie.overview = [movieJSONObject objectForKey:@"overview"];
                tempMovie.rating = [movieJSONObject objectForKey:@"vote_average"];
                tempMovie.posterPath = [movieJSONObject objectForKey:@"poster_path"];

                [localTempMovies addObject:tempMovie];
            }
            
            dispatch_semaphore_signal(dispatchSemaphore);
        }
    }];
    [dataTask resume];
    
    dispatch_semaphore_wait(dispatchSemaphore, DISPATCH_TIME_FOREVER); //qual o melhor time?

    dispatch_group_t dispatchGroup = dispatch_group_create();
    dispatch_semaphore_t imageSemaphore = dispatch_semaphore_create(1);

    for (TemporaryMovie *tempM in localTempMovies) {
        NSString *imgPath = [NSString stringWithFormat: @"%@%@", BASE_IMAGE_URL, tempM.posterPath];
        NSURL *imgUrl = [NSURL URLWithString: imgPath];
        
        dispatch_group_enter(dispatchGroup);
        
        [self fetchMoviePoster:imgUrl andCompletionHandler:^(UIImage * _Nullable image) {
            Movie *movie = [[Movie alloc] init];
            movie.id = tempM.id;
            movie.title = tempM.title;
            movie.overview = tempM.overview;
            movie.rating = tempM.rating;
            movie.imageCover = image;
            
            dispatch_semaphore_wait(imageSemaphore, DISPATCH_TIME_FOREVER);
            [localMovies addObject:movie];
            
            dispatch_semaphore_signal(imageSemaphore);
            
            dispatch_group_leave(dispatchGroup);
        }];
    }
    
    dispatch_group_notify(dispatchGroup, dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        completionHandler(localMovies);
    });
}

- (void)fetchMoviePoster:(NSURL*_Nullable)url andCompletionHandler:(void(^_Nullable)(UIImage* _Nullable image))completionHandler {
    dispatch_async(dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_HIGH, 0), ^{
        NSData *data = [NSData dataWithContentsOfURL: url];
        
        if (data == nil) {
            completionHandler(nil);
            return;
        }
        
        UIImage *image = [UIImage imageWithData:data];
        
        completionHandler(image);
    });
}

@end
