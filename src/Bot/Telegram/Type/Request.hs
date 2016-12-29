module Bot.Telegram.Type.Request where

import           Data.Text             (Text)

import           Bot.Telegram.Type.Raw

-- |A simple method for testing your bot's auth token. Requires no parameters. Returns basic information about the bot in form of a 'User' object.
data GetMe = GetMe
  deriving (Show, Eq)

-- |Use this method to send text messages. On success, the sent 'Message' is returned.
data SendMessage = SendMessage { smChatId                :: Int
                               , smText                  :: Text
                               , smParseMode             :: Maybe ParseMode
                               , smDisableWebPagePreview :: Bool
                               , smDisableNotification   :: Bool
                               , smReplyToMessageId      :: Maybe Int
                               , smReplyMarkup           :: Maybe ReplyMarkup
                               }
  deriving (Show, Eq)

-- |
data ParseMode = Markdown
               | HTML
  deriving (Show, Eq)

-- |
data ReplyMarkup = IKM InlineKeyboardMarkup
                 | RKM ReplyKeyboardMarkup
                 | RKR ReplyKeyboardRemove
                 | FR ForceReply
  deriving (Show, Eq)
