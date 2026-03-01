{-# LANGUAGE OverloadedStrings #-}

import Web.Scotty
import Network.Wai.Middleware.RequestLogger (logStdoutDev)
import Data.Text.Lazy.Encoding (decodeUtf8)

main :: IO () 
main = scotty 3000 $ do

    middleware logStdoutDev
    
    -- GET endpoint
    get "/hello" $ do
        text "Hello world!"

    -- Parametrized endpoint
    get "/greet/:name" $ do
        name <- param "name"
        text $ "Hello, " <> name <> "!"

    -- Post endpoint
    post "/echo" $ do
        rawBody <- body
        let bodyText = decodeUtf8 rawBody
        text $ "You posted: " <> bodyText
    