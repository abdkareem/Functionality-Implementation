////
////  UserLocationViewController.m
////  Functionality Implementation
////
////  Created by Taiyaba Sultana on 2/4/17.
////  Copyright © 2017 Abdul Kareem. All rights reserved.
////
//
//#import "UserLocationViewController.h"
//
//
//@interface UserLocationViewController ()
//
//@end
//
//@implementation UserLocationViewController {
//    CLLocationManager * pointerToLocationManager;
//}
//
//- (void)viewDidLoad {
//    [super viewDidLoad];
//    // Do any additional setup after loading the view.
//}
//
//- (void)getLocation {
//    NSLog(@"Entered Get location");
//    pointerToLocationManager = [[CLLocationManager alloc] init];
//    pointerToLocationManager.delegate = self;
//    pointerToLocationManager.desiredAccuracy = kCLLocationAccuracyThreeKilometers;
//    [pointerToLocationManager startUpdatingLocation];
//}
//
//#pragma mark - CLLocationManagerDelegate
//
//- (void)locationManager:(CLLocationManager *)manager didFailWithError:(NSError *)error
//{
//    NSLog(@"didFailWithError: %@", error);
//    UIAlertController * pointerToUIAlertController = [UIAlertController alertControllerWithTitle:@"Error" message:@"Failed to get your location" preferredStyle:UIAlertControllerStyleAlert];
//    UIAlertAction * pointerToCancelAction = [UIAlertAction actionWithTitle:@"OK" style:UIAlertActionStyleDefault handler:nil];
//    [pointerToUIAlertController addAction:pointerToCancelAction];
//    [self presentViewController:pointerToUIAlertController animated:YES completion:nil];
//}
//
//- (void)locationManager:(CLLocationManager *)manager didUpdateToLocation:(CLLocation *)newLocation fromLocation:(CLLocation *)oldLocation
//{
//    NSLog(@"\n\n\n*************\n\n\ndidUpdateToLocation: %@", newLocation);
//    CLLocation *currentLocation = newLocation;
//    
//    if (currentLocation != nil) {
////        longitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude];
////        latitudeLabel.text = [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude];
//        NSLog(@"Longitude value is %@ and Latitude value is %@", [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.longitude], [NSString stringWithFormat:@"%.8f", currentLocation.coordinate.latitude]);
//    }
//}
//
//- (void)didReceiveMemoryWarning {
//    [super didReceiveMemoryWarning];
//    // Dispose of any resources that can be recreated.
//}
//
///*
//#pragma mark - Navigation
//
//// In a storyboard-based application, you will often want to do a little preparation before navigation
//- (void)prepareForSegue:(UIStoryboardSegue *)segue sender:(id)sender {
//    // Get the new view controller using [segue destinationViewController].
//    // Pass the selected object to the new view controller.
//}
//*/
//
//@end
