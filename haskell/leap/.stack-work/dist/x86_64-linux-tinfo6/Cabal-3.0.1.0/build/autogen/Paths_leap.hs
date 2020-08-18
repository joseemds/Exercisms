{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_leap (
    version,
    getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir,
    getDataFileName, getSysconfDir
  ) where

import qualified Control.Exception as Exception
import Data.Version (Version(..))
import System.Environment (getEnv)
import Prelude

#if defined(VERSION_base)

#if MIN_VERSION_base(4,0,0)
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#else
catchIO :: IO a -> (Exception.Exception -> IO a) -> IO a
#endif

#else
catchIO :: IO a -> (Exception.IOException -> IO a) -> IO a
#endif
catchIO = Exception.catch

version :: Version
version = Version [1,6,0,10] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/home/jose/exercism/haskell/leap/.stack-work/install/x86_64-linux-tinfo6/ceff004b1a2cbddbb711fb75d1c4dd8feef9065c6855729a623f4a0a2d9950e9/8.8.3/bin"
libdir     = "/home/jose/exercism/haskell/leap/.stack-work/install/x86_64-linux-tinfo6/ceff004b1a2cbddbb711fb75d1c4dd8feef9065c6855729a623f4a0a2d9950e9/8.8.3/lib/x86_64-linux-ghc-8.8.3/leap-1.6.0.10-LYoJuQpK4VS8Hfu9SEv0xV"
dynlibdir  = "/home/jose/exercism/haskell/leap/.stack-work/install/x86_64-linux-tinfo6/ceff004b1a2cbddbb711fb75d1c4dd8feef9065c6855729a623f4a0a2d9950e9/8.8.3/lib/x86_64-linux-ghc-8.8.3"
datadir    = "/home/jose/exercism/haskell/leap/.stack-work/install/x86_64-linux-tinfo6/ceff004b1a2cbddbb711fb75d1c4dd8feef9065c6855729a623f4a0a2d9950e9/8.8.3/share/x86_64-linux-ghc-8.8.3/leap-1.6.0.10"
libexecdir = "/home/jose/exercism/haskell/leap/.stack-work/install/x86_64-linux-tinfo6/ceff004b1a2cbddbb711fb75d1c4dd8feef9065c6855729a623f4a0a2d9950e9/8.8.3/libexec/x86_64-linux-ghc-8.8.3/leap-1.6.0.10"
sysconfdir = "/home/jose/exercism/haskell/leap/.stack-work/install/x86_64-linux-tinfo6/ceff004b1a2cbddbb711fb75d1c4dd8feef9065c6855729a623f4a0a2d9950e9/8.8.3/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "leap_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "leap_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "leap_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "leap_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "leap_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "leap_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
