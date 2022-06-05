---
author: robjhyndman
comments: true
date: 2022-06-05
title: "The cricketdata package"
slug: cricketdata
output:
  html_document:
    keep_md: true
mathjax: true
categories:
  - R
  - data
---



## Four functions

[The cricketdata package](http://pkg.robjhyndman.com/cricketdata/) has been around for a few years [on github](https://github.com/robjhyndman/cricketdata), and it has been on [CRAN](https://cloud.r-project.org/package=cricketdata) since February 2022. There are only four functions:

 * `fetch_cricinfo()`: Fetch team data on international cricket matches provided by [ESPNCricinfo](https://www.espncricinfo.com/).
 * `fetch_player_data()`: Fetch individual player data on international cricket matches provided by [ESPNCricinfo](https://www.espncricinfo.com/).
 * `find_player_id()`: Search for the player ID on [ESPNCricinfo](https://www.espncricinfo.com/).
 * `fetch_cricsheet()`: Fetch ball-by-ball, match and player data from [Cricsheet](https://cricsheet.org).

[Jacquie Tran](https://www.jacquietran.com) wrote the first version of the `fetch_cricsheet()` function, and [the vignette](http://pkg.robjhyndman.com/cricketdata/articles/cricsheet.html) which demonstrates it.

Here are some examples demonstrating the Cricinfo functions.


```r
library(cricketdata)
library(tidyverse)
```

## Women's T20 bowling data

The `fetch_cricinfo()` function downloads data for international T20, ODI or Test matches, for men or women, and for batting, bowling or fielding. By default, it downloads career-level statistics for individual players. Here is an example for women T20 bowlers.


```r
# Fetch all Women's T20 data
wt20 <- fetch_cricinfo("T20", "Women", "Bowling")
```


```r
wt20 %>%
  select(Player, Country, Matches, Runs, Wickets, Economy, StrikeRate)
#> # A tibble: 1,697 × 7
#>    Player       Country      Matches  Runs Wickets Economy StrikeRate
#>    <chr>        <chr>          <int> <int>   <int>   <dbl>      <dbl>
#>  1 A Mohammed   West Indies      117  2206     125    5.58       19.0
#>  2 EA Perry     Australia        126  2237     115    5.87       19.9
#>  3 S Ismail     South Africa      99  2015     111    5.79       18.8
#>  4 Nida Dar     Pakistan         111  1909     105    5.34       20.4
#>  5 A Shrubsole  England           79  1587     102    5.96       15.7
#>  6 KH Brunt     England           96  1888      98    5.54       20.9
#>  7 SFM Devine   New Zealand      102  1733      98    6.35       16.7
#>  8 Poonam Yadav India             72  1495      98    5.75       15.9
#>  9 SR Taylor    West Indies      111  1639      98    5.66       17.7
#> 10 M Schutt     Australia         75  1510      96    6.08       15.5
#> # … with 1,687 more rows
```

We can plot a bowler's strike rate (balls per wicket) vs economy rate (runs per wicket). Each observation represents one player, who has taken at least 50 international wickets.


```r
wt20 %>%
  filter(Wickets >= 50) %>%
  ggplot(aes(y = StrikeRate, x = Average)) +
  geom_point(alpha = 0.3, col = "blue") +
  ggtitle("Women International T20 Bowlers") +
  ylab("Balls per wicket") + xlab("Runs per wicket")
```

![](https://robjhyndman.com/hyndsight/2022-03-cricinfo_files/figure-html/woment20graph-1.png)<!-- -->

The extraordinary result on the bottom left is due to the Thai all-rounder, Nattaya Boochatham, who has taken 59 wickets, with a strike rate of 13.475, an average of 8.78, and an economy rate of 3.909.

## Australian men's ODI data by innings

The next example shows Australian men's ODI batting results by innings.


```r
# Fetch all Australian Men's ODI data by innings
menODI <- fetch_cricinfo("ODI", "Men", "Batting", type = "innings", country = "Australia")
```


```r
menODI %>%
  select(Date, Player, Runs, StrikeRate, NotOut)
#> # A tibble: 10,587 × 5
#>    Date       Player        Runs StrikeRate NotOut
#>    <date>     <chr>        <int>      <dbl> <lgl>
#>  1 2011-04-11 SR Watson      185       193. TRUE
#>  2 2007-02-20 ML Hayden      181       109. TRUE
#>  3 2017-01-26 DA Warner      179       140. FALSE
#>  4 2015-03-04 DA Warner      178       134. FALSE
#>  5 2001-02-09 ME Waugh       173       117. FALSE
#>  6 2016-10-12 DA Warner      173       127. FALSE
#>  7 2004-01-16 AC Gilchrist   172       137. FALSE
#>  8 2019-06-20 DA Warner      166       113. FALSE
#>  9 2006-03-12 RT Ponting     164       156. FALSE
#> 10 2016-12-04 SPD Smith      164       104. FALSE
#> # … with 10,577 more rows
```




```r
menODI %>%
  ggplot(aes(y = Runs, x = Date)) +
  geom_point(alpha = 0.2, col = "#D55E00") +
  geom_smooth() +
  ggtitle("Australia Men ODI: Runs per Innings")
```

![](https://robjhyndman.com/hyndsight/2022-03-cricinfo_files/figure-html/menodigraph-1.png)<!-- -->

The average number of runs per innings slowly increased until about 2000, after which it has remained largely constant at about 35.2. This is a little higher than the smooth line shown on the plot, which has not taken account of not-out results.

## Indian test fielding data

Next, we demonstrate some of the fielding data available, using Test match fielding from Indian men's players.


```r
Indfielding <- fetch_cricinfo("Test", "Men", "Fielding", country = "India")
```


```r
Indfielding
#> # A tibble: 303 × 11
#>    Player       Start   End Matches Innings Dismissals Caught CaughtFielder
#>    <chr>        <int> <int>   <int>   <int>      <int>  <int>         <int>
#>  1 MS Dhoni      2005  2014      90     166        294    256             0
#>  2 R Dravid      1996  2012     163     299        209    209           209
#>  3 SMH Kirmani   1976  1986      88     151        198    160             0
#>  4 VVS Laxman    1996  2012     134     248        135    135           135
#>  5 KS More       1986  1993      49      90        130    110             0
#>  6 RR Pant       2018  2022      30      59        118    107             0
#>  7 SR Tendulkar  1989  2013     200     366        115    115           115
#>  8 SM Gavaskar   1971  1987     125     216        108    108           108
#>  9 NR Mongia     1994  2001      44      77        107     99             0
#> 10 M Azharuddin  1984  2000      99     177        105    105           105
#> # … with 293 more rows, and 3 more variables: CaughtBehind <int>,
#> #   Stumped <int>, MaxDismissalsInnings <dbl>
```

We can plot the number of dismissals by number of matches for all male test players. Because wicket keepers typically have a lot more dismissals than other players, they are shown in a different colour.


```r
Indfielding %>%
  mutate(wktkeeper = (CaughtBehind > 0) | (Stumped > 0)) %>%
  ggplot(aes(x = Matches, y = Dismissals, col = wktkeeper)) +
  geom_point() +
  ggtitle("Indian Men Test Fielding")
```

![](https://robjhyndman.com/hyndsight/2022-03-cricinfo_files/figure-html/indiafieldinggraph-1.png)<!-- -->

The high number of dismissals, close to 300, is of course due to MS Dhoni. Another interesting one here is the non-wicketkeeper with over 200 dismissals, which is Rahul Dravid who took 209 catches during his career.

## Meg Lanning's ODI batting

Finally, let's look at individual player data. The `fetch_player_data()` requires the Cricinfo player ID, which you can either look up on their website, or use the `find_player_id()` function. We will look at the ODI results of Australia's captain, Meg Lanning.


```r
meg_lanning_id <- find_player_id("Meg Lanning")$ID
MegLanning <- fetch_player_data(meg_lanning_id, "ODI") %>%
  mutate(NotOut = (Dismissal == "not out"))
```


```r
MegLanning
#> # A tibble: 100 × 15
#>    Date       Innings Opposition Ground  Runs  Mins    BF   X4s   X6s    SR
#>    <date>       <int> <chr>      <chr>  <dbl> <dbl> <int> <int> <int> <dbl>
#>  1 2011-01-05       1 ENG Women  Perth     20    60    38     2     0  52.6
#>  2 2011-01-07       2 ENG Women  Perth    104   148   118     8     1  88.1
#>  3 2011-06-14       2 NZ Women   Brisb…    11    15    14     2     0  78.6
#>  4 2011-06-16       1 NZ Women   Brisb…     5     8     8     1     0  62.5
#>  5 2011-06-30       1 NZ Women   Chest…    17    24    20     3     0  85
#>  6 2011-07-02       2 India Wom… Chest…    23    40    32     3     0  71.9
#>  7 2011-07-05       2 ENG Women  Lord's    43    40    33     9     0 130.
#>  8 2011-07-07       2 ENG Women  Worms…     0     2     3     0     0   0
#>  9 2012-03-12       1 India Wom… Ahmed…    45    61    44     7     0 102.
#> 10 2012-03-14       1 India Wom… Wankh…   128   125   104    19     1 123.
#> # … with 90 more rows, and 5 more variables: Pos <int>, Dismissal <chr>,
#> #   Inns <int>, Start_Date <chr>, NotOut <lgl>
```

We can plot her runs per innings on the vertical axis over time on the horizontal axis.


```r
# Compute batting average
MLave <- MegLanning %>%
  filter(!is.na(Runs)) %>%
  summarise(Average = sum(Runs) / (n() - sum(NotOut))) %>%
  pull(Average)
names(MLave) <- paste("Average =", round(MLave, 2))
# Plot ODI scores
ggplot(MegLanning) +
  geom_hline(aes(yintercept = MLave), col="gray") +
  geom_point(aes(x = Date, y = Runs, col = NotOut)) +
  ggtitle("Meg Lanning ODI Scores") +
  scale_y_continuous(sec.axis = sec_axis(~., breaks = MLave))
```

![](https://robjhyndman.com/hyndsight/2022-03-cricinfo_files/figure-html/meglanninggraph-1.png)<!-- -->

She has shown amazing consistency over her career, with centuries scored in every year of her career except for 2021, when her highest score from 6 matches was 53.
