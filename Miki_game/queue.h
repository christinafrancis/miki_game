//
//  queue.h
//  Miki_game
//
//  Created by Christina Francis on 11/14/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface queue : NSObject

@property NSMutableArray* Qarray;

+ (queue*) qObj;

- (void) enqueueWith:(id) cell_id;
- (id) dequeue;
- (id) first_in_queue;

-(queue*) init;
-(void) desc;


@end
