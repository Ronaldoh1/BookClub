//
//  ViewController.m
//  BookClub
//
//  Created by Ronald Hernandez on 4/1/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//

#import "FriendViewController.h"

@interface FriendViewController ()<UITableViewDataSource, UITableViewDelegate>

@end

@implementation FriendViewController

- (void)viewDidLoad {
    [super viewDidLoad];

}

#pragma TableView Delegate Methods.

-(void)tableView:(UITableView *)tableView didSelectRowAtIndexPath:(NSIndexPath *)indexPath{

}
-(UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath{

    UITableViewCell *cell = [tableView dequeueReusableCellWithIdentifier:@"cell"];

    //Change the color of the cell so that every other cell is clear. 
    if(indexPath.row % 2 == 0){
        cell.backgroundColor = [UIColor clearColor];

    }

    return cell;
}
-(NSInteger)numberOfSectionsInTableView:(UITableView *)tableView{

    return 1;
}
-(NSInteger)tableView:(UITableView *)tableView numberOfRowsInSection:(NSInteger)section{

    return 5;
}

@end
