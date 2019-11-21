# 2019-Statistical-Risk-Assessment
Statistical Risk Assessment for 2019 and 2020

Replication files for the 2019 edition of USHMM's statistical risk assessment. 

The first and biggest point to note is that you should use the data stored in the repo, "prepared2018predictors_9_19_19.RData" (also stored as "prepared2018predictors.csv"). This is preferable to regenerating the data yourself, since doing so requires a host of anciliary files, pulling data from online sources, etc.  We nevertheless include a folder containing the R files used to make the data (Make Data), for reference and replicability. Within this folder:

- "makedata" recreates the data used for the most recent year's analysis (through 2017), making the code more generalizable for future years. The result is "prepared2017predictors_8_22_19.RData".

- "Adding in new data" appends data for each country in 2018 to the original data. The result is "prepared2018predictors_9_19_19.RData", also stored as a csv file under the name "prepared2018predictors". 

The key files are:

- "Data dictionary 2018_19 (1)" is the data dictionary. 

- The main file of interest is likely "run model". This file takes the latest data and generates forecasts. It allows you to input a vector of base years, from which you would like to generate one and two-year forecasts. The most relevant forecasts have been included in the results folder, generated from base year 2018, predicting outcomes in the next year (2019) and in the next two years (2019 and 2020). Note that if you choose to run the model for base years earlier than 2016, there is some missingness in the data that will prevent you from getting predicted probabilities for all 162 of the countries. 

- "base2018-run-2019-09-19" and "base2018-coeffs-run-2019-09-19" are the outputs of the "run model" file. The former file shows the predicted probabilities for each country, and the latter shows the weights for each of the predictors selected.

