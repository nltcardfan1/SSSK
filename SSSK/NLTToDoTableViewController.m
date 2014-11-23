//
//  NLTToDoTableViewController.m
//  SSSK
//
//  Created by Nathan Thomas on 7/3/14.
//  Copyright (c) 2014 Nathan Thomas. All rights reserved.
//

#import "NLTToDoTableViewController.h"
#import "NLTToDoStore.h"
#import "NLTAddToDoViewController.h"

@interface NLTToDoTableViewController () <UINavigationControllerDelegate>

@property(nonatomic,strong) NLTAddToDoViewController *addController;

@end

@implementation NLTToDoTableViewController

- (void)pushview:(NSString *) title
{
    _addController = [[NLTAddToDoViewController alloc] init];
    [self.navigationController pushViewController:_addController animated:YES];
    _addController.delegate = self;
}

-(void) addItemToList:(NSString *)title
{
    NLTToDoItem *newItem = [[NLTToDoStore sharedStore] createItemWithTitle:title];
    
    
    
    // Figure out where that item is in the array
    NSInteger lastRow = [[[NLTToDoStore sharedStore] allItems] indexOfObject:newItem];
    
    NSIndexPath *indexPath = [NSIndexPath indexPathForRow:lastRow inSection:0];
    
    
    // Insert this new row into the table.
    //NSLog(@"Number of strings is %d",[[[NLTToDoStore sharedStore] allItems] count]);
    [self.tableView insertRowsAtIndexPaths:@[indexPath]
                          withRowAnimation:UITableViewRowAnimationTop];

}
- (id)init
{
    self = [super initWithStyle:UITableViewStylePlain];
    if (self) {
        
        // Create a UIImage from a file
        UIImage *image = [UIImage imageNamed:@"Top_Charts.png"];
        
        // Put that image on the tab bar item
        self.tabBarItem.image = image;
        self.tabBarItem.title = @"To Do";
        
        UINavigationItem *navItem = self.navigationItem;
        navItem.title = @"To Do";
        
        // Create a new bar button item that will send
        UIBarButtonItem *bbi = [[UIBarButtonItem alloc] initWithBarButtonSystemItem:UIBarButtonSystemItemAdd
                                                                             target:self
                                                                             action:@selector(pushview:)];
        
        // Set this bar button item as the right item in the navigationItem
        navItem.rightBarButtonItem = bbi;
        
    }
    return self;
}

- (void)viewDidLoad
{
    [super viewDidLoad];
    
    [self.tableView registerClass:[UITableViewCell class]
           forCellReuseIdentifier:@"UITableViewCell"];
    
}

- (void)viewWillAppear:(BOOL)animated
{
    [super viewWillAppear:animated];
    
    [self.tableView reloadData];
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

#pragma mark - Table view data source



- (NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section
{
return [[[NLTToDoStore sharedStore] allItems] count];
}

- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath
{
    // Get a new or recycled cell
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"UITableViewCell" forIndexPath:indexPath];
    
    // Set the text on the cell with the description of the item
    // that is at the nth index of items, where n = row this cell
    // will appear in on the tableview
    NSArray *items = [[NLTToDoStore sharedStore] allItems];
    NLTToDoItem *item = items[indexPath.row];
    
    cell.textLabel.text = [item title];
    
    return cell;
}

- (void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath
{
    NSArray *items = [[NLTToDoStore sharedStore] allItems];
    NLTToDoItem *item = items[indexPath.row];
    [[NLTToDoStore sharedStore] removeItem:item];
    [tableView deleteRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationFade];
   
}




@end
