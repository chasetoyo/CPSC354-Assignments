{-# LANGUAGE CPP #-}
{-# LANGUAGE NoRebindableSyntax #-}
{-# OPTIONS_GHC -fno-warn-missing-import-lists #-}
module Paths_LamFun (
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
version = Version [3,14,1] []
bindir, libdir, dynlibdir, datadir, libexecdir, sysconfdir :: FilePath

bindir     = "/Users/cpsc/Desktop/CPSC354-Assignments/Assignment3/LambdaFun/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/bin"
libdir     = "/Users/cpsc/Desktop/CPSC354-Assignments/Assignment3/LambdaFun/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/lib/x86_64-osx-ghc-8.6.4/LamFun-3.14.1-FSKLibBIdrS3MDmENIZ0Ol-lamfun"
dynlibdir  = "/Users/cpsc/Desktop/CPSC354-Assignments/Assignment3/LambdaFun/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/lib/x86_64-osx-ghc-8.6.4"
datadir    = "/Users/cpsc/Desktop/CPSC354-Assignments/Assignment3/LambdaFun/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/share/x86_64-osx-ghc-8.6.4/LamFun-3.14.1"
libexecdir = "/Users/cpsc/Desktop/CPSC354-Assignments/Assignment3/LambdaFun/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/libexec/x86_64-osx-ghc-8.6.4/LamFun-3.14.1"
sysconfdir = "/Users/cpsc/Desktop/CPSC354-Assignments/Assignment3/LambdaFun/.stack-work/install/x86_64-osx/32087f799dc8d6f527ab1bb181bdf03d8bac3c7532364a3f95a5e954ad9965cb/8.6.4/etc"

getBinDir, getLibDir, getDynLibDir, getDataDir, getLibexecDir, getSysconfDir :: IO FilePath
getBinDir = catchIO (getEnv "LamFun_bindir") (\_ -> return bindir)
getLibDir = catchIO (getEnv "LamFun_libdir") (\_ -> return libdir)
getDynLibDir = catchIO (getEnv "LamFun_dynlibdir") (\_ -> return dynlibdir)
getDataDir = catchIO (getEnv "LamFun_datadir") (\_ -> return datadir)
getLibexecDir = catchIO (getEnv "LamFun_libexecdir") (\_ -> return libexecdir)
getSysconfDir = catchIO (getEnv "LamFun_sysconfdir") (\_ -> return sysconfdir)

getDataFileName :: FilePath -> IO FilePath
getDataFileName name = do
  dir <- getDataDir
  return (dir ++ "/" ++ name)
