module RpnConverter where

import Token

convertToRpn [a] = [a]
convertToRpn tokens = snd $ break tokens ([], [])
  where
    break tokens@(t@(IntToken i):ts) (inputQueue, outputQueue) = break ts (inputQueue, t:outputQueue)
    break (_:ts) tuples = break ts tuples
    break [] tuples = tuples
