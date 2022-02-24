//
//  Sorting.m
//  Sorting
//
//  Created by zxiao23 on 4/21/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Sorting.h"

@implementation Sorting

//constructor
-(instancetype)init{
    self = [super init];
    if(self){
        NSLog(@"Sorting object successfully initialized");
    }
    return self;
}

//methods
//N^2
+(int *)insertionSort : (int *) arr size : (int) n{
    for(int beginUnsort = 1; beginUnsort < n; beginUnsort++){
        int curIndex = beginUnsort - 1;
        int value = arr[beginUnsort];
        while(curIndex >= 0 && value < arr[curIndex]){
            arr[curIndex + 1] = arr[curIndex];
            curIndex--;
        }
        arr[curIndex + 1] = value;
    }
    return arr;
}

//N^2
+(int *)selectionSort : (int *) arr size : (int) n{
    for(int curIndex = 0; curIndex < n; curIndex++){
        int smallestIndex = curIndex;
        for(int i = smallestIndex; i < n; i++){
            if(arr[smallestIndex] > arr[i]){
                smallestIndex = i;
            }
        }
        int temp = arr[curIndex];
        arr[curIndex] = arr[smallestIndex];
        arr[smallestIndex] = temp;
    }
    return arr;
}

+(int *)mergeSort : (int *) arr withSize: (int) size{
    //it is sorted if there is only one element
    if(size <= 1){
        return arr;
    }
    //we've got to split the array in the middle
    int middle = size/2;
    int* right = &arr[middle];
    return [self mergeWithLeftArray:[self mergeSort:arr withSize:middle] ofSize:middle andRightArray:[self mergeSort:right withSize:(size - middle)] ofSize:(size - middle)];//go into wrapper
}

+(int *)mergeWithLeftArray : (int *) arr1 ofSize: (int) size1 andRightArray: (int *) arr2 ofSize: (int) size2{
    int index1 = 0;
    int index2 = 0;
    int indexNew = 0;
    int * newArr = malloc((size1 + size2) * sizeof(int));
    while(index1 < size1 && index2 < size2){
        if(arr1[index1] <= arr2[index2]){
            newArr[indexNew] = arr1[index1];
            index1++;
        }else{
            newArr[indexNew] = arr2[index2];
            index2++;
        }
        indexNew++;
    }
    while(index1 < size1){
        newArr[indexNew] = arr1[index1];
        index1++;
        indexNew++;
    }
    while(index2 < size2){
        newArr[indexNew] = arr2[index2];
        index2++;
        indexNew++;
    }
    return newArr;
}

+(int *)quickSort : (int *) arr withStart : (int) start andEnd : (int) end{
    if(start < end){
        int pivotPoint = [self pivotAroundLast:arr withStart:start andEnd:end];
        
        [self quickSort:arr withStart:start andEnd:pivotPoint-1];
        [self quickSort:arr withStart:pivotPoint+1 andEnd:end];
    }
    return arr;
}

+(int)pivotAroundLast : (int *) arr withStart : (int) start andEnd : (int) end{
    int pivot = arr[end];//I choice set the pivot to the last element in the array
    int index = start - 1;
    
    for(int i = start; i <= end - 1; i++){
        if(arr[i] < pivot){
            index++;
            [self swap: &arr[i] : &arr[index]]; //the "&" simply gets the address
        }
    }
    [self swap: &arr[index+1] : &arr[end]];
    return ++index;
}

//I don't want to pass in an array and two indexes, so I decided to pass in the address of the two numbers I want to swap.
+(void)swap : (int *) a : (int *) b{
    int temp = *a;
    *a = *b;
    *b = temp;
}

//O(n+k)
//This sort is very interesting, I like this algorithm. For arrays that contains small values (smaller than the size of the array), this sorting algorithm could sort the array in linear time!!!
+(int *)countingSort : (int *) arr size : (int) n{
    int maxNumber = [self largest:arr size:n];
    int* position = malloc((maxNumber+1)*sizeof(int));
    
    for(int i = 0; i <= maxNumber; i++){
        position[i] = 0;
    }
    for(int i = 0; i < n; i++){
        position[arr[i]]++;
    }
    for(int i = 1; i <= maxNumber; i++){
        position[i] += position[i-1];
    }
    
    int* ans = malloc((n+1) * sizeof(int));
    
    for(int i = n - 1; i >= 0 ; --i){
        ans[position[arr[i]] - 1] = arr[i];
        position[arr[i]]--;
    }
    return ans;
}

//I like radix sort too, especially how the time complexity depends on the base of the numbers.
+(int *)radixSort : (int *) arr size : (int) n{
    int maxNumber = [self largest:arr size :n];
    for(int digit = 1; maxNumber / digit > 0; digit *= 10){
        arr = [self countingRadix:arr size: n digit:digit];
    }
    return arr;
}

//This is the counting sort that is designed to help radix sort. The digit variables indicates which digit we are on.
+(int *)countingRadix:(int *)arr size: (int) n digit: (int) d{
    int* position = malloc(10*sizeof(int));
    
    for(int i = 0; i < 10; i++){
        position[i] = 0;
    }
    
    for(int i = 0; i < n; i++){
        position[(arr[i] / d) % 10]++;
    }
    for(int i = 1; i < 10; i++){
        position[i] += position[i-1];
    }
    
    int *ans = malloc((n+1) * sizeof(int));
    for(int i = n - 1; i >= 0 ; i--){
        ans[position[(arr[i] / d) % 10] - 1] = arr[i];
        position[(arr[i] / d) % 10]--;
    }
    return ans;
}

//This method finds the largest value in an array. It is used in counting sort and radix sort.
+(int)largest : (int*) arr size : (int) n{
    int max = -1;
    for(int i = 0; i < n; i++){
        if(max < arr[i]){
            max = arr[i];
        }
    }
    return max;
}

+(int)binarySearch : (int *) arr size : (int) n target : (int) target{
    int left = 0;
    int right = n-1;
    while(left <= right){
        int mid = (left + right)/2;
        if(arr[mid] == target){
            return mid;
        }else if(arr[mid] < target){
            left = mid+1;
        }else{
            right = mid-1;
        }
    }
    return -1;
}

+(double)birthdayProblem{
    double total = 0;
    int n = 0;
    int iterations = 1;
    printf("Enter n please: ");
    scanf("%d", &n);
    printf("Enter number of tests please: ");
    scanf("%d", &iterations);
    for(int i = 0; i < iterations; i++){
        int counter = 0;
        NSMutableSet *mySet = [[NSMutableSet alloc] init];
        while(true){
            NSNumber *new = [NSNumber numberWithInt:arc4random_uniform(n)];
            if([mySet member:new]){
                total += counter;
                break;
            }
            [mySet addObject:new];
            counter++;
        }
    }
    return total/(double)iterations;
}

@end
