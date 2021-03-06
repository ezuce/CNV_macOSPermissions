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

JNIEXPORT jboolean JNICALL Java_com_ezuce_utils_MacAV_getCamPermission
(JNIEnv *env, jobject thiz)
{
    // Request permission to access the camera.
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeVideo])
    {
        case AVAuthorizationStatusAuthorized:
        {
            // The user has previously granted access to the camera.
            printf("You have camera access\n");
            return true;
        }
        case AVAuthorizationStatusNotDetermined:
        {
            // The app hasn't yet asked the user for camera access.
            printf("The app hasn't yet asked the user for camera access\n");
            return false;
        }
        case AVAuthorizationStatusDenied:
        {
            printf("Camera access was denied before\n");
            return false;
        }
        case AVAuthorizationStatusRestricted:
        {
            // The user can't grant access due to restrictions.
            printf("Restricted access to camera\n");
            return false;
        }
    }
return false;
}

JNIEXPORT jboolean JNICALL Java_com_ezuce_utils_MacAV_getMicPermission
(JNIEnv *env, jobject thiz)
{
    switch ([AVCaptureDevice authorizationStatusForMediaType:AVMediaTypeAudio])
    {
        case AVAuthorizationStatusAuthorized:
        {
            // The user has previously granted access to the mic.
            printf("You have microphone access\n");
            return true;
        }
        case AVAuthorizationStatusNotDetermined:
        {
            // The app hasn't yet asked the user for mic access.
            printf("The app hasn't yet asked the user for microphone access\n");
            return false;
        }
        case AVAuthorizationStatusDenied:
        {
            // The user has previously denied access.
            printf("Microphone access was denied before\n");
            return false;
        }
        case AVAuthorizationStatusRestricted:
        {
            // The user can't grant access due to restrictions.
            printf("Restricted access to microphone\n");
            return false;
        }
    }
    return false;
} 
