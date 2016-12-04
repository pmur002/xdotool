
xdotool <- function(command) {
    cmd <- paste0("xdotool ", command)
    system(cmd)
}
