.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean

all: eda regressions report

rep = report/sections

data:
	curl http://www-bcf.usc.edu/~gareth/ISL/Credit.csv > data/Credit.csv
  
tests:
  
ols:
	Rscript code/scripts/models/OLS-creation.R

ridge:
	Rscript code/scripts/models/ridge-creation.R
	Rscript code/scripts/models/ridge-selection.R

lasso:
	Rscript code/scripts/models/lasso-creation.R
	Rscript code/scripts/models/lasso-selection.R

pcr:
	Rscript code/scripts/models/pcr-creation.R
	Rscript code/scripts/models/pcr-selection.R

plsr:
	Rscript code/scripts/models/pls-creation.R
	Rscript code/scripts/models/pls-selection.R


regressions:
	make ols
	make ridge
	make lasso
	make pcr
	make plsr

report:
	cat $(rep)/00-abstract.Rmd $(rep)/01-introduction.Rmd $(rep)/02-data.Rmd $(rep)/03-methods.Rmd $(rep)/04-analysis.Rmd $(rep)/05-results.Rmd $(rep)/06-conclusions.Rmd >> report/report.Rmd
	cd report
	Rscript -e "library(rmarkdown); render('report.Rmd')"

slides:
	Rscript -e "library(rmarkdown); render('slides.Rmd')"
	
session:
	bash session.sh

clean:
	rm -f report/report.Rmd report/report.pdf
