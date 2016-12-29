module Bot.Telegram.Type.Raw where

--
import           Data.Text    (Text)

-- |This object represents a Telegram user or bot.
data User = User { userId    :: Int         -- ^Unique identifier for this user or bot
                 , firstName :: Text        -- ^User‘s or bot’s first name
                 , lastName  :: Maybe Text  -- ^/Optional/. User‘s or bot’s last name
                 , username  :: Maybe Text  -- ^/Optional/. User‘s or bot’s username
                 }
  deriving (Show, Eq)

-- |This object represents a chat.
data Chat = Chat { chatId        :: Int        -- ^Unique identifier for this chat.
                 , chatType      :: ChatType   -- ^Type of chat
                 , chatTitle     :: Maybe Text -- ^/Optional/. Title, for supergroups, channels and group chats
                 , chatUsername  :: Maybe Text -- ^/Optional/. Username, for private chats, supergroups and channels if available
                 , chatFirstName :: Maybe Text -- ^/Optional/. First name of the other party in a private chat
                 , chatLastName  :: Maybe Text -- ^/Optional/. Last name of the other party in a private chat
                 , chatAMAA      :: Maybe Bool -- ^/Optional/. True if a group has ‘All Members Are Admins’ enabled.
                 }
  deriving (Show, Eq)

-- |Type of chat, can be either “private”, “group”, “supergroup” or “channel”
data ChatType = Private
              | Group
              | SuperGroup
              | Channel
  deriving (Show, Eq)

-- |This object represents a message.
data Message = Message { messageId                    :: Int             -- ^Unique message identifier inside this chat
                       , messageFrom                  :: Maybe User      -- ^/Optional/. Sender, can be empty for messages sent to channels
                       , messageDate                  :: Int             -- ^Date the message was sent in Unix time
                       , messageChat                  :: Chat            -- ^Conversation the message belongs to
                       , messageForwardFrom           :: Maybe User      -- ^/Optional/. For forwarded messages, sender of the original message
                       , messageForwardFromChat       :: Maybe Chat      -- ^/Optional/. For messages forwarded from a channel, information about the original channel
                       , messageForwardFromMessageId  :: Maybe Int       -- ^/Optional/. For forwarded channel posts, identifier of the original message in the channel
                       , messageForwardDate           :: Maybe Int       -- ^/Optional/. For forwarded messages, date the original message was sent in Unix time
                       , messageReplyToMessage        :: Maybe Message   -- ^/Optional/. For replies, the original message
                       , messageEditDate              :: Maybe Int       -- ^/Optional/. Date the message was last edited in Unix time
                       , messageText                  :: Maybe Text      -- ^/Optional/. For text messages, the actual UTF-8 text of the message, 0-4096 characters
                       , messageEntities              :: [MessageEntity] -- ^/Optional/. For text messages, special entities
                       , messageAudio                 :: Maybe Audio     -- ^/Optional/. Message is an audio file, information about the file
                       , messageDocument              :: Maybe Document  -- ^/Optional/. Message is a general file, information about the file
                       , messageGame                  :: Maybe Game      -- ^/Optional/. Message is a game, information about the game
                       , messagePhoto                 :: [PhotoSize]     -- ^/Optional/. Message is a photo, available sizes of the photo
                       , messageSticker               :: Maybe Sticker   -- ^/Optional/. Message is a sticker, information about the sticker
                       , messageVideo                 :: Maybe Video     -- ^/Optional/. Message is a video, information about the video
                       , messageVoice                 :: Maybe Voice     -- ^/Optional/. Message is a voice message, information about the file
                       , messageCaption               :: Maybe Text      -- ^/Optional/. Caption for the document, photo or video, 0-200 characters
                       , messageContact               :: Maybe Contact   -- ^/Optional/. Message is a shared contact, information about the contact
                       , messageLocation              :: Maybe Location  -- ^/Optional/. Message is a shared location, information about the location
                       , messageVenue                 :: Maybe Venue     -- ^/Optional/. Message is a venue, information about the venue
                       , messageNewChatMember         :: Maybe User      -- ^/Optional/. A new member was added to the group, information about them (this member may be the bot itself)
                       , messageLeftChatMember        :: Maybe User      -- ^/Optional/. A member was removed from the group, information about them (this member may be the bot itself)
                       , messageNewChatTitle          :: Maybe Text      -- ^/Optional/. A chat title was changed to this value
                       , messageNewChatPhoto          :: [PhotoSize]     -- ^/Optional/. A chat photo was change to this value
                       , messageDeleteChatPhoto       :: Bool            -- ^/Optional/. Service message: the chat photo was deleted
                       , messageGroupChatCreated      :: Bool            -- ^/Optional/. Service message: the group has been created
                       , messageSupergroupChatCreated :: Bool            -- ^/Optional/. Service message: the supergroup has been created
                       , messageChannelChatCreated    :: Bool            -- ^/Optional/. Service message: the channel has been created
                       , messageMigrateToChatId       :: Maybe Int       -- ^/Optional/. The group has been migrated to a supergroup with the specified identifier
                       , messageMigrateFromChatId     :: Maybe Int       -- ^/Optional/. The supergroup has been migrated from a group with the specified identifier
                       , messagePinnedMessage         :: Maybe Message   -- ^/Optional/. Specified message was pinned
                       }
  deriving (Show, Eq)

-- |This object represents one special entity in a text message. For example, hashtags, usernames, URLs, etc.
data MessageEntity = MessageEntity { meType   :: MessageEntityType -- ^Type of the entity
                                   , meOffset :: Int               -- ^Offset in UTF-16 code units to the start of the entity
                                   , meLength :: Int               -- ^Length of the entity in UTF-16 code units
                                   , meUrl    :: Maybe Text        -- ^/Optional/. For “text_link” only, url that will be opened after user taps on the text
                                   , meUser   :: Maybe User        -- ^/Optional/. For “text_mention” only, the mentioned user
                                   }
  deriving (Show, Eq)

-- |This object represents a type of the entity. Can be mention (@username), hashtag, bot_command, url, email, bold (bold text), italic (italic text), code (monowidth string), pre (monowidth block), text_link (for clickable text URLs), text_mention (for users without usernames)
data MessageEntityType = Mention
                       | Hashtag
                       | BotCommand
                       | Url
                       | Email
                       | Bold
                       | Italic
                       | Code
                       | Pre
                       | TextLink
                       | TextMention
  deriving (Show, Eq)

-- |This object represents one size of a photo or a file / sticker thumbnail.
data PhotoSize = PhotoSize { photoId       :: Int       -- ^Unique identifier for this file
                           , photoWidth    :: Int       -- ^Photo width
                           , photoHeight   :: Int       -- ^Photo height
                           , photoFileSize :: Maybe Int -- ^/Optional/. File size
                           }
  deriving (Show, Eq)

-- |This object represents an audio file to be treated as music by the Telegram clients.
data Audio = Audio { audioId       :: Int        -- ^Unique identifier for this file
                   , audioDuration :: Int        -- ^Duration of the audio in seconds as defined by sender
                   , audioPerfomer :: Maybe Text -- ^/Optional/. Performer of the audio as defined by sender or by audio tags
                   , audioTitle    :: Maybe Text -- ^/Optional/. Title of the audio as defined by sender or by audio tags
                   , audioMimeType :: Maybe Text -- ^/Optional/. MIME type of the file as defined by sender
                   , audioFileSize :: Maybe Int  -- ^/Optional/. File size
                   }
  deriving (Show, Eq)

-- |This object represents a general file (as opposed to photos, voice messages and audio files).
data Document = Document { documentId       :: Int             -- ^Unique file identifier
                         , documentThumb    :: Maybe PhotoSize -- ^/Optional/. Document thumbnail as defined by sender
                         , documentName     :: Maybe Text      -- ^/Optional/. Original filename as defined by sender
                         , documentMimeType :: Maybe Text      -- ^/Optional/. MIME type of the file as defined by sender
                         , documentFileSize :: Maybe Int       -- ^/Optional/. File size
                         }
  deriving (Show, Eq)

-- |This object represents a sticker.
data Sticker = Sticker { stickerId      :: Int             -- ^Unique identifier for this file
                       , stickerWidth   :: Int             -- ^Sticker width
                       , stickerHeight  :: Int             -- ^Sticker height
                       , stickerThumb   :: Maybe PhotoSize -- ^/Optional/. Sticker thumbnail in .webp or .jpg format
                       , stickerEmoji   :: Maybe Text      -- ^/Optional/. Emoji associated with the sticker
                       , stckerFileSize :: Maybe Int       -- ^/Optional/. File size
                       }
  deriving (Show, Eq)

-- |This object represents a video file.
data Video = Video { videoId       :: Int             -- ^Unique identifier for this file
                   , videoWidth    :: Int             -- ^Video width as defined by sender
                   , videoHeight   :: Int             -- ^Video height as defined by sender
                   , videoDuration :: Int             -- ^Duration of the video in seconds as defined by sender
                   , videoThumb    :: Maybe PhotoSize -- ^/Optional/. Video thumbnail
                   , videoMimeType :: Maybe Text      -- ^/Optional/. Mime type of a file as defined by sender
                   , videFileSize  :: Maybe Int       -- ^/Optional/. File size
                   }
  deriving (Show, Eq)

data Voice = Voice { voiceId       :: Int        -- ^Unique identifier for this file
                   , voiceDuration :: Int        -- ^Duration of the audio in seconds as defined by sender
                   , voiceMimeType :: Maybe Text -- ^/Optional/. MIME type of the file as defined by sender
                   , voiceFileSize :: Maybe Int  -- ^/Optional/. File size
                   }
  deriving (Show, Eq)

-- |This object represents a phone contact.
data Contact = Contact { contactPhone     :: Text       -- ^Contact's phone number
                       , contactFirstName :: Text       -- ^Contact's first name
                       , contactLastName  :: Maybe Text -- ^/Optional/. Contact's last name
                       , contactId        :: Maybe Int  -- ^/Optional/. Contact's user identifier in Telegram
                       }
  deriving (Show, Eq)

-- |This object represents a point on the map.
data Location = Location { longitude :: Int -- ^Longitude as defined by sender
                         , latitude  :: Int -- ^Latitude as defined by sender
                         }
  deriving (Show, Eq)

-- |This object represents a venue.
data Venue = Venue { venueLocation     :: Location     -- ^Venue location
                   , venueTitle        :: Text         -- ^Name of the venue
                   , venueAddress      :: Text         -- ^Address of the venue
                   , venueFoursquareId :: Maybe String -- ^/Optional/. Foursquare identifier of the venue
                   }
  deriving (Show, Eq)

-- |This object represent a user's profile pictures.
data UserProfilePhotos = UserProfilePhotos { uppTotalCount :: Int           -- ^Total number of profile pictures the target user has
                                           , uppPhotos     :: [[PhotoSize]] -- ^Requested profile pictures (in up to 4 sizes each)
                                           }
  deriving (Show, Eq)

-- |This object represents a file ready to be downloaded.
data File = File { fileId   :: Int        -- ^Unique identifier for this file
                 , fileSize :: Maybe Int  -- ^/Optional/. File size, if known
                 , filePath :: Maybe Text -- ^/Optional/. File path. Use https://api.telegram.org/file/bot<token>/<file_path> to get the file.
                 }
  deriving (Show, Eq)

-- |This object represents a custom keyboard with reply options.
data ReplyKeyboardMarkup = ReplyKeyboardMarkup { rkmKeyboard        :: [[KeyboardButton]] -- ^Array of button rows, each represented by an Array of 'KeyboardButton' objects
                                               , rkmResizeKeyboard  :: Bool               -- ^/Optional/. Requests clients to resize the keyboard vertically for optimal fit
                                               , rkmOneTineKeyboard :: Bool               -- ^/Optional/. Requests clients to hide the keyboard as soon as it's been used
                                               , rkmSelective       :: Bool               -- ^/Optional/. Use this parameter if you want to show the keyboard to specific users only
                                               }
  deriving (Show, Eq)

-- |This object represents one button of the reply keyboard.
data KeyboardButton = KeyboardButton { kbText            :: Text -- ^Text of the button. If none of the optional fields are used, it will be sent to the bot as a message when the button is pressed
                                     , kbRequestContact  :: Bool -- ^/Optional/. If True, the user's phone number will be sent as a contact when the button is pressed. Available in private chats only
                                     , kbRequestLocation :: Bool -- ^/Optional/. If True, the user's current location will be sent when the button is pressed. Available in private chats only
                                     }
  deriving (Show, Eq)

-- |Upon receiving a message with this object, Telegram clients will remove the current custom keyboard and display the default letter-keyboard.
data ReplyKeyboardRemove = ReplyKeyboardRemove { removeKeyboard :: Bool -- ^Requests clients to remove the custom keyboard
                                               , rkSelective    :: Bool -- ^/Optional/. Use this parameter if you want to remove the keyboard for specific users only
                                               }
  deriving (Show, Eq)

-- |This object represents an inline keyboard that appears right next to the message it belongs to.
data InlineKeyboardMarkup = InlineKeyboardMarkup { inlineKeyboard :: [[InlineKeyboardButton]] -- ^Array of button rows, each represented by an Array of InlineKeyboardButton objects
                                                 }
  deriving (Show, Eq)

-- |This object represents one button of an inline keyboard. You must use exactly one of the optional fields.
data InlineKeyboardButton = InlineKeyboardButton { ikbText   :: Text                       -- ^Label text on the button
                                                 , ikbOption :: InlineKeyboardButtonOption -- ^One of the optional fields
                                                 }
  deriving (Show, Eq)

-- |This object represents one of the optional fields for 'InlineKeyboardButton'.
data InlineKeyboardButtonOption = IKBUrl Text                          -- ^HTTP url to be opened when button is pressed
                                | IKBCallbackData Text                 -- ^Data to be sent in a callback query to the bot when button is pressed, 1-64 bytes
                                | IKBSwitchInlineQuery Text            -- ^If set, pressing the button will prompt the user to select one of their chats, open that chat and insert the bot‘s username and the specified inline query in the input field. Can be empty, in which case just the bot’s username will be inserted.
                                | IKBSwitchInlineQueryCurrentChat Text -- ^If set, pressing the button will insert the bot‘s username and the specified inline query in the current chat's input field. Can be empty, in which case only the bot’s username will be inserted.
                                | IKBCallbackGame CallbackGame         -- ^Description of the game that will be launched when the user presses the button
  deriving (Show, Eq)

-- |This object represents an incoming callback query from a callback button in an inline keyboard. If the button that originated the query was attached to a message sent by the bot, the field message will be present. If the button was attached to a message sent via the bot (in inline mode), the field inline_message_id will be present. Exactly one of the fields data or game_short_name will be present.
data CallbackQuery = CallbackQuery { cqId              :: Int           -- ^Unique identifier for this query
                                   , cqFrom            :: User          -- ^Sender
                                   , cqMessage         :: Maybe Message -- ^/Optional/. Message with the callback button that originated the query
                                   , cqInlineMessageId :: Maybe Text    -- ^/Optional/. Identifier of the message sent via the bot in inline mode, that originated the query
                                   , cqChatInstance    :: Text          -- ^Global identifier, uniquely corresponding to the chat to which the message with the callback button was sent
                                   , cqData            :: Maybe Text    -- ^/Optional/. Data associated with the callback button
                                   , cqGameShortName   :: Maybe Text    -- ^/Optional/. Short name of a Game to be returned, serves as the unique identifier for the game
                                   }
  deriving (Show, Eq)

-- |Upon receiving a message with this object, Telegram clients will display a reply interface to the user (act as if the user has selected the bot‘s message and tapped ’Reply').
data ForceReply = ForceReply { forceReply  :: Bool -- ^Shows reply interface to the user, as if they manually selected the bot‘s message and tapped ’Reply'
                             , frSelective :: Bool -- ^/Optional/. Use this parameter if you want to force reply from specific users only
                             }
  deriving (Show, Eq)

-- |This object contains information about one member of the chat.
data ChatMember = ChatMember { cmUser   :: User             -- ^Information about the user
                             , cmStatus :: ChatMemberStatus -- ^The member's status in the chat
                             }
  deriving (Show, Eq)

-- |This object contains information about 'ChatMember' status.
data ChatMemberStatus = Creator
                      | Administrator
                      | Member
                      | LeftMember
                      | Kicked
  deriving (Show, Eq)

-- |Contains information about why a request was unsuccessfull.
data ResponseParameters = ResponseParameters { rpMigrateToChatId :: Maybe Int -- ^/Optional/. The group has been migrated to a supergroup with the specified identifier
                                             , rpRetryAfter      :: Maybe Int -- ^/Optional/. In case of exceeding flood control, the number of seconds left to wait before the request can be repeated
                                             }
  deriving (Show, Eq)

-- |A placeholder, currently holds no information.
data CallbackGame = CallbackGame
  deriving (Show, Eq)

-- |This object represents a game.
data Game = Game { gameTitle        :: Text            -- ^Title of the game
                 , gameDescription  :: Text            -- ^Description of the game
                 , gamePhoto        :: [PhotoSize]     -- ^Photo that will be displayed in the game message in chats.
                 , gameText         :: Maybe Text      -- ^/Optional/. Brief description of the game or high scores included in the game message
                 , gameTextEntities :: [MessageEntity] -- ^/Optional/. Special entities that appear in text, such as usernames, URLs, bot commands, etc
                 , gameAnimation    :: Maybe Animation -- ^/Optional/. Animation that will be displayed in the game message in chats
                 }
  deriving (Show, Eq)

-- |This object represents an animation file to be displayed in the message containing a game.
data Animation = Animation { animationFileId   :: Int             -- ^Unique file identifier
                           , animationThumb    :: Maybe PhotoSize -- ^/Optional/. Animation thumbnail as defined by sender
                           , animationFilename :: Maybe Text      -- ^/Optional/. Original animation filename as defined by sender
                           , animationMimeType :: Maybe Text      -- ^/Optional/. MIME type of the file as defined by sender
                           , animationFileSize :: Maybe Int       -- ^/Optional/. File size
                           }
  deriving (Show, Eq)

-- |This object represents one row of the high scores table for a game.
data GameHighScore = GameHighScore { ghsPosition :: Int  -- ^Position in high score table for the game
                                   , ghsUser     :: User -- ^User
                                   , ghsScore    :: Int  -- ^Score
                                   }
  deriving (Show, Eq)
