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
-- Module      : Network.AWS.SSM.StopAutomationExecution
-- Copyright   : (c) 2013-2016 Brendan Hay
-- License     : Mozilla Public License, v. 2.0.
-- Maintainer  : Brendan Hay <brendan.g.hay@gmail.com>
-- Stability   : auto-generated
-- Portability : non-portable (GHC extensions)
--
-- Stop an Automation that is currently executing.
--
--
module Network.AWS.SSM.StopAutomationExecution
    (
    -- * Creating a Request
      stopAutomationExecution
    , StopAutomationExecution
    -- * Request Lenses
    , saeAutomationExecutionId

    -- * Destructuring the Response
    , stopAutomationExecutionResponse
    , StopAutomationExecutionResponse
    -- * Response Lenses
    , saersResponseStatus
    ) where

import           Network.AWS.Lens
import           Network.AWS.Prelude
import           Network.AWS.Request
import           Network.AWS.Response
import           Network.AWS.SSM.Types
import           Network.AWS.SSM.Types.Product

-- | /See:/ 'stopAutomationExecution' smart constructor.
newtype StopAutomationExecution = StopAutomationExecution'
    { _saeAutomationExecutionId :: Text
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'StopAutomationExecution' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'saeAutomationExecutionId' - The execution ID of the Automation to stop.
stopAutomationExecution
    :: Text -- ^ 'saeAutomationExecutionId'
    -> StopAutomationExecution
stopAutomationExecution pAutomationExecutionId_ =
    StopAutomationExecution'
    { _saeAutomationExecutionId = pAutomationExecutionId_
    }

-- | The execution ID of the Automation to stop.
saeAutomationExecutionId :: Lens' StopAutomationExecution Text
saeAutomationExecutionId = lens _saeAutomationExecutionId (\ s a -> s{_saeAutomationExecutionId = a});

instance AWSRequest StopAutomationExecution where
        type Rs StopAutomationExecution =
             StopAutomationExecutionResponse
        request = postJSON ssm
        response
          = receiveEmpty
              (\ s h x ->
                 StopAutomationExecutionResponse' <$>
                   (pure (fromEnum s)))

instance Hashable StopAutomationExecution

instance NFData StopAutomationExecution

instance ToHeaders StopAutomationExecution where
        toHeaders
          = const
              (mconcat
                 ["X-Amz-Target" =#
                    ("AmazonSSM.StopAutomationExecution" :: ByteString),
                  "Content-Type" =#
                    ("application/x-amz-json-1.1" :: ByteString)])

instance ToJSON StopAutomationExecution where
        toJSON StopAutomationExecution'{..}
          = object
              (catMaybes
                 [Just
                    ("AutomationExecutionId" .=
                       _saeAutomationExecutionId)])

instance ToPath StopAutomationExecution where
        toPath = const "/"

instance ToQuery StopAutomationExecution where
        toQuery = const mempty

-- | /See:/ 'stopAutomationExecutionResponse' smart constructor.
newtype StopAutomationExecutionResponse = StopAutomationExecutionResponse'
    { _saersResponseStatus :: Int
    } deriving (Eq,Read,Show,Data,Typeable,Generic)

-- | Creates a value of 'StopAutomationExecutionResponse' with the minimum fields required to make a request.
--
-- Use one of the following lenses to modify other fields as desired:
--
-- * 'saersResponseStatus' - -- | The response status code.
stopAutomationExecutionResponse
    :: Int -- ^ 'saersResponseStatus'
    -> StopAutomationExecutionResponse
stopAutomationExecutionResponse pResponseStatus_ =
    StopAutomationExecutionResponse'
    { _saersResponseStatus = pResponseStatus_
    }

-- | -- | The response status code.
saersResponseStatus :: Lens' StopAutomationExecutionResponse Int
saersResponseStatus = lens _saersResponseStatus (\ s a -> s{_saersResponseStatus = a});

instance NFData StopAutomationExecutionResponse
