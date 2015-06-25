import tables
import private/resultSet as rs

# Alphabet is provided to factory functions that return the encoder and decoder
# as a tuple of functions.

const
  base: string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

type 
  DecoderFunc* = proc(input: int):    string
  EncoderFunc* = proc(input: string): int
  FunctionPair* = tuple[encoder: EncoderFunc, decoder: DecoderFunc]

proc encode*(input: int;
            alphabet: string = base): string =
  let
    baseNum: int = len(alphabet)
  var
    remainder:  int = input mod baseNum
    integerDiv: int = input div baseNum
    encoded:    string = "" & alphabet[remainder]

  while (integerDiv != 0):
    remainder  = integerDiv mod baseNum
    integerDiv = integerDiv div baseNum
    encoded    = alphabet[remainder] & encoded

  result = encoded

# Should return either decoded result or -1 for error
proc decode*(input: string;
            alphabet: string = base): int =
  if not rs.isValidResult(input,alphabet):
    return -1
  var 
      PositionMap  = rs.toCharMap(alphabet)
      decoded: int = PositionMap[input[0]]
  let
    input_limit: int = len(input)
    baseNum:     int = len(alphabet)
  # For each letter of this, want to get position in input
  for i in 1..<input_limit:
    decoded = baseNum * decoded + PositionMap[input[i]]
  return decoded
  
when isMainModule:
  let
    test_encoded:   string = "5e3T6"
    test_decoded:   int    = 77233220
    encoded_output: string = encode(test_decoded)
    decoded_output: int    = decode(test_encoded)

    
  echo "ENCODING: Expected " & test_encoded & " and got: " & encoded_output
  echo("DECODING: Expected " & $test_decoded & " and got: " & $decoded_output)
  doAssert encoded_output == test_encoded
  doAssert decoded_output == test_decoded
