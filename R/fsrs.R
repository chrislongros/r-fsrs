#' @useDynLib fsrsr, .registration = TRUE
NULL

#' Get default FSRS parameters
#' @return Numeric vector of 19 parameters
#' @export
#' @examples
#' fsrs_default_parameters()
fsrs_default_parameters <- function() {
  .Call("wrap__fsrs_default_parameters")
}

#' Calculate next review interval
#' @param stability Current stability value
#' @param desired_retention Target retention (default 0.9)
#' @return Interval in days
#' @export
#' @examples
#' fsrs_next_interval(10.0, 0.9)
fsrs_next_interval <- function(stability, desired_retention = 0.9) {
  .Call("wrap__fsrs_next_interval", stability, desired_retention)
}

#' Get initial memory state for new card
#' @param rating Rating: 1=Again, 2=Hard, 3=Good, 4=Easy
#' @return List with stability and difficulty
#' @export
#' @examples
#' fsrs_initial_state(3)  # Good rating
fsrs_initial_state <- function(rating) {
  .Call("wrap__fsrs_initial_state", as.integer(rating))
}

#' Calculate next memory state after review
#' @param stability Current stability
#' @param difficulty Current difficulty
#' @param elapsed_days Days since last review
#' @param rating Rating: 1=Again, 2=Hard, 3=Good, 4=Easy
#' @return List with stability, difficulty, retrievability
#' @export
#' @examples
#' fsrs_next_state(10.0, 5.0, 3.0, 3)
fsrs_next_state <- function(stability, difficulty, elapsed_days, rating) {
  .Call("wrap__fsrs_next_state", stability, difficulty, elapsed_days, as.integer(rating))
}

#' Calculate probability of recall
#' @param stability Card stability
#' @param elapsed_days Days since last review
#' @return Retrievability between 0 and 1
#' @export
#' @examples
#' fsrs_retrievability(10.0, 5.0)
fsrs_retrievability <- function(stability, elapsed_days) {
  .Call("wrap__fsrs_retrievability", stability, elapsed_days)
}
