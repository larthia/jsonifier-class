{-# LANGUAGE UnliftedFFITypes #-}
module Jsonifier.Internal.Ffi
where

import Foreign.C
import GHC.Base (ByteArray#, MutableByteArray#)
import Jsonifier.Internal.Prelude

foreign import ccall unsafe "static count_string_allocation_off_len"
  countStringAllocationSize :: ByteArray# -> CSize -> CSize -> IO CInt

foreign import ccall unsafe "static encode_utf16_as_string"
  encodeString :: Ptr Word8 -> ByteArray# -> CSize -> CSize -> IO (Ptr Word8)
