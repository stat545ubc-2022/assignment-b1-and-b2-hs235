Assignment B-1: Making a function
================
Harsh Sharma
07/11/2022

## Function to Summarize By Group Mean

Initial loading of the required packages needed for the assignment.

``` r
# Load required libraries
# suppressPackageStartupMessages(library(devtools))     # Used for easier R function aiding with package development
suppressPackageStartupMessages(library(testthat))       # Used for testing function
suppressPackageStartupMessages(library(dplyr))          # Used for easier data manipulation
suppressPackageStartupMessages(library(tidyverse))      # Used for efficient data science workflow implementation
suppressPackageStartupMessages(library(palmerpenguins)) # Used for sample data to showcase examples
```

## Exercise 1 & 2: Make and Document Function

This section includes the creation, documentation, and fortification of
a non-trivial function. Documentation is carried out using ‘roxygen2’
tags.

``` r
#' @title: Summarize by Group Mean
#'
#' @description The function automates the calculation of arithmetic mean operating on and summarizing by the grouping chosen by the user
#' 
#' @details This is a generic function that can group by one or multiple levels passed by the user
#'          User can pass provide argument for grouping either by numerical index or column name becasue both ways are used in practise 
#'          Rows with N/A values are kept as it can still be valid grouping combinations. Thus N/A values are treated via omission in the calculation of mean
#' 
#' @param dataFrame dataframe_like_object input only accepts dataframe or tibbular data & hence the chosen name to indicate the inclusion of both
#' @param group_by vector either numerical or string thus the chosen name is kept generic
#' 
#' @return tibble for the case where legal arguments are passed a 1xn tibble is returned with values of mean for original column names
#' @return null for the case where invalid arguments are passed to function along with error message   

options(dplyr.summarise.inform = FALSE) # Suppressing default message using global option

summarize_by_group_mean = function(dataFrame, group_by){
    if (! (is.vector(group_by) && length(group_by) > 0)){
    stop('Group by column parameter is invalid')
    }
    
    #if numeric col_ind passed check they don't have matching names in the tibble
    # then convert to col_ind to col_names of the tibble
    if (is.numeric(group_by) && sum(group_by %in% names(dataFrame))==0 ){
      group_by = names(dataFrame)[group_by]
          if (sum(is.na(group_by)) > 0 || identical(group_by, character(0)) ) { #Ensure no column index is out of bounds
          stop('Column indices not valid')
          }
    } 
    else if (sum(group_by %in% names(dataFrame))==length(group_by)){ #if we are here then ensure all input vector elements are legal column names
    invisible()
    }
    else {
    stop('Column name(s) not valid')
    }
  
  #now group the data, summarize by mean and drop na, and return
  dataFrame %>% group_by_at(group_by) %>% summarise(across(where(is.numeric), ~ mean(.x, na.rm = TRUE))) %>% return
}
```

## Exercise 3: Function Examples

## Exercise 4: Function Testing
