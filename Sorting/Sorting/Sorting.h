//
//  Sorting.h
//  Sorting
//
//  Created by zxiao23 on 4/21/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#ifndef Sorting_h
#define Sorting_h

@interface Sorting : NSObject

//methods
+(int *)insertionSort : (int *) arr size : (int) n;
+(int *)selectionSort : (int *) arr size : (int) n;
+(int *)mergeSort : (int *) arr withSize: (int) size;
+(int *)quickSort : (int *) arr withStart : (int) start andEnd : (int) end;
+(int *)countingSort : (int *) arr size : (int) n;
+(int *)radixSort : (int *) arr size : (int) n;
+(int)binarySearch : (int *) arr size : (int) n target : (int) target;
+(double)birthdayProblem;

@end

#endif /* Sorting_h */
