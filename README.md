
<!-- README.md is generated from README.Rmd. Please edit that file -->

# GroupMeanSummary

<!-- badges: start -->

[![Lifecycle:
stable](https://img.shields.io/badge/lifecycle-stable-brightgreen.svg)](https://www.tidyverse.org/lifecycle/#stable)
<!-- credits: taken from https://github.com/vincenzocoia/powers/blob/master/README.md -->
<!-- badges: end -->

This `R` package provides a **convenient function to calculate the
arithmetic mean**. Further, the user can choose to group the data at any
single or multiple levels to calculate the mean over those groupings.
Moreover, for convenience, the user can select data grouping via column
index(es) or column name(s).

## Installation

You can install the development version of GroupMeanSummary from
[GitHub](https://github.com/) with:

``` r
# install.packages("devtools")
devtools::install_github("stat545ubc-2022/assignment-b1-and-b2-hs235", ref = "1.0.0")
```

## Example

An example to demonstrate usage:

``` r
suppressPackageStartupMessages(library(GroupMeanSummary))
suppressPackageStartupMessages(library(tidyverse))

## Creating sample data
(df <- data.frame(Name = c("Julia", "Harsh", "Nicole", "Julia", "Nicole"),
                 TransactionCost = c(100, 50, 80, 100, 40),
                 ItemsPurchased = c(4,1,4,6,2)
                 ))
#>     Name TransactionCost ItemsPurchased
#> 1  Julia             100              4
#> 2  Harsh              50              1
#> 3 Nicole              80              4
#> 4  Julia             100              6
#> 5 Nicole              40              2

## Summarizing the mean of transaction cost and items purchased per person
summarize_by_group_mean(df, "Name")
#> # A tibble: 3 × 3
#>   Name   TransactionCost ItemsPurchased
#>   <chr>            <dbl>          <dbl>
#> 1 Harsh               50              1
#> 2 Julia              100              5
#> 3 Nicole              60              3
```

## Contributers

[@Harsh](https://github.com/hs235)
