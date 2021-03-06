# Stat159 Project 2-Predictive Modeling Process 

##Author
 Bret Hart, Yuyu Zhang
 
## Steps

1. git clone the repository
2. `cd` into directory
3. run `make all` to execute all scripts and get all output

## File Structure
```
project
│   .gitignore
|   LICENSE
│   README.md
│   Makefile
│   session-info.txt        # produced by session-info-script.R
|   session.sh              # shell script file for session information
│
└───data
|   └───models
|   |     
│   │   README.md
│   │   Credit.csv
│   │   Scaled_credit.csv
│   |   correlation-matrix.RData
│   |   eda-output-qualitative.txt      
│   |   eda-output-quantative.txt
│   |   train-test-data.RData 
│
└───code
│   │   README.md
│   │   
│   └───scripts
    |   └───models
│   │   data-processing.R
│   │   eda-scripts-qualitative.R
│   │   eda-scripts-quantative.R
│   │   session-info.R
│   │   train-test-creation.R      
│   │
│   └───functions
│   │   │   regression-functions.R
│   │   |   train-test-function.R
│
└───images
    │   └───models
│   │   README.md
│   │   barchart-frequencey-ethnicity.png
│   │   boxplot-age.png
│   │   boxplot-rating.png
│   │   conditional-boxplot-ethnicity.png
│   │   conditional-boxplot-student.png
│   │   histogram-age.png
│   │   histogram-education.png
│   │   histogram-income.png
│   │   histogram-balance.png
│   │   histogram-income.png
│   │   histogram-limit.png
│   │   scatterplot-matrix.png
│
└───report
    │   └───sections
    │   README.md
    │   report.Rmd
    │   report.pdf



```
_Code_: This directory contains all the R functions and R scripts to produce EDA and model output  
_Data_: This directory contains main data "Credit.csv" and all other associated data  
_Images_: This directory contains all data visualization files  
_Report_: This directory contains various file version of the reports and sections  

The Makefile in this directory contains a number of phony macros which run different pieces of the data acquisition, cleaning, model fitting, analysis, and report. To run certain macros, simply type "make macrotitle" into the terminal. Here is a list of the phony macro titles:

• all: runs the three main aspects of our project: Exploratory data analysis, Model creation, and Report compiling/rendering  
• data: downloads the file Credit.csv to the folder data/    
• eda: performs the exploratory data analysis  
• ols: OLS regression  
• ridge: Rdige Regression  
• lasso: Lasso Regression  
• pcr: Principal Components Regression  
• plsr: Partial Least Squares Regression  
• regressions: all five regressions    
• report: concatenates the .Rmd report from the individual sections, and then render the report.pdf  
• slides: generates the actual slides.html from our slides.Rmd  
• session: generates session-info.txt  
• clean: deletes the generated report files, both .Rmd and .pdf  

![Creative Common License](https://i.creativecommons.org/l/by/4.0/88x31.png)


All the media content(narrative and images) is licensed under a [Creative Commons Attribution-ShareAlike 4.0 International License](https://creativecommons.org/licenses/by-sa/4.0/).

All source code (i.e. code in R script files) is licensed under GNU General Public License, version 3. See the `LICENSE` file
for more information
