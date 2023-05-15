//
//  ViewController.m
//  ToDoList-ObjC
//
//  Created by Brendon Crowe on 5/15/23.
//

#import "ItemsViewController.h"
#import "Item.h"


// conform to UITableViewDataSource
@interface ItemsViewController () <UITableViewDataSource>

@property (weak, nonatomic) IBOutlet UITableView *tableView;
@property NSMutableArray *items;
@end

@implementation ItemsViewController


- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view.
    [self configureNavBar];
    self.items = [[NSMutableArray alloc] initWithArray:[Item fetchItems]];
    self.tableView.dataSource = self;
}

- (void)configureNavBar {
    // 1. create an image for the bar button item
    UIImage *image = [UIImage systemImageNamed:@"plus"];
    
    // 2. create bar button item
    UIBarButtonItem *plusButton = [[UIBarButtonItem alloc] initWithImage:image style:UIBarButtonItemStylePlain target:self action:@selector(addItem)];
    
    // 3. set the "plusButton" as the right bar button item
    self.navigationItem.rightBarButtonItem = plusButton;
    self.navigationItem.title = @"ToDo list";
}

-(void)addItem {
    
    // 1. initialize an alert controller
    UIAlertController *alertController = [UIAlertController alertControllerWithTitle:@"Add a new item" message:@"" preferredStyle:UIAlertControllerStyleAlert];
    
    // 2. add two text fields to the alert controller
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // code here
    }];
    
    [alertController addTextFieldWithConfigurationHandler:^(UITextField * _Nonnull textField) {
        // coder here
    }];
    
    // 3. add place holder text for textfields
    alertController.textFields[0].placeholder = @"Enter item name";
    alertController.textFields[1].placeholder = @"Enter topic name";
    
    // 4. define action items "cancel" and "add"
    UIAlertAction *cancelAction = [UIAlertAction actionWithTitle:@"Cancel" style:UIAlertActionStyleCancel handler:nil];
    UIAlertAction *saveAction = [UIAlertAction actionWithTitle:@"Add" style:UIAlertActionStyleDefault handler:^(UIAlertAction * _Nonnull action) {
        // handler code here
        // 1. insert the new item
        NSString *name = alertController.textFields[0].text;
        NSString *topic = alertController.textFields[1].text;
        Item *newItem = [[Item alloc] initWithName:name andTopic:topic];
        [self.items addObject:newItem];
        
        // 2. create an indexPath at the end of Items array
        NSIndexPath *indexPath = [NSIndexPath indexPathForRow:self.items.count - 1 inSection:0];
        
        // 3. insert item indexPath into table view
        [self.tableView insertRowsAtIndexPaths:@[indexPath] withRowAnimation:UITableViewRowAnimationAutomatic];

    }];
    
    // 5. add action items "cancel" and "add"
    [alertController addAction:cancelAction];
    [alertController addAction:saveAction];
    
    [self presentViewController:alertController animated:true completion:nil];
    
}


#pragma mark - UITableviewDataSource

- (nonnull UITableViewCell *)tableView:(nonnull UITableView *)tableView cellForRowAtIndexPath:(nonnull NSIndexPath *)indexPath {
    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"itemCell" forIndexPath:indexPath];
    Item *item = self.items[indexPath.row];
    cell.textLabel.text = item.name;
    cell.detailTextLabel.text = item.topic;
    return cell;
}

- (NSInteger)tableView:(nonnull UITableView *)tableView numberOfRowsInSection:(NSInteger)section {
    return self.items.count;
}


@end
