//
//  ReadSecondNodeViewController.h
//  Test_Json
//
//  Created by admin on 7/7/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import <UIKit/UIKit.h>

@interface ReadSecondNodeViewController : UIViewController

@property (weak, nonatomic) IBOutlet UIWebView *viewDetails;
- (void)setDetails:(NSMutableDictionary *)details;

@end
