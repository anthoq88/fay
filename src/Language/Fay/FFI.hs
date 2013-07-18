{-# LANGUAGE NoImplicitPrelude    #-}
{-# LANGUAGE TypeSynonymInstances #-}

-- | The internal FFI module. Needs to be renamed to Fay.FFI at some point.

module Language.Fay.FFI
  (Fay
  ,Nullable (..)
  ,Defined (..)
  ,Ptr
  ,Automatic
  ,ffi)
  where

import           Fay.Types
import           Prelude            (Bool, Char, Double, Int, Maybe, String,
                                     error)

-- | Values that may be null
--  Nullable x decodes to x, Null decodes to null.
data Nullable a = Nullable a | Null

-- | Values that may be undefined
-- Defined x encodes to x, Undefined decodes to undefined.
-- An undefined property in a record will be removed when encoding.
data Defined a = Defined a | Undefined

-- | Do not serialize the specified type. This is useful for, e.g.
--
-- > foo :: String -> String
-- > foo = ffi "%1"
--
-- This would normally serialize and unserialize the string, for no
-- reason, in this case. Instead:
--
-- > foo :: Ptr String -> Ptr String
--
-- Will just give an identity function.
type Ptr a = a

-- | The opposite of "Ptr". Serialize the specified polymorphic type.
--
-- > foo :: Automatic a -> String
--
type Automatic a = a

-- | Declare a foreign action.
ffi :: String        -- ^ The foreign value.
    -> a             -- ^ Bottom.
ffi = error "Language.Fay.FFI.foreignFay: Used foreign function not in a JS engine context."
