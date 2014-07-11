//
//  ReadFirstNodeTableViewController.m
//  Test_Json
//
//  Created by admin on 7/7/14.
//  Copyright (c) 2014 admin. All rights reserved.
//
// WebService URL
// #define myURL [NSURL URLWithString:@""]


#import "ReadFirstNodeTableViewController.h"
#import "ReadSecondNodeViewController.h"

@interface ReadFirstNodeTableViewController () {
    NSMutableArray *JSONfile;
    NSMutableDictionary *application;
    NSMutableArray *allPages;
    NSMutableDictionary *page;
}
@end

@implementation ReadFirstNodeTableViewController


- (id)initWithStyle:(UITableViewStyle)style
{
    self = [super initWithStyle:style];
    if (self) {
        // Custom initialization
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    // Read Json file
    NSError *error = [[NSError alloc] init];
    // Get file
    NSFileManager *fm;
    fm = [NSFileManager defaultManager];
    NSString *mydirectory = @"/Users/Karine/Projects/Test_Json/";
    
    [fm changeCurrentDirectoryPath:mydirectory];
    // Get its content
    NSData *file = [fm contentsAtPath:[NSString stringWithFormat:@"%@%@", mydirectory, @"APIapplication.json"]];
    
    JSONfile = (NSMutableArray *)[NSJSONSerialization JSONObjectWithData:file options:NSJSONReadingMutableLeaves error:&error];
    // Keep only one application
    application = JSONfile[0];
    for (NSString *s in application.allKeys)
    {
        NSLog(@"%@", s);
    }
    // Get all pages of the application
    allPages = [application objectForKey:@"Pages"];
    NSLog(@"%d", allPages.count);
    self.navigationItem.title = [application objectForKey:@"Name"];
    
    [self insertNewObject];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source

- (NSInteger)numberOfSectionsInTableView:(UITableView *)tableView
{
    // Return the number of sections. Here, always 0.
    return 0;
}

- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
    // Return the number of rows in the section. Dynamic -> number of items in menu
    return allPages.count;
}

// Insert all pages in TableView
- (void)insertNewObject
{
    if (!page) {
        page = [[NSMutableDictionary alloc] init];
    }
    for (NSInteger nbpage=0; nbpage<((allPages.count)); ++nbpage) {
        NSLog(@"%d", nbpage);
        
        NSIndexPath *indexPathTable = [NSIndexPath indexPathForRow:0 inSection:0];
        [self.tableView insertRowsAtIndexPaths:@[indexPathTable] withRowAnimation:UITableViewRowAnimationAutomatic];
    }
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"Cell" forIndexPath:indexPath];
    page = allPages[indexPath.row];
    NSString *txt = [page objectForKey:@"Name"];
    cell.textLabel.text = [txt description];
    
    return cell;
}



// Override to support conditional editing of the table view.
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Return NO if you do not want the specified item to be editable.
    return NO;
}


#pragma mark - Navigation

// In a storyboard-based application, you will often want to do a little preparation before navigation
- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender
{
 if ([[segue identifier] isEqualToString:@"segueViewDetails"]) {
     NSIndexPath *indexPath = [self.tableView indexPathForSelectedRow];
     page = allPages[indexPath.row];
     [[segue destinationViewController] setDetails:page];
 }
}


@end
