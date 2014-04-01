//
//  cell.m
//  Miki_game
//
//  Created by Christina Francis on 11/14/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//



#import "cell.h"


# define ROW 4
#define COL 5

@implementation cell

static cell* _cellObj;

+ (cell*) cellObj
{
    if (_cellObj == nil) {
        _cellObj = [[cell alloc] init];
    }
    return _cellObj;
}

- ( cell* ) initWithTag:(NSNumber*) tag{
    self = [super init];
    if( self ){
        self.tag = tag;
        self.cb = none;
        self.ct =[self get_ct:tag];
        self.neighbors = [[NSArray alloc] initWithArray:[self getNeighbors:tag]];
        self.coinCount = 0;
    }
    return self;
}

-( void) desc{ 
    NSLog(@"tag : %@ ; cb %d ; ct : %d ; neigh : %@ ; countCoin: %d",self.tag,self.cb,self.ct,self.neighbors,self.coinCount);
}



- (int) get_ct:(NSNumber*) tag{

    // cell type
    
    for (id i in @[@0,@4,@15,@19] ){
        if([i  isEqualToNumber:tag])
            return 0;
    }
    for ( id i in @[@6,@7,@8,@11,@12,@13]){
        if([i  isEqualToNumber:tag])
            return 2;
    }

    return 1;

}

-(NSArray* )getNeighbors:(NSNumber*) t{
    int tag = [t integerValue];
    
    NSMutableArray *nb = [[NSMutableArray alloc] init];
    if( tag+1 >= 0  && tag+1  < 20 && (tag+1)%COL != 0){
        [nb addObject:[NSNumber numberWithInt:(tag+1)]  ];
    }
    if( tag-1 >= 0 && tag-1  < 20 && tag%COL != 0){
        [nb addObject:[NSNumber numberWithInt:(tag-1)]  ];
    }
    if( tag+ COL >= 0 && tag+ COL < 20){
        [nb addObject:[NSNumber numberWithInt:(tag+ COL)]  ];
    }
    if( tag - COL >= 0 && tag - COL < 20){
        [nb addObject:[NSNumber numberWithInt:(tag- COL)]  ];
    }
    return nb;
}

@end