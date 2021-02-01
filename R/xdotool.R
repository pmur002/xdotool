
xdotool <- function(command, intern=FALSE) {
    cmd <- paste0("xdotool ", command)
    system(cmd, intern=intern)
}

