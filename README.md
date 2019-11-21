# 2019-Statistical-Risk-Assessment
Statistical Risk Assessment for 2019 and 2020

Replication files for the 2019 edition of USHMM's statistical risk assessment. 

The first and biggest point to note is that you should use the data stored in the repo, "prepared_data_final_15Oct2018.RData". This is preferable to regenerating the data yourself, since doing so requires a host of anciliary files, pulling data from online sources, etc.  We nevertheless include an R file ("not_run_makedata_15Oct2018") that manages the data construction process, for reference and replicability. 

The key files are:

- "EWP_Data_Dictionary_Oct2018.pdf" is the data dictionary. 

- The main file of interest is likely "make2016and2017basedforecast". As advertized, this file takes the latest data and generates forecasts. From 2016, it predicts forward both a one-year window (2017) and a two-year window (2018). Likewise from 2017 it will produce a one-year window (2018) and a two-year window (2018-2019). These last forecasts are of primary interest. 

    - "sortedrisk_2016based_1and2yr"" and "sortedrisk_2017based_1and2yr" are outputs of the "make2016and2017baedforecast". 


- The file "modeltesting2018.R" performs various cross-validated or out-of-sample tests of accuracy.  

- "not_run_makedata_15Oct2018", as noted above, serves as documentation of data gathering and processing steps. 

- "prepared_data_final_15Oct2018.RData" then is the actual data to be used. 

- "interpretshifts_15Oct2018.Rmd" is a file that aids in producing interpretation tools.
