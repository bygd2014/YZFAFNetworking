//
//  YZFAFNetworkingViewController.m
//  YZFAFNetworking
//
//  Created by kingdomrain on 02/14/2017.
//  Copyright (c) 2017 kingdomrain. All rights reserved.
//

#import "YZFAFNetworkingViewController.h"
#import <YZFAFNetworking/YZFAFNetworking.h>

@interface YZFAFNetworkingViewController ()

@end

@implementation YZFAFNetworkingViewController

- (void)viewDidLoad
{
    [super viewDidLoad];
	// Do any additional setup after loading the view, typically from a nib.

    YZFAFHTTPSessionManager *manager = [YZFAFHTTPSessionManager manager];
    manager.requestSerializer = [AFHTTPRequestSerializer  serializer];
    manager.responseSerializer = [AFHTTPResponseSerializer serializer];
    
    [manager.responseSerializer setAcceptableContentTypes:[NSSet setWithObjects:@"application/json",@"application/xml",@"text/json",@"text/javascript",@"text/xml",@"text/plain",  nil]];
    [manager.requestSerializer setTimeoutInterval:20];
    
    NSMutableDictionary *params = [NSMutableDictionary dictionary];
    params[@"username"] = @"test";
    params[@"password"] = @"test";
    params[@"encoding"] = @"utf-8";
    [manager POST:@"http://cloud.exocr.com/face" parameters:params constructingBodyWithBlock:^(id<AFMultipartFormData>  _Nonnull formData) {
      
    } progress:^(NSProgress * _Nonnull uploadProgress) {
        ;
    } success:^(NSURLSessionDataTask * _Nonnull task, id  _Nullable responseObject) {
        NSLog(@"request url =%@\n request dic = %@",task.response.URL ,params);
        NSLog(@"response = \n%@",responseObject);
        NSDictionary *json =[NSJSONSerialization JSONObjectWithData:responseObject options:kNilOptions
                                                              error:nil];
        NSLog(@"json==%@",json);
        
    } failure:^(NSURLSessionDataTask * _Nullable task, NSError * _Nonnull error) {
        NSLog(@"request url =%@\n request dic = %@",task.response.URL ,params);
        NSLog(@"error = \n%@",error.localizedDescription);
    }];
    
    
}

- (void)didReceiveMemoryWarning
{
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
}

@end
