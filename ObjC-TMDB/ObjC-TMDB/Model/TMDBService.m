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
    return [NSString stringWithFormat:@"https://api.themoviedb.org/3/movie/%@?api_key=29e140b5aab9879b19e9118a0af356c9&language=en-US&page=%@",  param, pages];
}

@end
