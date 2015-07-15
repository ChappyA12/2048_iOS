//
//  BoardController.m
//  2048
//
//  Created by Chappy Asel on 3/29/14.
//  Copyright (c) 2014 CD. All rights reserved.
//

#import "BoardController.h"

@implementation BoardController {
    
}

-(_2048Board *)swipeRightWithBoard:(_2048Board *)board{
    for (int row = 0; row<4; row++) { //repeatable by row (left to right)
        // 4TH SLOT
        if ([board getValueAtRow:row Column:3] != 0) { //if tile already on wall, aknowledge
            [board retainValueAtRow:row Column:3]; //keep value at slot (for animation purposes)
        }
        // 3RD SLOT
        if ([board getValueAtRow:row Column:2] != 0) { //tile exists in 3rd slot
            if ([board getValueAtRow:row Column:3] != 0) {
                if ([board getValueAtRow:row Column:2] == [board getValueAtRow:row Column:3]) { // 3=4
                    [board combineValueAtRow:row Column:2 ToRow:row Colum:3];
                }
                else [board retainValueAtRow:row Column:2]; //keep value at slot (for animation purposes)
            }
            else [board moveValueAtRow:row Column:2 ToRow:row Colum:3]; //move tile to wall
        }
        // 2ND SLOT
        if ([board getValueAtRow:row Column:1] != 0) {
            if ([board getValueAtRow:row Column:2] != 0) {
                if ([board getValueAtRow:row Column:1] == [board getValueAtRow:row Column:2]) {
                    [board combineValueAtRow:row Column:1 ToRow:row Colum:2];
                }
                else [board retainValueAtRow:row Column:1];
            }
            else if ([board getValueAtRow:row Column:3] != 0) { //tile exists in 4rd but not 3nd slot
                if ([board getValueAtRow:row Column:1] == [board getValueAtRow:row Column:3]) {
                    [board combineValueAtRow:row Column:1 ToRow:row Colum:3];
                }
                else [board moveValueAtRow:row Column:1 ToRow:row Colum:2];
            }
            else [board moveValueAtRow:row Column:1 ToRow:row Colum:3];
        }
        // 1ST SLOT
        if ([board getValueAtRow:row Column:0] != 0) {
            if ([board getValueAtRow:row Column:1] != 0) {
                if ([board getValueAtRow:row Column:0] == [board getValueAtRow:row Column:1]) {
                    [board combineValueAtRow:row Column:1 ToRow:row Colum:2];
                }
                else [board retainValueAtRow:row Column:0];
            }
            else if ([board getValueAtRow:row Column:2] != 0) {
                if ([board getValueAtRow:row Column:0] == [board getValueAtRow:row Column:2]) {
                    [board combineValueAtRow:row Column:0 ToRow:row Colum:2];
                }
                else [board moveValueAtRow:row Column:0 ToRow:row Colum:1];
            }
            else if ([board getValueAtRow:row Column:3] != 0) {
                if ([board getValueAtRow:row Column:0] == [board getValueAtRow:row Column:3]) {
                    [board combineValueAtRow:row Column:0 ToRow:row Colum:3];
                }
                else [board moveValueAtRow:row Column:0 ToRow:row Colum:2];
            }
            else [board moveValueAtRow:row Column:0 ToRow:row Colum:3];
        }
    }
    [board addRandomTile];
    return board;
}

-(_2048Board *)swipeLeftWithBoard:(_2048Board *)board{
    for (int row = 0; row<4; row++) {
        // 1ST SLOT
        if ([board getValueAtRow:row Column:0] != 0) {
            [board retainValueAtRow:row Column:0];
        }
        // 2ND SLOT
        if ([board getValueAtRow:row Column:1] != 0) {
            if ([board getValueAtRow:row Column:0] != 0) {
                if ([board getValueAtRow:row Column:0] == [board getValueAtRow:row Column:1]) {
                    [board combineValueAtRow:row Column:1 ToRow:row Colum:0];
                }
                else [board retainValueAtRow:row Column:1];
            }
            else [board moveValueAtRow:row Column:1 ToRow:row Colum:0];
        }
        // 3RD SLOT
        if ([board getValueAtRow:row Column:2] != 0) {
            if ([board getValueAtRow:row Column:1] != 0) {
                if ([board getValueAtRow:row Column:1] == [board getValueAtRow:row Column:2]) {
                    [board combineValueAtRow:row Column:2 ToRow:row Colum:1];
                }
                else [board retainValueAtRow:row Column:2];
            }
            else if ([board getValueAtRow:row Column:0] != 0) {
                if ([board getValueAtRow:row Column:0] == [board getValueAtRow:row Column:2]) {
                    [board combineValueAtRow:row Column:2 ToRow:row Colum:0];
                }
                else [board moveValueAtRow:row Column:2 ToRow:row Colum:1];
            }
            else [board moveValueAtRow:row Column:2 ToRow:row Colum:0];
        }
        // 4TH SLOT
        if ([board getValueAtRow:row Column:3] != 0) {
            if ([board getValueAtRow:row Column:2] != 0) {
                if ([board getValueAtRow:row Column:2] == [board getValueAtRow:row Column:3]) {
                    [board combineValueAtRow:row Column:3 ToRow:row Colum:2];
                }
                else [board retainValueAtRow:row Column:3];
            }
            else if ([board getValueAtRow:row Column:1] != 0) {
                if ([board getValueAtRow:row Column:1] == [board getValueAtRow:row Column:3]) {
                    [board combineValueAtRow:row Column:3 ToRow:row Colum:1];
                }
                else [board moveValueAtRow:row Column:3 ToRow:row Colum:2];
            }
            else if ([board getValueAtRow:row Column:0] != 0) {
                if ([board getValueAtRow:row Column:0] == [board getValueAtRow:row Column:3]) {
                    [board combineValueAtRow:row Column:3 ToRow:row Colum:0];
                }
                else [board moveValueAtRow:row Column:3 ToRow:row Colum:1];
            }
            else [board moveValueAtRow:row Column:3 ToRow:row Colum:0];
        }
    }
    [board addRandomTile];
    return board;
}

-(_2048Board *)swipeUpWithBoard:(_2048Board *)board{
    for (int column = 0; column<4; column++) {
        // 1ST SLOT
        if ([board getValueAtRow:0 Column:column] != 0) {
            [board retainValueAtRow:0 Column:column];
        }
        // 2ND SLOT
        if ([board getValueAtRow:1 Column:column] != 0) {
            if ([board getValueAtRow:0 Column:column] != 0) {
                if ([board getValueAtRow:0 Column:column] == [board getValueAtRow:1 Column:column]) { // 0=1
                    [board combineValueAtRow:1 Column:column ToRow:0 Colum:column];
                }
                else [board retainValueAtRow:1 Column:column];
            }
            else [board moveValueAtRow:1 Column:column ToRow:0 Colum:column];
        }
        // 3RD SLOT
        if ([board getValueAtRow:2 Column:column] != 0) {
            if ([board getValueAtRow:1 Column:column] != 0) {
                if ([board getValueAtRow:1 Column:column] == [board getValueAtRow:2 Column:column]) {
                    [board combineValueAtRow:2 Column:column ToRow:1 Colum:column];
                }
                else [board retainValueAtRow:2 Column:column];
            }
            else if ([board getValueAtRow:0 Column:column] != 0) {
                if ([board getValueAtRow:0 Column:column] == [board getValueAtRow:2 Column:column]) {
                    [board combineValueAtRow:2 Column:column ToRow:0 Colum:column];
                }
                else [board moveValueAtRow:2 Column:column ToRow:1 Colum:column];
            }
            else [board moveValueAtRow:2 Column:column ToRow:0 Colum:column];
        }
        // 4TH SLOT
        if ([board getValueAtRow:3 Column:column] != 0) {
            if ([board getValueAtRow:2 Column:column] != 0) {
                if ([board getValueAtRow:2 Column:column] == [board getValueAtRow:3 Column:column]) {
                    [board combineValueAtRow:3 Column:column ToRow:2 Colum:column];
                }
                else [board retainValueAtRow:3 Column:column];
            }
            else if ([board getValueAtRow:1 Column:column] != 0) {
                if ([board getValueAtRow:1 Column:column] == [board getValueAtRow:3 Column:column]) {
                    [board combineValueAtRow:3 Column:column ToRow:1 Colum:column];
                }
                else [board moveValueAtRow:3 Column:column ToRow:2 Colum:column];
            }
            else if ([board getValueAtRow:0 Column:column] != 0) {
                if ([board getValueAtRow:0 Column:column] == [board getValueAtRow:3 Column:column]) {
                    [board combineValueAtRow:3 Column:column ToRow:0 Colum:column];
                }
                else [board moveValueAtRow:3 Column:column ToRow:1 Colum:column];
            }
            else [board moveValueAtRow:3 Column:column ToRow:0 Colum:column];
        }
    }
    [board addRandomTile];
    return board;
}

-(_2048Board *)swipeDownWithBoard:(_2048Board *)board{
    for (int column = 0; column<4; column++) {
        // 4TH SLOT
        if ([board getValueAtRow:3 Column:column] != 0) {
            [board retainValueAtRow:3 Column:column];
        }
        // 3RD SLOT
        if ([board getValueAtRow:2 Column:column] != 0) {
            if ([board getValueAtRow:3 Column:column] != 0) {
                if ([board getValueAtRow:2 Column:column] == [board getValueAtRow:3 Column:column]) { // 0=1
                    [board combineValueAtRow:2 Column:column ToRow:3 Colum:column];
                }
                else [board retainValueAtRow:2 Column:column];
            }
            else [board moveValueAtRow:2 Column:column ToRow:3 Colum:column];
        }
        // 2ND SLOT
        if ([board getValueAtRow:1 Column:column] != 0) {
            if ([board getValueAtRow:2 Column:column] != 0) {
                if ([board getValueAtRow:1 Column:column] == [board getValueAtRow:2 Column:column]) {
                    [board combineValueAtRow:1 Column:column ToRow:2 Colum:column];
                }
                else [board retainValueAtRow:1 Column:column];
            }
            else if ([board getValueAtRow:3 Column:column] != 0) {
                if ([board getValueAtRow:1 Column:column] == [board getValueAtRow:3 Column:column]) {
                    [board combineValueAtRow:1 Column:column ToRow:3 Colum:column];
                }
                else [board moveValueAtRow:1 Column:column ToRow:2 Colum:column];
            }
            else [board moveValueAtRow:1 Column:column ToRow:3 Colum:column];
        }
        // 1ST SLOT
        if ([board getValueAtRow:0 Column:column] != 0) {
            if ([board getValueAtRow:1 Column:column] != 0) {
                if ([board getValueAtRow:0 Column:column] == [board getValueAtRow:1 Column:column]) {
                    [board combineValueAtRow:0 Column:column ToRow:1 Colum:column];
                }
                else [board retainValueAtRow:0 Column:column];
            }
            else if ([board getValueAtRow:2 Column:column] != 0) {
                if ([board getValueAtRow:0 Column:column] == [board getValueAtRow:2 Column:column]) {
                    [board combineValueAtRow:0 Column:column ToRow:2 Colum:column];
                }
                else [board moveValueAtRow:0 Column:column ToRow:1 Colum:column];
            }
            else if ([board getValueAtRow:3 Column:column] != 0) {
                if ([board getValueAtRow:0 Column:column] == [board getValueAtRow:3 Column:column]) {
                    [board combineValueAtRow:0 Column:column ToRow:3 Colum:column];
                }
                else [board moveValueAtRow:0 Column:column ToRow:2 Colum:column];
            }
            else [board moveValueAtRow:0 Column:column ToRow:3 Colum:column];
        }
    }
    [board addRandomTile];
    return board;
}

-(void)startGameWithBoard:(_2048Board *)board{
    int randTiles = arc4random() %2 + 2;
    for (int i = 0; i<randTiles; i++) {
        [board addRandomTile];
    }
}

@end
