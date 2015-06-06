import private/resultSet as rs

# These all use alphabet as a parameter, but it would make more sense to have
# it as a parameter to have these be templates that generate these procedures,
# as we'll only really want to specify on the first call.

const
  base: string = "0123456789abcdefghijklmnopqrstuvwxyzABCDEFGHIJKLMNOPQRSTUVWXYZ"

proc encode*(input: int;
            alhabet: string = base): string =
  result = base

# Should return either decoded result or -1 for error
proc decode*(input: string;
            alphabet: string =base): int =
  if not rs.isValidResult(input,alphabet):
    return -1
  return 0
