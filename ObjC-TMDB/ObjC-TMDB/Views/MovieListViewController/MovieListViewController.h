//
//  MovieListViewController.h
//  ObjC-TMDB
//
//  Created by Eduarda Soares Serpa Camboim on 23/03/22.
//

#import <Foundation/Foundation.h>
#import <UIKit/UIKit.h>

@interface MovieListViewController : UIViewController

@property (weak) IBOutlet UITableView * _Nullable tableView;

- (void)prepareForSegue:(UIStoryboardSegue *_Nullable)segue sender:(id _Nullable )sender;




@end




