{-# LANGUAGE QuasiQuotes #-}

module Auth where

import ClassyPrelude
import Text.Regex.PCRE.Heavy
import Validation

data Email = Email
  { emailRaw :: Text
  } deriving (Show, Eq)

rawEmail :: Email -> Text
rawEmail = emailRaw

mkEmail :: Text -> Either [Text] Email
mkEmail = validate Email [regexMatches [re|.@.|] "Not a valid email"]

newtype Password = Password
  { passwordRaw :: Text
  } deriving (Show, Eq)

rawPassword :: Password -> Text
rawPassword = passwordRaw

mkPassword :: Text -> Either [PasswordValidationErr] Password
mkPassword = undefined

data Auth = Auth
  { authEmail :: Email
  , authPassword :: Password
  } deriving (Show, Eq)

data RegistrationError =
  RegistrationErrorEmailTaken
  deriving (Show, Eq)

newtype PasswordValidationErr =
  PasswordValidationErrLength Int
