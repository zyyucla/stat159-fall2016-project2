.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean

all: eda regressions report

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

plsr:

regressions:
	make ols
	make ridge
	make lasso

report:

slides:

session:
	bash session.sh

clean:
	rm -f report/report.rmd report/report.pdf
