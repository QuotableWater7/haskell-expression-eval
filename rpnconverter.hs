module RpnConverter where

convertToRpn tokens = snd $ break tokens ([], [])
  where
    break tokens _ = ([], tokens)
