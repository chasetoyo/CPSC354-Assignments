{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_LambdaNat (
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
version = Version [0,1,0,0] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/cpsc/Documents/CPSC354-Assignments/Assignment-2-2/LambdaNat4/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/bin"
libdir     = "/Users/cpsc/Documents/CPSC354-Assignments/Assignment-2-2/LambdaNat4/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/lib/x86_64-osx-ghc-8.6.4/LambdaNat-0.1.0.0-EvitBjaHhSP7BnBJ5PUt9C"
dynlibdir  = "/Users/cpsc/Documents/CPSC354-Assignments/Assignment-2-2/LambdaNat4/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/lib/x86_64-osx-ghc-8.6.4"
datadir    = "/Users/cpsc/Documents/CPSC354-Assignments/Assignment-2-2/LambdaNat4/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/share/x86_64-osx-ghc-8.6.4/LambdaNat-0.1.0.0"
libexecdir = "/Users/cpsc/Documents/CPSC354-Assignments/Assignment-2-2/LambdaNat4/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/libexec/x86_64-osx-ghc-8.6.4/LambdaNat-0.1.0.0"
sysconfdir = "/Users/cpsc/Documents/CPSC354-Assignments/Assignment-2-2/LambdaNat4/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "LambdaNat_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "LambdaNat_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "LambdaNat_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "LambdaNat_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "LambdaNat_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "LambdaNat_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
