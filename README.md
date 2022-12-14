
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
(sampleData <- data.frame(Name = c("Kelly", "Harsh", "Brad", "Kelly", "Brad"),
                 TransactionCity = c("Burnaby", "Vancouver", "Richmond", "Vancouver", "Burnaby"),
                 TransactionCost = c(100, 50, 80, 100, 40),
                 ItemsPurchased = c(4,1,4,6,2)
                 ))
#>    Name TransactionCity TransactionCost ItemsPurchased
#> 1 Kelly         Burnaby             100              4
#> 2 Harsh       Vancouver              50              1
#> 3  Brad        Richmond              80              4
#> 4 Kelly       Vancouver             100              6
#> 5  Brad         Burnaby              40              2

## Summary of arithmetic mean on sample data by person
summarize_by_group_mean(sampleData, "Name")
#> # A tibble: 3 × 3
#>   Name  TransactionCost ItemsPurchased
#>   <chr>           <dbl>          <dbl>
#> 1 Brad               60              3
#> 2 Harsh              50              1
#> 3 Kelly             100              5

## Summary of arithmetic mean on sample data by city and person
summarize_by_group_mean(sampleData, c(2,1))
#> # A tibble: 5 × 4
#> # Groups:   TransactionCity [3]
#>   TransactionCity Name  TransactionCost ItemsPurchased
#>   <chr>           <chr>           <dbl>          <dbl>
#> 1 Burnaby         Brad               40              2
#> 2 Burnaby         Kelly             100              4
#> 3 Richmond        Brad               80              4
#> 4 Vancouver       Harsh              50              1
#> 5 Vancouver       Kelly             100              6
```

## Contributers

[@Harsh](https://github.com/hs235)
