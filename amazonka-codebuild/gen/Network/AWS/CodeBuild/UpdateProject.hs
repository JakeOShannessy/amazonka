{-# LANGUAGE DeriveDataTypeable #-}
{-# LANGUAGE DeriveGeneric      #-}
{-# LANGUAGE OverloadedStrings  #-}
{-# LANGUAGE RecordWildCards    #-}
{-# LANGUAGE TypeFamilies       #-}

{-# OPTIONS_GHC -fno-warn-unused-imports #-}
{-# OPTIONS_GHC -fno-warn-unused-binds   #-}
{-# OPTIONS_GHC -fno-warn-unused-matches #-}

-- Derived from AWS service descriptions, licensed under Apache 2.0.

-- |
-- Module      : Network.AWS.CodeBuild.UpdateProject
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Changes the settings of an existing build project.
--
--
module Network.AWS.CodeBuild.UpdateProject
    (
    -- * Creating a Request
      updateProject
    , UpdateProject
    -- * Request Lenses
    , upArtifacts
    , upEnvironment
    , upSource
    , upEncryptionKey
    , upDescription
    , upServiceRole
    , upTags
    , upTimeoutInMinutes
    , upName

    -- * Destructuring the Response
    , updateProjectResponse
    , UpdateProjectResponse
    -- * Response Lenses
    , uprsProject
    , uprsResponseStatus
    ) where

import           Network.AWS.CodeBuild.Types
import           Network.AWS.CodeBuild.Types.Product
import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response

-- | /See:/ 'updateProject' smart constructor.
data UpdateProject = UpdateProject'
    { _upArtifacts        :: !(Maybe ProjectArtifacts)
    , _upEnvironment      :: !(Maybe ProjectEnvironment)
    , _upSource           :: !(Maybe ProjectSource)
    , _upEncryptionKey    :: !(Maybe Text)
    , _upDescription      :: !(Maybe Text)
    , _upServiceRole      :: !(Maybe Text)
    , _upTags             :: !(Maybe [Tag])
    , _upTimeoutInMinutes :: !(Maybe Nat)
    , _upName             :: !Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UpdateProject' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'upArtifacts' - Information to be changed about the build project's build output artifacts.
--
-- * 'upEnvironment' - Information to be changed about the build project's build environment.
--
-- * 'upSource' - Information to be changed about the build project's build input source code.
--
-- * 'upEncryptionKey' - The replacement AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build project's build output artifacts. You can specify either the CMK's Amazon Resource Name (ARN) or, if available, the CMK's alias (using the format @alias//alias-name/ @ ).
--
-- * 'upDescription' - A new or replacement description of the build project.
--
-- * 'upServiceRole' - The replacement Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.
--
-- * 'upTags' - The replacement set of tags for this build project. These tags are available for use by AWS services that support AWS CodeBuild build project tags.
--
-- * 'upTimeoutInMinutes' - The replacement value in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait to timeout any related build that did not get marked as completed.
--
-- * 'upName' - The name of the existing build project to change settings.
updateProject
    :: Text -- ^ 'upName'
    -> UpdateProject
updateProject pName_ =
    UpdateProject'
    { _upArtifacts = Nothing
    , _upEnvironment = Nothing
    , _upSource = Nothing
    , _upEncryptionKey = Nothing
    , _upDescription = Nothing
    , _upServiceRole = Nothing
    , _upTags = Nothing
    , _upTimeoutInMinutes = Nothing
    , _upName = pName_
    }

-- | Information to be changed about the build project's build output artifacts.
upArtifacts :: Lens' UpdateProject (Maybe ProjectArtifacts)
upArtifacts = lens _upArtifacts (\ s a -> s{_upArtifacts = a});

-- | Information to be changed about the build project's build environment.
upEnvironment :: Lens' UpdateProject (Maybe ProjectEnvironment)
upEnvironment = lens _upEnvironment (\ s a -> s{_upEnvironment = a});

-- | Information to be changed about the build project's build input source code.
upSource :: Lens' UpdateProject (Maybe ProjectSource)
upSource = lens _upSource (\ s a -> s{_upSource = a});

-- | The replacement AWS Key Management Service (AWS KMS) customer master key (CMK) to be used for encrypting the build project's build output artifacts. You can specify either the CMK's Amazon Resource Name (ARN) or, if available, the CMK's alias (using the format @alias//alias-name/ @ ).
upEncryptionKey :: Lens' UpdateProject (Maybe Text)
upEncryptionKey = lens _upEncryptionKey (\ s a -> s{_upEncryptionKey = a});

-- | A new or replacement description of the build project.
upDescription :: Lens' UpdateProject (Maybe Text)
upDescription = lens _upDescription (\ s a -> s{_upDescription = a});

-- | The replacement Amazon Resource Name (ARN) of the AWS Identity and Access Management (IAM) role that enables AWS CodeBuild to interact with dependent AWS services on behalf of the AWS account.
upServiceRole :: Lens' UpdateProject (Maybe Text)
upServiceRole = lens _upServiceRole (\ s a -> s{_upServiceRole = a});

-- | The replacement set of tags for this build project. These tags are available for use by AWS services that support AWS CodeBuild build project tags.
upTags :: Lens' UpdateProject [Tag]
upTags = lens _upTags (\ s a -> s{_upTags = a}) . _Default . _Coerce;

-- | The replacement value in minutes, from 5 to 480 (8 hours), for AWS CodeBuild to wait to timeout any related build that did not get marked as completed.
upTimeoutInMinutes :: Lens' UpdateProject (Maybe Natural)
upTimeoutInMinutes = lens _upTimeoutInMinutes (\ s a -> s{_upTimeoutInMinutes = a}) . mapping _Nat;

-- | The name of the existing build project to change settings.
upName :: Lens' UpdateProject Text
upName = lens _upName (\ s a -> s{_upName = a});

instance AWSRequest UpdateProject where
        type Rs UpdateProject = UpdateProjectResponse
        request = postJSON codeBuild
        response
          = receiveJSON
              (\ s h x ->
                 UpdateProjectResponse' <$>
                   (x .?> "project") <*> (pure (fromEnum s)))

instance Hashable UpdateProject

instance NFData UpdateProject

instance ToHeaders UpdateProject where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("CodeBuild_20161006.UpdateProject" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON UpdateProject where
        toJSON UpdateProject'{..}
          = object
              (catMaybes
                 [("artifacts" .=) <$> _upArtifacts,
                  ("environment" .=) <$> _upEnvironment,
                  ("source" .=) <$> _upSource,
                  ("encryptionKey" .=) <$> _upEncryptionKey,
                  ("description" .=) <$> _upDescription,
                  ("serviceRole" .=) <$> _upServiceRole,
                  ("tags" .=) <$> _upTags,
                  ("timeoutInMinutes" .=) <$> _upTimeoutInMinutes,
                  Just ("name" .= _upName)])

instance ToPath UpdateProject where
        toPath = const "/"

instance ToQuery UpdateProject where
        toQuery = const mempty

-- | /See:/ 'updateProjectResponse' smart constructor.
data UpdateProjectResponse = UpdateProjectResponse'
    { _uprsProject        :: !(Maybe Project)
    , _uprsResponseStatus :: !Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'UpdateProjectResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'uprsProject' - Information about the build project that was changed.
--
-- * 'uprsResponseStatus' - -- | The response status code.
updateProjectResponse
    :: Int -- ^ 'uprsResponseStatus'
    -> UpdateProjectResponse
updateProjectResponse pResponseStatus_ =
    UpdateProjectResponse'
    { _uprsProject = Nothing
    , _uprsResponseStatus = pResponseStatus_
    }

-- | Information about the build project that was changed.
uprsProject :: Lens' UpdateProjectResponse (Maybe Project)
uprsProject = lens _uprsProject (\ s a -> s{_uprsProject = a});

-- | -- | The response status code.
uprsResponseStatus :: Lens' UpdateProjectResponse Int
uprsResponseStatus = lens _uprsResponseStatus (\ s a -> s{_uprsResponseStatus = a});

instance NFData UpdateProjectResponse
