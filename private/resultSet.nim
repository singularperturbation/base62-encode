import tables
import sequtils
import strutils

# Same note here about making this a template rather than a parameter to the
# procedure.
template toCharset(input: string): set[char] =
  var charset: set[char] = {}
  for c in input.items:
    charset.incl(c)
  charset



proc isValidResult*(input: string,
                    alphabet: string): bool =
  var
    validChars: set[char] = toCharset(alphabet)
  input.allCharsInSet(validChars)

template toCharMap*(input: string): Table[char,int] =
  var 
    orderMap = initTable[char,int](rightSize(len(input)))
    count = 0
  for c in input:
    orderMap.add(c,count)
    count += 1
  orderMap

