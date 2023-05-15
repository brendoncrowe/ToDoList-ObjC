//
//  Item.m
//  ToDoList-ObjC
//
//  Created by Brendon Crowe on 5/15/23.
//

#import <Foundation/Foundation.h>
#import "Item.h"

@implementation Item

- (instancetype)initWithName:(NSString *)name andTopic:(NSString *)topic {
    if (self = [super init]) {
        // initialize all properties here
        self.name = name;
        self.topic = topic;
    }
    return  self;
}

+ (NSArray *)fetchItems {
    return @[
        [[Item alloc] initWithName:@"Coffee with engineer" andTopic:@"Interview"],
        [[Item alloc] initWithName:@"Phone Interview" andTopic:@"Interview"],
        [[Item alloc] initWithName:@"Continue building app" andTopic:@"Work"],
        [[Item alloc] initWithName:@"Workout" andTopic:@"Health"],
        [[Item alloc] initWithName:@"Watch a movie" andTopic:@"Relax"]
    ];
}


@end
