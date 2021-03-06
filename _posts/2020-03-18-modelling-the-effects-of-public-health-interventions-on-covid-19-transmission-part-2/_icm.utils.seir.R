get_prev.icm <- function(dat, at) {

  if (at == 1) {
    dat$epi <- list()
    dat$epi$s.num <- sum(dat$attr$active == 1 &
                         dat$attr$status == "s" &
                         dat$attr$group == 1)
    dat$epi$i.num <- sum(dat$attr$active == 1 &
                         dat$attr$status == "i" &
                         dat$attr$group == 1)
    if (dat$control$type == "SEIR") {
        dat$epi$e.num <- sum(dat$attr$active == 1 &
                             dat$attr$status == "e" &
                             dat$attr$group == 1)
    }        
    if (dat$control$type %in% c("SIR", "SEIR")) {
      dat$epi$r.num <- sum(dat$attr$active == 1 &
                           dat$attr$status == "r" &
                           dat$attr$group == 1)
    }
    if (dat$control$type == "SIR") {
      dat$epi$num <- dat$epi$s.num +
                     dat$epi$i.num +
                     dat$epi$r.num
    } else if (dat$control$type == "SEIR") {
      dat$epi$num <- dat$epi$s.num +
                     dat$epi$e.num +
                     dat$epi$i.num +
                     dat$epi$r.num
    } else {
      dat$epi$num <- dat$epi$s.num + dat$epi$i.num
    }         
    if (dat$param$groups == 2) {
      dat$epi$s.num.g2 <- sum(dat$attr$active == 1 &
                              dat$attr$status == "s" &
                              dat$attr$group == 2)
      if (dat$control$type == "SEIR") {
          dat$epi$e.num.g2 <- sum(dat$attr$active == 1 &
                                  dat$attr$status == "e" &
                                  dat$attr$group == 2)
      }
      dat$epi$i.num.g2 <- sum(dat$attr$active == 1 &
                              dat$attr$status == "i" &
                              dat$attr$group == 2)
      dat$epi$num.g2 <- dat$epi$s.num.g2 + dat$epi$i.num.g2
      if (dat$control$type %in% c("SIR", "SEIR")) {
        dat$epi$r.num.g2 <- sum(dat$attr$active == 1 &
                                dat$attr$status == "r" &
                                dat$attr$group == 2)
      }
      if (dat$control$type == "SIR") {
        dat$epi$num.g2 <- dat$epi$s.num.g2 +
                          dat$epi$i.num.g2 +
                          dat$epi$r.num.g2
      } else if (dat$control$type == "SEIR") {
        dat$epi$num.g2 <- dat$epi$s.num.g2 +
                          dat$epi$e.num.g2 +
                          dat$epi$i.num.g2 +
                          dat$epi$r.num.g2
      } else {
        dat$epi$num.g2 <- dat$epi$s.num.g2 + dat$epi$i.num.g2
      }         
    }
  } else {
    dat$epi$s.num[at] <- sum(dat$attr$active == 1 &
                             dat$attr$status == "s" &
                             dat$attr$group == 1)
    if (dat$control$type == "SEIR") {
        dat$epi$e.num[at] <- sum(dat$attr$active == 1 &
                                 dat$attr$status == "e" &
                                 dat$attr$group == 1)
    }
    dat$epi$i.num[at] <- sum(dat$attr$active == 1 &
                             dat$attr$status == "i" &
                             dat$attr$group == 1)
    if (dat$control$type %in% c("SIR", "SEIR")) {
      dat$epi$r.num[at] <- sum(dat$attr$active == 1 &
                               dat$attr$status == "r" &
                               dat$attr$group == 1)
    }
    if (dat$control$type == "SIR") {
        dat$epi$num[at] <- dat$epi$s.num[at] +
                             dat$epi$i.num[at] +
                             dat$epi$r.num[at]
    } else if (dat$control$type == "SEIR") {
        dat$epi$num[at] <- dat$epi$s.num[at] +
                             dat$epi$e.num[at] +
                             dat$epi$i.num[at] +
                             dat$epi$r.num[at]
    } else {
        dat$epi$num[at] <- dat$epi$s.num[at] + dat$epi$i.num[at]
    }
        
    if (dat$param$groups == 2) {
      dat$epi$s.num.g2[at] <- sum(dat$attr$active == 1 &
                                  dat$attr$status == "s" &
                                  dat$attr$group == 2)
      if (dat$control$type == "SEIR") {
        dat$epi$i.num.g2[at] <- sum(dat$attr$active == 1 &
                                    dat$attr$status == "e" &
                                    dat$attr$group == 2)
      }
      dat$epi$i.num.g2[at] <- sum(dat$attr$active == 1 &
                                  dat$attr$status == "i" &
                                  dat$attr$group == 2)
      if (dat$control$type %in% c("SIR", "SEIR")) {
        dat$epi$r.num.g2[at] <- sum(dat$attr$active == 1 &
                                    dat$attr$status == "r" &
                                    dat$attr$group == 2)
      }
      if (dat$control$type == "SIR") {
        dat$epi$num.g2[at] <- dat$epi$s.num.g2[at] +
                              dat$epi$i.num.g2[at] +
                              dat$epi$r.num.g2[at]
      } else if (dat$control$type == "SEIR") {
        dat$epi$num.g2[at] <- dat$epi$s.num.g2[at] +
                              dat$epi$e.num.g2[at] +
                              dat$epi$i.num.g2[at] +
                              dat$epi$r.num.g2[at]
      } else {
        dat$epi$num.g2[at] <- dat$epi$s.num.g2[at] +
                              dat$epi$i.num.g2[at]
      }
    }
  }
  return(dat)
}
