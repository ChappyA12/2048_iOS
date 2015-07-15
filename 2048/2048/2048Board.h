//
//  2048Board.h
//  2048
//
//  Created by Chappy Asel on 3/29/14.
//  Copyright (c) 2014 CD. All rights reserved.
//

#import <Foundation/Foundation.h>

@interface _2048Board : NSObject {
    int board[4][4];
    int score;
    NSMutableArray *turnMovments;
}

// getting values

-(BOOL)boardIsEmptyAtRow:(int)row Column:(int) column;

-(int)getValueAtRow:(int)row Column:(int) column;

-(int)scoreOfBoard;

- (NSArray *)getTurnMovements;

- (NSArray *)getBoardAsArray;

// setting values

-(void)setValueAtRow:(int)row Column:(int) column To:(int)value;

-(void)removeValueAtRow:(int)row Column:(int) column;

-(void)doubleValueAtRow:(int) row Column:(int) column;

-(void)addRandomTile;

-(void)clearBoard;

// setting/getting values

-(void)moveValueAtRow:(int)row Column:(int) column ToRow:(int)rowTo Colum:(int)columnTo;

-(void)combineValueAtRow:(int)row Column:(int) column ToRow:(int)rowTo Colum:(int)columnTo;

-(void)retainValueAtRow:(int)row Column:(int)column;

// printing values

-(void)printValueAtRow:(int)row Colum:(int) column;

-(void)printBoard;

//other

-(void)initTurnMovements;

-(void)reloadTurnMovements;

@end
