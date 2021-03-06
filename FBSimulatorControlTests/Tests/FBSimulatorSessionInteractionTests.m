/**
 * Copyright (c) 2015-present, Facebook, Inc.
 * All rights reserved.
 *
 * This source code is licensed under the BSD-style license found in the
 * LICENSE file in the root directory of this source tree. An additional grant
 * of patent rights can be found in the PATENTS file in the same directory.
 */

#import <XCTest/XCTest.h>

#import <FBSimulatorControl/FBSimulator.h>
#import <FBSimulatorControl/FBSimulatorApplication.h>
#import <FBSimulatorControl/FBSimulatorControl.h>
#import <FBSimulatorControl/FBSimulatorPool.h>
#import <FBSimulatorControl/FBSimulatorSession.h>
#import <FBSimulatorControl/FBSimulatorSessionInteraction.h>

#import "FBSimulatorControlAssertions.h"
#import "FBSimulatorControlFixtures.h"
#import "FBSimulatorControlTestCase.h"

@interface FBSimulatorSessionInteractionTests : FBSimulatorControlTestCase

@end

@implementation FBSimulatorSessionInteractionTests

- (void)testPhotoUpload
{
  FBSimulatorSession *session = [self createBootedSession];
  [self.assert interactionSuccessful:[session.interact uploadPhotos:@[FBSimulatorControlFixtures.photo0Path, FBSimulatorControlFixtures.photo1Path]]];
}

- (void)testVideoUploadSuccess
{
  FBSimulatorSession *session = [self createBootedSession];
  [self.assert interactionSuccessful:[session.interact uploadVideos:@[FBSimulatorControlFixtures.video0Path]]];
}

- (void)testVideoUploadFailure
{
  FBSimulatorSession *session = [self createBootedSession];
  [self.assert interactionFailed:[session.interact uploadVideos:@[FBSimulatorControlFixtures.photo0Path]]];
}

@end
