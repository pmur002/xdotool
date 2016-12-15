\name{mouse}
\alias{mousemove}
\alias{mousemovePolar}
\alias{mousemoveRel}
\alias{mousemoveRelPolar}
\alias{mousedown}
\alias{mouseup}
\alias{click}
\title{
  Move and click the mouse
}
\description{
  Reposition the mouse and simulate mouse clicks.
}
\usage{
mousemove(x, y, clearmodifiers = FALSE, sync = FALSE)
mousemovePolar(theta, distance, clearmodifiers = FALSE, sync = FALSE)
mousemoveRel(x, y, clearmodifiers = FALSE, sync = FALSE)
mousemoveRelPolar(theta, distance, clearmodifiers = FALSE, sync = FALSE)
click(button, rep=1, delay=NULL, clearmodifiers=FALSE)
mousedown(button, clearmodifiers=FALSE)
mouseup(button, clearmodifiers=FALSE)
}
\arguments{
  \item{x}{
    The \code{x} coordinate for the mouse move (for the \code{Rel} version,
    relative to the current x coordinate).
  }
  \item{y}{
    The \code{y} coordinate for the mouse move (for the \code{Rel} version,
    relative to the current y coordinate).
  }
  \item{theta}{
    The angle for the mouse move (0 is up and positive angles are
    clockwise), relative to the centre of the screen (or, for the
    \code{Rel} version, relative to the current mouse position).
  }
  \item{distance}{
    The distance for the mouse move, relative to the centre of the
    screen (or, for the \code{Rel} version, relative to the current
    mouse position).
  }
  \item{button}{
    The mouse button to simulate (typically, 1 is left, 2 is middle,
    3 is right, 4 is wheel up, 5 is wheel down).
  }
  \item{rep}{
    The number of times to click.
  }
  \item{delay}{
    The delay between clicks (in milliseconds), if \code{rep} is more
    than 1.
  }
  \item{clearmodifiers}{
    Logical whether to clear input modifiers (such as the shift key).
  }
  \item{sync}{
    Whether to wait for the mouse to begin moving (will not necessarily
    wait for the mouse to reach its destination).
  }
}
\references{
  \url{http://www.semicomplete.com/projects/xdotool/}
}
\author{
  Paul Murrell
}
\keyword{ utilities }
