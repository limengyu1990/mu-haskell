{-# language DataKinds         #-}
{-# language OverloadedStrings #-}
{-# language TypeFamilies      #-}
module Main where

import           Mu.Adapter.ProtoBuf
import           Mu.GRpc.Server
import           Mu.Rpc.Examples
import           Mu.Schema

type instance AnnotatedSchema ProtoBufAnnotation QuickstartSchema
  = '[ 'AnnField "HelloRequest" "name" ('ProtoBufId 1 'True)
     , 'AnnField "HelloResponse" "message" ('ProtoBufId 1 'True)
     , 'AnnField "HiRequest" "number" ('ProtoBufId 1 'True) ]

main :: IO ()
main = do
  putStrLn "running quickstart application"
  runGRpcApp msgProtoBuf 8080 quickstartServer
