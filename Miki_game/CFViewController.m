//
//  CFViewController.m
//  Miki_game
//
//  Created by Christina Francis on 11/14/13.
//  Copyright (c) 2013 Christina Francis. All rights reserved.
//

#import "CFViewController.h"


@interface CFViewController ()
- (IBAction)handle_selection:(UIButton*)sender;

@end

@implementation CFViewController

static int player = SILVER;
BOOL quit = NO;

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.
    self.buttons = [[NSArray alloc] initWithObjects:self.bt_1,self.bt_2,self.bt_3,self.bt_4,self.bt_5,self.bt_6,self.bt_7,self.bt_8,self.bt_9,self.bt_10,self.bt_11,self.bt_12,self.bt_13,self.bt_14,self.bt_15,self.bt_16,self.bt_17,self.bt_18,self.bt_19,self.bt_20, nil];
    
    NSMutableArray *play_cells  = [[NSMutableArray alloc] init];
    
    for (UIButton *bt  in self.buttons) {
        cell* c = [[cell alloc] init];
        c = [c initWithTag:[NSNumber numberWithInteger:[bt tag]]];
        [play_cells addObject:c];
        //[c desc];
    }
    self.board_cells = [[NSArray alloc ] initWithArray: play_cells];
    self.myQueue = [[queue alloc] init];
    
    self.goldSet= [NSMutableDictionary dictionaryWithObjects:@[@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0,@0] forKeys:@[@"0",@"1",@"2",@"3",@"4",@"5",@"6",@"7",@"8",@"9",@"10",@"11",@"12",@"13",@"14",@"15",@"16",@"17",@"18",@"19"]];
    
    
    NSLog(@"called - view did load %@",self.goldSet);
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

- (IBAction)handle_selection:(UIButton*)sender {
    NSLog(@"called -  handle sel ");

    NSNumber* tagNum = [NSNumber numberWithInteger:[sender tag]];
    
    for (cell* c in self.board_cells) {
    
        if([c.tag isEqualToNumber:tagNum] ){
            //button --- cell is selected
            if(c.cb == silver || c.cb == none || c.coinCount == 0){
                c.cb = silver;
                player = SILVER;
                [self.myQueue enqueueWith:tagNum];
                while (![[self.myQueue first_in_queue] isEqualToNumber:@101] && quit == NO) {
                    //[NSTimer scheduledTimerWithTimeInterval:.4 target:self selector:@selector(populateCellsFromQueue) userInfo:nil repeats:NO];
                    [self populateCellsFromQueue];
                }
                //[NSTimer scheduledTimerWithTimeInterval:.4 target:self selector:@selector(playOpponent) userInfo:nil repeats:NO];
                [self playOpponent];
                
            }
           
          
            
        }
    }
   
    
}

-(void) playOpponent{
    NSArray *goldArray = [self.goldSet allKeysForObject:@0];
    
    player = gold;
   // BOOL goldCell = NO;
   // while()
    if ([goldArray count] == 0) {
        NSLog(@"gold array empty: silver wins*****************");
    }
    else{
        int rand = arc4random() %[goldArray count];
        NSString *val  = [goldArray objectAtIndex:rand ];
        NSNumber* tagNum = [NSNumber numberWithInt:[val integerValue]];
        NSLog(@"gold array %@",goldArray);
        for (cell* c in self.board_cells) {
            
            if([c.tag isEqualToNumber:tagNum] ){
                //button --- cell is selected
                
                    c.cb = gold;
                    player = gold;
                    [self.myQueue enqueueWith:tagNum];
                    while (![[self.myQueue first_in_queue] isEqualToNumber:@101] && quit == NO) {
                        //[NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(populateCellsFromQueue) userInfo:nil repeats:NO];
                        [self populateCellsFromQueue];
                     
                       
                    }
                    
                
            }
        }
    }
}

-(void) populateCellsFromQueue{
    
   static int count = 0;
   // [self.myQueue desc];
    NSNumber* tagNum = [self.myQueue dequeue];
    
    for (cell* c in self.board_cells) {
        
        if([c.tag isEqualToNumber:tagNum] ){
            
            c.coinCount += 1;
            c.cb = player;
            
            self.nextImg_coinCount = c.coinCount;
            self.nextImg_cb = c.cb;
            self.nextImg_tagNum = tagNum;
            
            [NSTimer scheduledTimerWithTimeInterval:.2 target:self selector:@selector(nextImage) userInfo:nil repeats:NO];
            NSDate *runUntil = [NSDate dateWithTimeIntervalSinceNow: 0.3 ];
            
            NSLog(@"about to wait");
            [[NSRunLoop currentRunLoop] runUntilDate:runUntil];
         // [self nextImage ];
          
            if (player == gold) {
                [self.goldSet setValue:@0 forKey:[NSString stringWithFormat:@"%@", c.tag ]];
            }
            else{
                [self.goldSet setValue:@1 forKey:[NSString stringWithFormat:@"%@", c.tag ]];
            }
            
            if(( c.coinCount == 4 && c.ct == middle )||(c.coinCount == 3 && c.ct == edge)||(c.coinCount == 2 && c.ct == corner))
                
                {
                
                    
                    [self.myQueue desc];
                    
                    
                    c.coinCount = 0;
                    c.cb  = none;
                    [self.goldSet setValue:@0 forKey:[NSString stringWithFormat:@"%@", c.tag ]];
                    
                    //sleep(1);
                    for (UIButton *bt  in self.buttons) {
                        NSNumber* tg = [NSNumber numberWithInteger:[bt tag] ];
                        if([tg isEqualToNumber:tagNum]){
                            
                            [bt  setImage:[UIImage imageNamed:@"coin_no.jpg"] forState:UIControlStateNormal];
                            
                        }
                    }
                    
                    for(NSNumber *nb in c.neighbors){
                        [self.myQueue enqueueWith:nb];//push neighbors into queue
                        //pass conqured by : silver
                        for (cell* nb_c in self.board_cells) {
                            
                            if([nb_c.tag isEqualToNumber:tagNum] ){
                                nb_c.cb = player;
                                if (player == gold) {
                                    [self.goldSet setValue:@0 forKey:[NSString stringWithFormat:@"%@", nb_c.tag ]];
                                }
                                else{
                                    [self.goldSet setValue:@1 forKey:[NSString stringWithFormat:@"%@", nb_c.tag ]];
                                }
                            }
                            while (![[self.myQueue first_in_queue] isEqualToNumber:@101]) {
                                  
                                count += 1;
                                if (count >= MAXM) {
                                    quit = YES;
                                    break;
                                }
                                NSLog(@"%d count------",count);
                                [self populateCellsFromQueue];
                                 
                            }
                        }
                       
                        
                    }
                
                }
        
            
        }
    }
   
    NSLog(@"called -  populate");
}
-(void) doNothing{
    NSLog(@"do nothing------");
}
-(void) nextImage {
   
   int coinCount = self.nextImg_coinCount;
   int cb = self.nextImg_cb;
   NSNumber* tagNum = self.nextImg_tagNum;
    
    BOOL match_found = NO;
    for (UIButton *bt  in self.buttons) {
        NSNumber* tg = [NSNumber numberWithInteger:[bt tag] ];
        NSString* img_name; 
        if([tg isEqualToNumber:tagNum]){
            
             match_found = YES;
            
            if(player == silver){
                //NSLog(@"BUTTON match found-------------");
                img_name = [NSString stringWithFormat:@"coin_s_%d.jpg",coinCount];
                [bt  setImage:[UIImage imageNamed:img_name] forState:UIControlStateNormal];
               
            }
            if(player == gold  ){
                img_name = [NSString stringWithFormat:@"coin_g_%d.jpg",coinCount];
                [bt  setImage:[UIImage imageNamed:img_name] forState:UIControlStateNormal];
            }
            
        }
    }
    if(!match_found){
         NSLog(@"BUTTON match  not found-------------tag:%@",tagNum);
    }
    NSLog(@"called -  next img");
}

@end
