module Main where

-- main :: IO ()
-- main = putStrLn "Hello, Haskell!"

add :: Integer -> Integer -> Integer
add x y = x + y

increment :: Integer -> Integer
increment = add 1

divide :: Integer -> Integer -> Maybe Integer
divide _ 0 = Nothing
divide a b = Just(a `div` b)

main :: IO()
main = case divide 10 1 of
    Nothing -> putStrLn "Cannot divide by 0" 
    Just result -> putStrLn ("Result: " ++ show result)
