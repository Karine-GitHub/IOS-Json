//
//  ReadSecondNodeViewController.m
//  Test_Json
//
//  Created by admin on 7/7/14.
//  Copyright (c) 2014 admin. All rights reserved.
//

#import "ReadSecondNodeViewController.h"

@interface ReadSecondNodeViewController ()

@end

@implementation ReadSecondNodeViewController

@synthesize viewDetails;

- (id)initWithNibName:(NSString *)nibNameOrNil bundle:(NSBundle *)nibBundleOrNil
{
    self = [super initWithNibName:nibNameOrNil bundle:nibBundleOrNil];
    if (self) {
        // Custom initialization
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    // Do any additional setup after loading the view.
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (void)setDetails:(NSMutableDictionary *)details {
    [viewDetails loadHTMLString:[details objectForKey:@"HtmlContent"] baseURL:nil];
    self.navigationItem.title = [details objectForKey:@"Name"];
}
/*
#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
    // Get the new view controller using [segue destinationViewController].
    // Pass the selected object to the new view controller.
}
*/

@end
