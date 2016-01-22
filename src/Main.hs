module Main where

import Web.Dev.Proxy (mkProxy)
import Network.Wai.Handler.Warp (run)


proxyPort = 9000


main :: IO ()
main = do
  proxy <- mkProxy
  run proxyPort proxy
