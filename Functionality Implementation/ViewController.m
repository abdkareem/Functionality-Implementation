//
//  ViewController.m
//  Functionality Implementation
//
//  Created by Taiyaba Sultana on 2/3/17.
//  Copyright © 2017 Abdul Kareem. All rights reserved.
//

#import "ViewController.h"
#import <SystemConfiguration/SystemConfiguration.h>
#import "Reachability.h"
#import "NoInternetViewController.h"



@interface ViewController ()

@property (nonatomic) Reachability * hostReachability;
@property (nonatomic) Reachability * internetReachability;
@property (nonatomic) Reachability * wifiReachability;

-(void)logReachability:(Reachability *)reachability;

@end


@implementation ViewController {
    CLLocationManager * pointerToLocationManager;
}



- (void)viewDidLoad {
    [super viewDidLoad];
    // Do any additional setup after loading the view, typically from a nib.
    NSLog(@"View did load");
    
    self.hostReachability = [Reachability reachabilityWithHostName:@"www.cnn.com"];
    [self.hostReachability startNotifier];
    
    self.internetReachability = [Reachability reachabilityForInternetConnection];
    [self.internetReachability startNotifier];
    
//    self.wifiReachability = [Reachability reachabilityForLocalWiFi];
//    [self.wifiReachability startNotifier];
    
    [[NSNotificationCenter defaultCenter] addObserver:self selector:@selector(reachabilityChanged:) name:kReachabilityChangedNotification object: nil];
    
    [self logReachability:self.hostReachability];
    [self logReachability:self.internetReachability];
//    [self logReachailbity:self.wifiReachability];
    
    NSLog(@"Next is get location");
    [self getLocation];
}

- (IBAction)getLocationData:(id)sender {
    NSLog(@"button clicked");
    //[self getLocation];
}

- (void)reachabilityChanged:(NSNotification *)notification {
    Reachability *reachability = [notification object];
    [self logReachability: reachability];
}

- (void)logReachability:(Reachability *)reachability {
    NSString *whichReachabilityString = nil;
    //comment as much as you can to understand the code
    if (reachability == self.hostReachability) {
        whichReachabilityString = @"www.raaaaa.com";
    } else if (reachability == self.internetReachability) {
        whichReachabilityString = @"The Internet";
    } else if (reachability == self.wifiReachability) {
        whichReachabilityString = @"Local Wi-Fi";
    }

    NSString *howReachableString = nil;
    
    switch (reachability.currentReachabilityStatus) {
        case NotReachable: {
            howReachableString = @"not reachable";
            UIStoryboard * pointerToStoryBoard = [UIStoryboard storyboardWithName:@"Main" bundle:[NSBundle mainBundle]];
            NoInternetViewController * pointerToNoInternetVC = [pointerToStoryBoard instantiateViewControllerWithIdentifier:@"NoInternetVC"];
            pointerToNoInternetVC.modalTransitionStyle = UIModalTransitionStyleCoverVertical;
            [self presentViewController:pointerToNoInternetVC animated:YES completion:nil];
            break;
        }
        case ReachableViaWWAN: {
            howReachableString = @"reachable by cellular data";
            break;
        }
        case ReachableViaWiFi: {
            howReachableString = @"reachable by Wi-Fi";
            break;
        }
    }
    
    NSLog(@"%@ %@", whichReachabilityString, howReachableString);
}

- (void)getLocation {
    NSLog(@"Entered Get location");
    pointerToLocationManager = [[CLLocationManager alloc] init];
    pointerToLocationManager.delegate = self;
    pointerToLocationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
    
    [pointerToLocationManager requestWhenInUseAuthorization];
    [pointerToLocationManager startUpdatingLocation];
}

- (void)didReceiveMemoryWarning {
    [super didReceiveMemoryWarning];
    // Dispose of any resources that can be recreated.
    NSLog(@"Did receive memory warning");
}

#pragma mark - CLLocationManagerDelegate

- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
{
    NSLog(@"didFailWithError: %@", error);
    UIAlertController * pointerToUIAlertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Failed to get your location" preferredStyle:UIAlertControllerStyleAlert];
    UIAlertAction * pointerToCancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
    [pointerToUIAlertController addAction:pointerToCancelAction];
    [self presentViewController:pointerToUIAlertController animated:YES completion:nil];
}

- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
{
    NSLog(@"\n\n\n*************\n\n\ndidUpdateToLocation: %@", newLocation);
    CLLocation *currentLocation = newLocation;
    
    if (currentLocation != nil) {
        //        longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
        //        latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
        NSLog(@"Longitude value is %@ and Latitude value is %@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude], [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]);
    }
    [pointerToLocationManager stopUpdatingLocation];
}

@end
