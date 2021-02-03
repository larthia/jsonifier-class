
module Jsonifier.Internal.Missing (
   char8ByteString
) where

import qualified Jsonifier.Internal.Poke as Poke
import qualified Data.ByteString as ByteString
import qualified PtrPoker.Poke as Poke
import qualified PtrPoker.Write as Write

import Jsonifier.Internal.Prelude
import Jsonifier
import Unsafe.Coerce

{-|
JSON String literal from @ByteString@.
Use it only with utf-8 encoded byte string.
-}
char8ByteString :: ByteString -> Jsonifier.Json
char8ByteString bs =
  let
    size = 2 + ByteString.length bs
    poke =
      Poke.word8 34 <> Poke.byteString bs <> Poke.word8 34
    in write size poke
{-# INLINE char8ByteString #-}


{-# INLINE write #-}
write :: Int -> Poke.Poke -> Jsonifier.Json
write size poke =
  unsafeCoerce (Write.Write size poke)
