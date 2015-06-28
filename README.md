# Base 62 encoder-decoder

## Summary
This is an encoder/decoder that accepts an arbitrary "alphabet" as a string to 
use for encoding integers and for decoding them.  It defaults to an alphabet of
`0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ` (and a base62
encoding).  

The decoder does a simple check for validity (characters not in the set of
characters in the input alphabet), and returns `-1` for an invalid string.

The primary use-case (my own itch that is being scratched) is shortening integers
to URL-friendly strings.

## Using

If you don't specify an input alphabet, we will use the default to make a base62
encoder/decoder funciton tuple - if an alphabet is supplied, then the encoder and
decoder uses that.

Example:
```nimrod
from base62 import nil
# Suppose you want a really bad binary encoder - with GenerateFunctionPair we
# have an encoder and decoder using the input alphabet.
let
  (encode,decode) = base62.GenerateFunctionPair("01")

echo encode(32)
echo decode("100000")
```

## Testing

Compile as own module - has a built in unit test for base62 that should run and
assert expected results are equal to runtime results.
