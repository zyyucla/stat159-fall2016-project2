.PHONY: all data tests eda ols ridge lasso pcr plsr regressions report slides session clean

all: eda regressions report

data:
  curl http://www-bcf.usc.edu/~gareth/ISL/Credit.csv > data/Credit.csv
  
tests:
  
ols:

ridge:

lasso:

pcr:

plsr:

regressions:

report:

slides:

session:
  bash session.sh

clean:
  rm -f report/report.rmd report/report.pdf
