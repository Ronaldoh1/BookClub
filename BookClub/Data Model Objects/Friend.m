//
//  Friend.m
//  BookClub
//
//  Created by Ronald Hernandez on 4/2/15.
//  Copyright (c) 2015 Ron. All rights reserved.
//


#import "AppDelegate.h"
#import "Friend.h"
#import "Book.h"

@implementation Friend

@dynamic name;
@dynamic photo;
@dynamic isFriend;
@dynamic books;


+ (void)retrieveFriendListWithCompletion:(friendBlock)complete
{
    AppDelegate *delegate = [[UIApplication sharedApplication] delegate];
    NSManagedObjectContext *moc = delegate.managedObjectContext;
    NSString *urlString = @"http://s3.amazonaws.com/mobile-makers-assets/app/public/ckeditor_assets/attachments/18/friends.json";
    NSURL *url = [NSURL URLWithString:urlString];

    NSURLRequest *request = [NSURLRequest requestWithURL:url];

    [NSURLConnection sendAsynchronousRequest:request queue:[NSOperationQueue mainQueue] completionHandler:^(NSURLResponse *response, NSData *data, NSError *connectionError) {

        NSError *JSONError = nil;

        if (!connectionError)
        {
            NSArray *namesArray = [NSJSONSerialization JSONObjectWithData:data options:NSJSONReadingAllowFragments error:&JSONError];

            if (!JSONError)
            {
                NSMutableArray *friendsArray;
                friendsArray = [NSMutableArray array];
                for (NSString *name in namesArray)
                {
                    Friend *aFriend = [NSEntityDescription insertNewObjectForEntityForName:@"Friend" inManagedObjectContext:moc];
                    aFriend.name = name;
                    [friendsArray addObject:aFriend];
                }
                [moc save:nil];
                complete (friendsArray,connectionError);
            }
            else
            {
                complete (nil,JSONError);
            }
        }
        else
        {
            complete (nil,connectionError);
        }
    }];
}

@end

