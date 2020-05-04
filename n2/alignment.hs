import Data.List

{-
 - Code by Simon Tenggren (si6187te-s) 
 - &&      Elias Rudberg  (TODO: ELIAS)
 - }
scoreMatch    = 1
scoreMismatch = -1
scoreSpace    = -2

type AlignmentType = (String, String)

-- Assume the strings have already been optimaly aligned.
similiarityScore :: String -> String -> Int
similiarityScore _ [] = 0
similiarityScore [] _ = 0
similiarityScore (s:ss) (p:ps)
        | s == '-' || p == '-' = scoreSpace + similiarityScore ss ps
        | s == p               = scoreMatch + similiarityScore ss ps
        | otherwise            = scoreMismatch + similiarityScore ss ps


-- Attach heads adds h1 and h2 as heads to all lists in the list of tuples of lists (aList)
-- Uses list comprehension instead of recursion
-- attachHeads 0 1 [([2,2,2], [3,3,3])] = [([0,2,2,2], [1,3,3,3])]
attachHeads :: a -> a -> [([a], [a])] -> [([a], [a])]
attachHeads h1 h2 aList = [(h1:xs, h2:ys) | (xs, ys) <- aList]


-- Returns the elements which score the highest comparable score b from the function valueFcn
-- e.g. maximaBy length ["cs", "ow", "o"] = ["cs", "ow"]
maximaBy :: Ord b => (a -> b) -> [a] -> [a]
maximaBy valueFcn xs = [x | x <- sorted, valueFcn x == score]
                     -- Reverse sort to get largest/highest score first
                     where sorted = sortBy (\x y -> compare (valueFcn y) (valueFcn x)) xs 
                           score  = valueFcn (head sorted)

optAlignments :: String -> String -> [AlignmentType]
optAlignments (s:ss) (p:ps) = undefined
