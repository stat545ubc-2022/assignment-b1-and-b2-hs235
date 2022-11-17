#' @title: Summarize by Group Mean
#'
#' @description The function automates the calculation of arithmetic mean operating on and summarizing by the grouping chosen by the user
#' 
#' @details This is a generic function that can group by one or multiple levels passed by the user
#'          User can pass provide argument for grouping either by numerical index or column name because both ways are used in practice 
#'          Rows with N/A values are kept as it can still be valid grouping combinations. Thus N/A values are treated via omission in the calculation of mean
#' 
#' @param dataFrame dataframe_like_object input only accepts dataframe or tibbular data & hence the chosen name to indicate the inclusion of both
#' @param group_by vector should be non-empty, can either be numerical or string thus the chosen name is kept generic
#' 
#' @return tibble for the case where legal arguments are passed returning values of calculated mean for numeric columns not used in grouping
#' @return null for the case where invalid arguments are passed to function along with error message   

#options(dplyr.summarise.inform = FALSE) # Suppressing default message using global option

summarize_by_group_mean = function(dataFrame, group_by){
  if (! (is.vector(group_by) && length(group_by) > 0)){
    stop('Group by column parameter is invalid')
  }
  
  # if numeric col_ind passed check they don't have matching names in the tibble
  # then convert to col_ind to col_names of the tibble
  if (is.numeric(group_by) && sum(group_by %in% names(dataFrame))==0 ){
    group_by = names(dataFrame)[group_by]
    if (sum(is.na(group_by)) > 0 || identical(group_by, character(0)) ) { # Ensuring no column index is out of bounds
      stop('Column indices not valid')
    }
  } 
  
  else if (sum(group_by %in% names(dataFrame))==length(group_by)){   # if reached here then ensuring all input vector elements are legal column names
    invisible()
  }
  
  else {
    stop('Column name(s) not valid')
  }
  
  # now grouping the data, summarize by mean while omitting N/A values, and return
  dataFrame %>% 
    group_by_at(group_by) %>%
    summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE))) %>% 
    return()
}