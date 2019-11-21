# takes in a data.table version of VDEM and a list of variables to keep and renames vand otherwise formats variables. Drops unused variables

format_vdem <- function(dat, keep = c("COWcode", "country_name", "year", used_vars)){
  dat <- subset(dat, select = keep) 
  dat$sftgcode <- cowtopitfit(cowcodedata = dat$COWcode, yeardata=dat$year)
  
  ### Some renaming to make things easier to remember:
  names(dat)[names(dat) == 'v2elrstrct'] <- 'candidaterestriction'
  names(dat)[names(dat) == 'v2psparban_ord'] <- 'partyban'
  names(dat)[names(dat) == 'v2psoppaut_ord'] <- 'barrierstoparties'
  names(dat)[names(dat) == 'v2jureform_ord'] <- 'judicialreform'
  names(dat)[names(dat) == 'v2clrelig_ord'] <- 'religiousfreedom'
  names(dat)[names(dat) == 'v2xcl_disc'] <- 'freediscussion'
  names(dat)[names(dat) == 'v2pepwrses'] <- 'ses_power_dist'
  
  # GDP, population, trade variables
  dat$gdppcgrowth = dat$e_migdpgro
  dat$popsize = dat$e_mipopula * 1000   #apparently now e_mipopula is in 1000s.
  dat$popsize.ln = log(dat$popsize)
  # the following is missing in 2017 entirely:
  dat$tradeshare = 10^6*(dat$e_cow_exports+dat$e_cow_imports)/(dat$e_migdppc*dat$popsize)
  
  # other variables
  dat$pol_killing_approved = as.numeric(dat$v2clkill_ord==0)
  dat$freemove_men4 = as.numeric(dat$v2cldmovem_ord==4)
  dat$freemove_women4 = as.numeric(dat$v2cldmovew_ord==4)
  dat$social_inequality = as.numeric(dat$v2clsocgrp_ord==0)
  dat$even_civilrights = as.numeric(dat$v2clrgunev_ord==2)
  dat$repress_civilsoc = as.numeric(dat$v2csreprss_ord==0)
  dat$social_power_dist = as.numeric(is.element(el=dat$v2pepwrsoc_ord, set=c(0,1,2)))
  dat$minorityrule = 0
  dat$minorityrule[dat$v2pepwrsoc_ord<=1]=1
  
  dat <- subset(dat, select = -grep("v2", colnames(dat)))
  dat
}