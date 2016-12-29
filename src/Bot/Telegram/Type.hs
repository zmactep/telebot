module Bot.Telegram.Type
    ( Bot (..)
    ) where

-- |Bot configuration
data Bot = Bot { api   :: String -- ^API url. Default is https://api.telegram.org
               , token :: String -- ^Bot unique token
               }
  deriving (Show, Eq)
