module WhereBind3 where

f :: String -> String
f x = friends ++ family
  where friends = x
        family = " and family"

main = putStrLn (f "my friends")
