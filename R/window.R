
windowWithFocus <- function() {
    xdotool("getwindowfocus -f", intern=TRUE)
}
