module Main where

import Prelude
import Gauge.Main
import qualified Main.Model
import qualified Main.Jsonifier
import qualified Main.Aeson
import qualified Data.Aeson
import qualified Data.ByteString.Lazy
import qualified Data.ByteString.Char8 as Char8ByteString
import qualified Jsonifier


main =
  do
    twitter10000Data <- load "samples/twitter10000.json"
    twitter1000Data <- load "samples/twitter1000.json"
    twitter100Data <- load "samples/twitter100.json"
    twitter10Data <- load "samples/twitter10.json"
    twitter1Data <- load "samples/twitter1.json"

    -- Ensure that encoders are correct
    test "jsonifier" encodeWithJsonifier twitter1Data
    test "aeson" encodeWithAeson twitter1Data

    deepseq (twitter10000Data, twitter1000Data, twitter100Data, twitter10Data) $ defaultMain [
      bgroup "jsonifier" [
        bench "1" (nf encodeWithJsonifier twitter1Data)
        ,
        bench "10" (nf encodeWithJsonifier twitter10Data)
        ,
        bench "100" (nf encodeWithJsonifier twitter100Data)
        ,
        bench "1000" (nf encodeWithJsonifier twitter1000Data)
        ,
        bench "10000" (nf encodeWithJsonifier twitter10000Data)
        ]
      ,
      bgroup "aeson" [
        bench "1" (nf encodeWithAeson twitter1Data)
        ,
        bench "10" (nf encodeWithAeson twitter10Data)
        ,
        bench "100" (nf encodeWithAeson twitter100Data)
        ,
        bench "1000" (nf encodeWithAeson twitter1000Data)
        ,
        bench "10000" (nf encodeWithAeson twitter10000Data)
        ]
      ,
      bgroup "lazy-aeson" [
        bench "1" (nf encodeWithLazyAeson twitter1Data)
        ,
        bench "10" (nf encodeWithLazyAeson twitter10Data)
        ,
        bench "100" (nf encodeWithLazyAeson twitter100Data)
        ,
        bench "1000" (nf encodeWithLazyAeson twitter1000Data)
        ,
        bench "10000" (nf encodeWithLazyAeson twitter10000Data)
        ]
      ]

load :: FilePath -> IO Main.Model.Result
load fileName =
  Data.Aeson.eitherDecodeFileStrict' fileName
    >>= either fail return

test name strictEncoder input =
  let encoding = strictEncoder input in
    case Data.Aeson.eitherDecodeStrict' encoding of
      Right decoding ->
        if decoding == input
          then
            return ()
          else
            fail ("Encoder " <> name <> " encodes incorrectly.\nOutput:\n" <> Char8ByteString.unpack encoding)
      Left err ->
        fail ("Encoder " <> name <> " failed: " <> err <> ".\nOutput:\n" <> Char8ByteString.unpack encoding)

encodeWithJsonifier =
  Jsonifier.toByteString . Main.Jsonifier.resultJson

encodeWithAeson =
  Data.ByteString.Lazy.toStrict . Data.Aeson.encode

encodeWithLazyAeson =
  Data.Aeson.encode
