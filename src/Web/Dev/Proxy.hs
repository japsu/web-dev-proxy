{-# LANGUAGE OverloadedStrings #-}

module Web.Dev.Proxy where

import Control.Monad.IO.Class (liftIO)
import qualified Network.HTTP.Conduit as HC
import qualified Network.HTTP.ReverseProxy as RP
import qualified Network.Wai as WAI


apiHost = "127.0.0.1"
apiPort = 3000
reactorHost = "127.0.0.1"
reactorPort = 8000


getProxyDest :: WAI.Request -> IO RP.WaiProxyResponse
getProxyDest req = case WAI.pathInfo req of
    ("api":_)  -> return $ RP.WPRProxyDest $ RP.ProxyDest apiHost apiPort
    _          -> return $ RP.WPRProxyDest $ RP.ProxyDest reactorHost reactorPort


mkProxy :: IO WAI.Application
mkProxy = do
  manager <- HC.newManager HC.tlsManagerSettings
  return $ RP.waiProxyTo getProxyDest RP.defaultOnExc manager
