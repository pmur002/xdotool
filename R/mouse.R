
mousemove <- function(x, y, clearmodifiers=FALSE, sync=FALSE) {
    cmd <- "mousemove "
    if (clearmodifiers) {
        cmd <- paste0(cmd, "--clearmodifiers ")
    }
    if (sync) {
        cmd <- paste0(cmd, "--sync ")
    }
    cmd <- paste0(cmd, x, " ", y)
    xdotool(cmd)
}

mousemovePolar <- function(theta, distance, clearmodifiers=FALSE, sync=FALSE) {
    cmd <- "mousemove "
    if (clearmodifiers) {
        cmd <- paste0(cmd, "--clearmodifiers ")
    }
    if (sync) {
        cmd <- paste0(cmd, "--sync ")
    }
    cmd <- paste0(cmd, "--polar ", theta, " ", distance)
    xdotool(cmd)
}

mousemoveRel <- function(x, y, clearmodifiers=FALSE, sync=FALSE) {
    cmd <- "mousemove_relative "
    if (clearmodifiers) {
        cmd <- paste0(cmd, "--clearmodifiers ")
    }
    if (sync) {
        cmd <- paste0(cmd, "--sync ")
    }
    cmd <- paste0(cmd, x, " ", y)
    xdotool(cmd)
}

mousemoveRelPolar <- function(theta, distance, clearmodifiers=FALSE, sync=FALSE) {
    cmd <- "mousemove_relative "
    if (clearmodifiers) {
        cmd <- paste0(cmd, "--clearmodifiers ")
    }
    if (sync) {
        cmd <- paste0(cmd, "--sync ")
    }
    cmd <- paste0(cmd, "--polar ", theta, " ", distance)
    xdotool(cmd)
}

mouseAction <- function(action, button, rep, delay, clearmodifiers) {
    cmd <- action
    if (!is.null(rep)) {
        cmd <- paste0(cmd, "--repeat ", rep, " ")
    }
    if (!is.null(delay)) {
        cmd <- paste0(cmd, "--delay ", delay, " ")
    }
    if (clearmodifiers) {
        cmd <- paste0(cmd, "--clearmodifiers ")
    }
    cmd <- paste0(cmd, button)
    xdotool(cmd)
}

click <- function(button, rep=1, delay=NULL, clearmodifiers=FALSE) {
    mouseAction("click ", button, rep, delay, clearmodifiers)
}

mousedown <- function(button, clearmodifiers=FALSE) {
    mouseAction("mousedown ", button, NULL, NULL, clearmodifiers)
}

mouseup <- function(button, clearmodifiers=FALSE) {
    mouseAction("mouseup ", button, NULL, NULL, clearmodifiers)
}
