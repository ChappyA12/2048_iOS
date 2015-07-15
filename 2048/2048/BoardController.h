//
//  BoardController.h
//  2048
//
//  Created by Chappy Asel on 3/29/14.
//  Copyright (c) 2014 CD. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "2048Board.h"

@interface BoardController : NSObject {
    
}

-(_2048Board *)swipeRightWithBoard:(_2048Board *)board;

-(_2048Board *)swipeLeftWithBoard:(_2048Board *)board;

-(_2048Board *)swipeUpWithBoard:(_2048Board *)board;

-(_2048Board *)swipeDownWithBoard:(_2048Board *)board;

-(void)startGameWithBoard:(_2048Board *)board;

@end
