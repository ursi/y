module Shared.Transmission where

import Data.Generic.Rep (class Generic)

import Data.Argonaut.Encode (class EncodeJson) as Agt
import Data.Argonaut.Decode (class DecodeJson) as Agt
import Data.Argonaut.Encode.Generic.Rep (genericEncodeJson) as Agt
import Data.Argonaut.Decode.Generic.Rep (genericDecodeJson) as Agt

import Shared.Id (Id)
import Shared.Convo (Event)

-- | Message from client to server
-- | Named "transmission" in order to reduce the number of things called "messages"
data Transmission

  = Transmission_Subscribe
    { cid :: Id "Convo"
    }

  | Transmission_Pull
    { cid :: Id "Convo"
    }

  | Transmission_Push
    { cid :: Id "Convo"
    , event :: Event
    }

derive instance genericTransmission :: Generic Transmission _
instance encodeJsonTransmission :: Agt.EncodeJson Transmission where encodeJson = Agt.genericEncodeJson
instance decodeJsonTransmission :: Agt.DecodeJson Transmission where decodeJson = Agt.genericDecodeJson
