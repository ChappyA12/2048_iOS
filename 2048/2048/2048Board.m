//
//  2048Board.m
//  2048
//
//  Created by Chappy Asel on 3/29/14.
//  Copyright (c) 2014 CD. All rights reserved.
//

#import "2048Board.h"

@implementation _2048Board

// getting values

-(BOOL)boardIsEmptyAtRow:(int)row Column:(int) column{
    if (board[row][column]==0) {
        return YES;
    }
    return NO;
}

-(int)getValueAtRow:(int)row Column:(int) column{
    return board[row][column];
}

- (NSArray *)getTurnMovements{
    return turnMovments;
}

- (NSArray *)getBoardAsArray{
    NSArray *array1 = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:board[0][0]],[NSNumber numberWithFloat:board[0][1]],[NSNumber numberWithFloat:board[0][2]],[NSNumber numberWithFloat:board[0][3]], nil];
    NSArray *array2 = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:board[1][0]],[NSNumber numberWithFloat:board[1][1]],[NSNumber numberWithFloat:board[1][2]],[NSNumber numberWithFloat:board[1][3]], nil];
    NSArray *array3 = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:board[2][0]],[NSNumber numberWithFloat:board[2][1]],[NSNumber numberWithFloat:board[2][2]],[NSNumber numberWithFloat:board[2][3]], nil];
    NSArray *array4 = [[NSArray alloc] initWithObjects:[NSNumber numberWithFloat:board[3][0]],[NSNumber numberWithFloat:board[3][1]],[NSNumber numberWithFloat:board[3][2]],[NSNumber numberWithFloat:board[3][3]], nil];
    NSArray *arrayToReturn = [[NSArray alloc] initWithObjects:array1,array2,array3,array4,nil];
    return arrayToReturn;
}

- (int)scoreOfBoard{
    return score;
}

// setting values

-(void)setValueAtRow:(int)row Column:(int) column To:(int)value{
    board[row][column] = value;
}

-(void)removeValueAtRow:(int)row Column:(int) column{
    board[row][column] = 0;
}

-(void)doubleValueAtRow:(int) row Column:(int) column{
    board[row][column] = board[row][column]*2;
}

-(void)addRandomTile {
    BOOL tileAdded = NO;
    int row = 0;
    int column = 0;
    int value = 0;
    int i = 0;
    while (tileAdded == NO) {
        row = arc4random() % 4;
        column = arc4random() % 4;
        value = arc4random() % 4; //chance of being a 4 instead of 2
        i ++;
        if (board[row][column] == 0) {
            if (value == 3) board[row][column] = 4;
            else board[row][column] = 2;
            tileAdded = YES;
        }
        if (i == 2000) {
            NSLog(@"RANDOM VALUE NOT ADDED");
            tileAdded = YES;
        }
    }
    NSLog(@"Random tile added at %d,%d",row+1,column+1);
    [turnMovments addObject:[NSString stringWithFormat:@"ADDED %d %d",row,column]];
}

-(void)clearBoard{
    for (int row = 0; row<4; row++) {
        for (int column = 0; column<4; column++) {
            board[row][column] = 0;
        }
    }
    score = 0;
}

// setting/getting values

-(void)moveValueAtRow:(int)row Column:(int) column ToRow:(int)rowTo Colum:(int)columnTo{
    board[rowTo][columnTo] = board[row][column];
    board[row][column] = 0;
    NSLog(@"Tile moved from %d,%d to %d,%d",row+1,column+1,rowTo+1,columnTo+1);
    [turnMovments addObject:[NSString stringWithFormat:@"MOVED %d %d %d %d",row,column,rowTo,columnTo]];
}

-(void)combineValueAtRow:(int)row Column:(int) column ToRow:(int)rowTo Colum:(int)columnTo{
    board[rowTo][columnTo] = board[row][column]*2;
    board[row][column] = 0;
    NSLog(@"Tile doubled at %d,%d from %d,%d",rowTo+1,columnTo+1,row+1,column+1);
    score += board[rowTo][columnTo];
    [turnMovments addObject:[NSString stringWithFormat:@"COMBINED %d %d %d %d",rowTo,columnTo,row,column]];
}

-(void)retainValueAtRow:(int)row Column:(int)column{
    NSLog(@"Tile retained at %d,%d",row+1,column+1);
    [turnMovments addObject:[NSString stringWithFormat:@"RETAINED %d %d",row,column]];
}

// printing values

-(void)printValueAtRow:(int)row Colum:(int) column{
    NSLog(@"%d",board[row][column]);
}

-(void)printBoard{
    NSLog(@"\n%d     %d     %d     %d\n%d     %d     %d     %d\n%d     %d     %d     %d\n%d     %d     %d     %d\n",board[0][0],board[0][1],board[0][2],board[0][3],board[1][0],board[1][1],board[1][2],board[1][3],board[2][0],board[2][1],board[2][2],board[2][3],board[3][0],board[3][1],board[3][2],board[3][3]);
}

//other

- (void)initTurnMovements{
    turnMovments = [[NSMutableArray alloc] init];
}

- (void)reloadTurnMovements{
    [turnMovments removeAllObjects];
}

@end
