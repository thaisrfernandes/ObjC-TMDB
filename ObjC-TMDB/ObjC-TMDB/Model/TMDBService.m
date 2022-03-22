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
    NSURLRequest *url = [NSURLRequest requestWithURL: [NSURL URLWithString:baseURL]];
    
    
    if (url == NULL){
        return;
    }

    dispatch_semaphore_t dispatchSemaphore = dispatch_semaphore_create(0);


    NSArray<Movie*>* localMovies = @[];
    
    NSArray<TemporaryMovie*>* localTempMovies = @[];
    
    
    NSURLSession *session = [NSURLSession sharedSession];

    NSURLSessionDataTask *dataTask = [session dataTaskWithRequest:url completionHandler:^(NSData *data, NSURLResponse *response, NSError *error)
    {
      NSHTTPURLResponse *httpResponse = (NSHTTPURLResponse *)response;
      if(httpResponse.statusCode == 200)
      {
        NSError *parseError = nil;
        NSDictionary *responseDictionary = [NSJSONSerialization JSONObjectWithData:data options:0 error:&parseError];
        NSLog(@"The response is - %@",responseDictionary);
      }
      else
      {
        NSLog(@"Error");
      }
    }];
    [dataTask resume];
    
    
    //MARK: Movies request
//            URLSession.shared.dataTask(with: url) { data, response, error in
//                guard let unwrappedData = data,
//                      let json = try? JSONSerialization.jsonObject(with: unwrappedData, options: .fragmentsAllowed) as? [String: Any],
//                      let movies = json["results"] as? [MovieJSON]
//                else { dispatchSemaphore.signal(); return }
//
//                for movieJSONObject in movies {
//                    guard let id = movieJSONObject["id"] as? Int,
//                          let title = movieJSONObject["original_title"] as? String,
//                          let overview = movieJSONObject["overview"] as? String,
//                          let rating = movieJSONObject["vote_average"] as? Double,
//                          let posterPath = movieJSONObject["poster_path"] as? String
//                    else { continue }
//
//                    let tempMovie = TemporaryMovie(id: id, title: title, overview: overview, rating: rating, posterPath: posterPath)
//                    localTempMovies.append(tempMovie)
//
//                    //print("🟡🟡🎥🟡🟡")
//                }
//
//                dispatchSemaphore.signal()
//                //print("🟢🟢🎥🟢🟢")
//            }
//            .resume()
//

}
 
- (void)fetchMoviePoster:(NSURL*_Nullable)url andCompletionHandler:(void(^_Nullable)(UIImage* _Nullable image))completionHandler{
    
}


@end
