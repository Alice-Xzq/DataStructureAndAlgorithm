//
//  main.m
//  DijkstrasAlgorithm
//
//  Created by zxiao23 on 5/18/21.
//  Copyright © 2021 zxiao23. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "Node.h"
#import "Edge.h"
#import "QueueNode.h"
#import "PriorityQueue.h"

int main(int argc, const char * argv[]) {
    @autoreleasepool {
        //READ FILE
        NSURL *url = [[NSFileManager defaultManager] URLsForDirectory:NSDownloadsDirectory inDomains:NSUserDomainMask][0]; //only read from the downloads directory, please remember to put the usa txt file inside the download directory
        NSError *error;
        url = [url URLByAppendingPathComponent:@"usa.txt"];
        NSString* content = [[NSString alloc] initWithContentsOfURL:url encoding:NSUTF8StringEncoding error:&error];
        if (content == nil) {
        // an error occurred
            NSLog(@"Error reading file at %@\n%@", url, [error localizedFailureReason]);
        }
        NSArray *rawGraph = [content componentsSeparatedByString:@"\r"];
        NSArray *dataCount = [rawGraph[0] componentsSeparatedByString:@"\t"];
        int n = [dataCount[0] intValue]; //number of vertices
        NSMutableArray *vertices = [[NSMutableArray alloc] initWithCapacity:n];
        NSMutableArray *graph = [[NSMutableArray alloc] initWithCapacity:n];
        NSMutableArray *visited = [[NSMutableArray alloc] initWithCapacity:n];
        
        for(int i = 0; i < n; i++){
            NSArray *curNode = [rawGraph[i+1] componentsSeparatedByString:@"\t"];
            [vertices addObject:[[Node alloc] initNode:[curNode[0] intValue] WithX:[curNode[1] intValue] andY:[curNode[2] intValue]]];
            [graph addObject:[[NSMutableArray alloc] init]];
            [visited addObject:[NSNumber numberWithBool:false]];
        }
        
        for(int i = 0; i < [dataCount[1] intValue]; i++){
            NSArray *curNode = [rawGraph[n+i+2] componentsSeparatedByString:@"\t"];
            Node *node1 = vertices[[curNode[0] intValue]];
            Node *node2 = vertices[[curNode[1] intValue]];
            [graph[node1.ID] addObject:[[Edge alloc] initWithStart:node1 WithEnd:node2]];
            [graph[node2.ID] addObject:[[Edge alloc] initWithStart:node2 WithEnd:node1]];
        }
        
        //debug
//        for(int i = 0; i < [graph count]; i++){
//            NSMutableArray *cur = graph[i];
//            NSLog(@"Node: %d // ", i);
//            for(int j = 0; j < [cur count]; j++){
//                Edge *edge = cur[j];
//                NSLog(@"%d %f ", edge.to, edge.distance);
//            }
//            NSLog(@"\n");
//        }
        
        Node *start = vertices[0];
        Node *end = vertices[80000];
        QueueNode *node = [[QueueNode alloc] initWithprev:NULL andID:start.ID andDistance:0];
        PriorityQueue *myQueue = [[PriorityQueue alloc] init];
        QueueNode *shortest;
        [myQueue add:node];
        while (![myQueue isEmpty]) {
            QueueNode *cur = [myQueue popMin];
            if([visited[cur.ID] boolValue]){
                continue;
            }
            if(cur.ID == end.ID){
                shortest = cur;
                NSLog(@"Found the shortest path!");
                break;
            }
            for (int i = 0; i < [graph[cur.ID] count]; i++) {
                Edge *newEdge = graph[cur.ID][i];
                [myQueue add:[[QueueNode alloc] initFromQueueNode:cur toNewNode:newEdge]];
            }
            visited[cur.ID] = [NSNumber numberWithBool:true];
        }
        
        while(shortest){
            NSLog(@"Node: %d Total Distance: %f", shortest.ID, shortest.distanceUntil);
            shortest = shortest.prevNode;
        }

    }
    return 0;
}
