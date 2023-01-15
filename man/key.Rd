\name{keystroke}
\alias{keystroke}
\alias{keydown}
\alias{keyup}
\alias{typestring}
\title{
  Simulate a keystroke
}
\description{
  Send one or more keystrokes to the active window.
}
\usage{
keystroke(key, delay = NULL, clearmodifiers = FALSE)
keydown(key, clearmodifiers = FALSE)
keyup(key)
typestring(string, delay = 12, clearmodifiers = FALSE, sep = "\n")
}
\arguments{
  \item{key}{
    A character vector describing the keys to type.  The key is
    interpreted as a Keysym
    (e.g., \code{a}, \code{ctrl+a}, \code{BackSpace}).
    \code{keystroke} will accept multiple keys, either in a single
    character value, separated by spaces, or in separate character values.
  }
  \item{delay}{
    The delay between keystrokes (in milliseconds).
    Maximum value is 1000.  A very small delay (e.g., 0) may
    not produce all keys.
  }
  \item{clearmodifiers}{
    Logical whether to clear input modifiers (such as the shift key).
  }
  \item{string}{
    A character value that is typed out literally.  Can have embedded
    spaces and newlines and tabs.
  }
  \item{sep}{
    If multiple character values are provided to \code{typestring},
    they are collapsed to a single value using this separator.
  }
}
\references{
  \url{http://www.semicomplete.com/projects/xdotool/}
}
\author{
  Paul Murrell
}
\keyword{ utilities }
