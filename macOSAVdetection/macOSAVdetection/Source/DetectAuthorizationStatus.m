//
//  DetectAuthorizationStatus.m
//  macOSAVdetection
//
//  Created by eZuce Team on 17/04/2020.
//  Copyright © 2020 eZuce Team. All rights reserved.
//

#include "DetectAuthorizationStatus.h"
@import AVFoundation;

JNIEXPORT void JNICALL Java_com_ezuce_utils_MacAV_askForAVPermissions
(JNIEnv *env, jobject thiz)
{
    // Request permission to access the camera and microphone.
    printf("Request permission to access the camera\n");
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo])
    {
        case AVAuthorizationStatusAuthorized:
        {
            // The user has previously granted access to the camera.
            printf("You have camera access\n");
            break;
        }
        case AVAuthorizationStatusNotDetermined:
        {
            // The app hasn't yet asked the user for camera access.
            printf("The app hasn't yet asked the user for camera access\n");
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    printf("Granted access to camera\n");
                } else {
                    printf("Not granted access to camera\n");
                }
            }];
            break;
        }
        case AVAuthorizationStatusDenied:
        {
            // The user has previously denied access.
            printf("Camera access was denied before\n");
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeVideo completionHandler:^(BOOL granted) {
                if (granted) {
                    printf("Granted access to camera\n");
                } else {
                    printf("Not granted access to camera\n");
                }
            }];
           break;
        }
        case AVAuthorizationStatusRestricted:
        {
            // The user can't grant access due to restrictions.
            printf("Restricted access to camera\n");
            break;
        }
    }
    
    printf("Request permission to access the microphone\n");
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio])
    {
        case AVAuthorizationStatusAuthorized:
        {
            // The user has previously granted access to the mic.
            printf("You have microphone access\n");
            break;
        }
        case AVAuthorizationStatusNotDetermined:
        {
            // The app hasn't yet asked the user for mic access.
            printf("The app hasn't yet asked the user for microphone access\n");
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
                if (granted) {
                    printf("Granted access to microphone\n");
                } else {
                    printf("Not granted access to microphone\n");
                }
            }];
            break;
        }
        case AVAuthorizationStatusDenied:
        {
            // The user has previously denied access.
            printf("Microphone access was denied before\n");
            [AVCaptureDevice requestAccessForMediaType:AVMediaTypeAudio completionHandler:^(BOOL granted) {
                if (granted) {
                    printf("Granted access to microphone\n");
                } else {
                    printf("Not granted access to microphone\n");
                }
            }];
           break;
        }
        case AVAuthorizationStatusRestricted:
        {
            // The user can't grant access due to restrictions.
            printf("Restricted access to microphone\n");
            break;
        }
    }
}

JNIEXPORT jbyte JNICALL Java_com_ezuce_utils_MacAV_getCamPermission
(JNIEnv *env, jobject thiz)
{
    // Request permission to access the camera.
    printf("Get cam permission\n");
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo])
    {
        case AVAuthorizationStatusAuthorized:
        {
            // The user has previously granted access to the camera.
            printf("You have camera access\n");
            return 1;
        }
        case AVAuthorizationStatusNotDetermined:
        {
            // The app hasn't yet asked the user for camera access.
            printf("User hasn't yet replied to a camera permission request\n");
            return -1;
        }
        case AVAuthorizationStatusDenied:
        {
            printf("Camera access was denied before\n");
            return 0;
        }
        case AVAuthorizationStatusRestricted:
        {
            // The user can't grant access due to restrictions.
            printf("Restricted access to camera\n");
            return 0;
        }
    }
return 0;
}

JNIEXPORT jbyte JNICALL Java_com_ezuce_utils_MacAV_getMicPermission
(JNIEnv *env, jobject thiz)
{
    printf("Get mic permission\n");
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio])
    {
        case AVAuthorizationStatusAuthorized:
        {
            // The user has previously granted access to the mic.
            printf("You have microphone access\n");
            return 1;
        }
        case AVAuthorizationStatusNotDetermined:
        {
            // The app hasn't yet asked the user for mic access.
            printf("User hasn't yet replied to a microphone permission request\n");
            return -1;
        }
        case AVAuthorizationStatusDenied:
        {
            // The user has previously denied access.
            printf("Microphone access was denied before\n");
            return 0;
        }
        case AVAuthorizationStatusRestricted:
        {
            // The user can't grant access due to restrictions.
            printf("Restricted access to microphone\n");
            return 0;
        }
    }
    return 0;
} 
