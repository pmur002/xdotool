
## Each value of 'key' is a Keysym (e.g., 'a', 'ctrl+a', 'BackSpace')
## 'delay' is in milliseconds
## Can handle multiple values; they are collapsed using " "
keystroke <- function(key, delay=NULL, clearmodifiers=FALSE) {
    cmd <- "key "
    if (!is.null(delay)) {
        cmd <- paste0(cmd, "--delay ", delay, " ")
    }
    if (clearmodifiers) {
        cmd <- paste0(cmd, "--clearmodifiers ")
    }
    cmd <- paste(cmd, paste(key, collapse=" "))
    xdotool(cmd)
}

## Should just be single 'key'
keydown <- function(key, clearmodifiers=FALSE) {
    cmd <- "keydown "
    if (clearmodifiers) {
        cmd <- paste0(cmd, "--clearmodifiers ")
    }
    cmd <- paste(cmd, key)
    xdotool(cmd)
}

## Should just be single 'key'
keyup <- function(key) {
    cmd <- "keydown "
    cmd <- paste(cmd, key)
    xdotool(cmd)
}

## Can handle multiple values, in which case 'delay' is recycled
typestring <- function(string, delay=NULL, indentDelay=FALSE,
                       clearmodifiers=FALSE, sep="\n") {
    if (!is.null(delay)) {
        delay <- rep(pmin(delay, 1000), length.out=length(string))
    }
    ## if !indentDelay, just type white space at the start immediately
    if (!indentDelay) {
        ## Split strings into separate lines
        strings <- strsplit(string, "\n")
        ## Put new lines back
        if (grepl("\n$", string))
            strings <- lapply(strings, paste0, "\n")
        else
            strings[-length(strings)] <-
                lapply(strings[-length(strings)], paste0, "\n")            
        new <- mapply(
            function(s, d) {
                whiteStart <- grepl("^[[:blank:]]+", s)
                if (any(whiteStart)) {
                    whites <- gsub("^([[:blank:]]*).+", "\\1", s)
                    rest <- gsub("^[[:blank:]]+", "", s)
                    list(strings=as.character(rbind(whites, rest)),
                         delays=rep(c(1, d), length(s)))
                } else {
                    list(strings=s, delays=d)
                }
            },
            strings, delay, SIMPLIFY=FALSE)
        string <- unlist(lapply(new, function(x) x$strings))
        delay <- unlist(lapply(new, function(x) x$delays))
    }
    for (i in seq_along(string)) {
        cmd <- "type "
        if (!is.null(delay)) {
            cmd <- paste0(cmd, "--delay ", sprintf("%d", delay[i]), " ")
        }
        if (clearmodifiers) {
            cmd <- paste0(cmd, "--clearmodifiers ")
        }
        ## Hack: if the first character is '-', insert a space
        ## so xdotool does not interpret string as an option
        if (grepl("^-", string[i])) {
            str <- paste0(" ", string[i])
        } else {
            str <- string[i]
        }
        cmd <- paste0(cmd, "'", str, "'")
        xdotool(cmd)
    }
    invisible()
}

