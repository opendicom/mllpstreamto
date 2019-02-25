//
//  main.m
//  mllpstreamto
//
//  Created by jacquesfauquex on 2019-02-25.
//  Copyright © 2019 jacquesfauquex. All rights reserved.
//

#import <Foundation/Foundation.h>
#import "mllp.h"

int main(int argc, const char * argv[]) {
   int returnValue=-1;
   @autoreleasepool {
      NSStringEncoding encoding=NSISOLatin1StringEncoding;
      NSArray *args=[[NSProcessInfo processInfo] arguments];
      
      
      switch (argc) {
         case 3:
            encoding=(NSStringEncoding)[args[2]intValue];
         case 2:
         {
            NSData *inputStream=[[NSFileHandle fileHandleWithStandardInput] readDataToEndOfFile];
            if (inputStream && [inputStream length])
            {
               NSString *inputString=[[NSString alloc]initWithData:inputStream encoding:NSUTF8StringEncoding];
               NSArray *ipport=[args[1] componentsSeparatedByString:@":"];
               NSMutableString *payload=[NSMutableString string];
               returnValue=(![mllp sendPacs:@{@"mllpip":ipport[0],@"mllpport":ipport[1]} message:inputString stringEncoding:encoding payload:payload]);
               NSLog(@"%@",payload);
            }
            else
               NSLog(@"hl7 message to be send expected in stdin");
         }
            break;
            
         default:
            NSLog(@"\r\n\r\nsyntax    : hl7utf8message | mllpsend ip:port [encoding]\r\nreturns   : 0 when succes payload was received\r\nencodings : NSASCIIStringEncoding = 1\r\n            NSUTF8StringEncoding = 4\r\n            NSISOLatin1StringEncoding = 5 (default, if value is omitted)\r\n\r\n");
             break;
      }
   }
   return returnValue;
}
