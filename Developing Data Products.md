Developing Data Products
========================================================
Coursera Course Project

Growth of Loblolly Pine Trees 
June 14, 2015

***
![text](http://www.garrispaving.com/loblolly_pine.jpg)  
<small>Image courtesy of pixgood.com</small>

Introduction
========================================================
The data for this project can be found in the R datasets package.

```r
library(datasets)
Loblolly
```
The described shiny app allows users to:

- Visually compare the growth of Loblolly pine trees from different seeds
- Visually compare tree growth every 5 years for 25 years
- View a table of average tree height for selected variables


Overview of Dataset
========================================================
Below is an subset of the Loblolly dataset showing the average height in feet of trees grown from 3 different seeds, measured at 5, 15, and 25 years.

```
  Seed height.5yrs height.15yrs height.25yrs
1  301       10.89        41.74        60.92
2  303       10.92        42.83        63.39
3  305       11.37        44.40        64.10
4  307        9.48        39.07        59.07
5  309       11.20        41.66        63.05
6  311        9.40        39.55        59.64
```

Data Visualization
========================================================
A stacked barplot comparing all included Loblolly seeds measured every five years for twenty five years is not easy to read.  There is a lot of data presented, and users may only be interested in looking at a few seeds or ages at a time.   
![plot of chunk unnamed-chunk-3](Developing Data Products-figure/unnamed-chunk-3-1.png) 
  
Loblolly Shiny App
===
The Shiny app available **[here](https://amoni13.shinyapps.io/ProjectApp)** will allows user to select only those seeds needed for direct comparison at the ages of interest.

For example, seeds 305 and 311 at 15years.
![plot of chunk unnamed-chunk-4](Developing Data Products-figure/unnamed-chunk-4-1.png) 
