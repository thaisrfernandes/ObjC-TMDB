//
//  Movie.m
//  ObjC-TMDB
//
//  Created by Thaís Fernandes on 21/03/22.
//

#import <Foundation/Foundation.h>
#import "Movie.h"

@implementation Movie

- (NSString *)description
{
    return [NSString stringWithFormat:@"The movie %@ with ID of %@ has rating of %@. Description: %@", self.title, self.id, self.rating, self.overview];
}

@end

