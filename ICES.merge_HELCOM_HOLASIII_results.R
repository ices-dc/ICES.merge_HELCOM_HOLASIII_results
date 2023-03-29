library(data.table)
#install.packages("readxl")
library(readxl)
#install.packages("writexl")
library(writexl)

####################################
###Merging biota files###

#Bio CD
bio_CD4 <- read_excel("HELCOM_raw_input/Final results Cd/Cd wbiota final results.xlsx", sheet = "biota Cd scale 4")
bio_CD4$au_level <- 4
bio_CD3 <- read_excel("HELCOM_raw_input/Final results Cd/Cd wbiota final results.xlsx", sheet = "scale 3")
bio_CD3$au_level <- 3

#Bio HCBDD
bio_HCBDD4 <- read_excel("HELCOM_raw_input/Final results HBCD/HBCDD in biota.xlsx", sheet = "biota HBCD scale 4")
bio_HCBDD4$au_level <- 4
bio_HCBDD3 <- read_excel("HELCOM_raw_input/Final results HBCD/HBCDD in biota.xlsx", sheet = "scale 3")
bio_HCBDD3$au_level <- 3

#Bio HG
bio_HG4 <- read_excel("HELCOM_raw_input/Final results HG/Hg biota final results.xlsx", sheet = "biota Hg scale 4")
bio_HG4$au_level <- 4
bio_HG3 <- read_excel("HELCOM_raw_input/Final results HG/Hg biota final results.xlsx", sheet = "scale 3")
bio_HG3$au_level <- 3

#PAH
#Bio FLU
bio_FLU4 <- read_excel("HELCOM_raw_input/Final results PAH/PAHs biota final results_columnalign_hmj.xlsx", sheet = "FLU scale 4")
bio_FLU4$au_level <- 4
#rename Conf column name to fit the other excel tables
colnames(bio_FLU4)[colnames(bio_FLU4) == "Conf"] = "...32"
bio_FLU3 <- read_excel("HELCOM_raw_input/Final results PAH/PAHs biota final results_columnalign_hmj.xlsx", sheet = "FLU scale 3")
bio_FLU3$au_level <- 3

#PAH
#Bio BAP
bio_BAP4 <- read_excel("HELCOM_raw_input/Final results PAH/PAHs biota final results_columnalign_hmj.xlsx", sheet = "BAP scale 4")
bio_BAP4$au_level <- 4
#rename Conf column name to fit the other excel tables
colnames(bio_BAP4)[colnames(bio_BAP4) == "Conf"] = "...32"
bio_BAP3 <- read_excel("HELCOM_raw_input/Final results PAH/PAHs biota final results_columnalign_hmj.xlsx", sheet = "BAP scale 3")
bio_BAP3$au_level <- 3

#PAH
#Bio PYR1OH
bio_PYR1OH4 <- read_excel("HELCOM_raw_input/Final results PAH/PAH metabolites biota final results.xlsx", sheet = "biota PAH metabolites - scale 4")
bio_PYR1OH4$au_level <- 4
bio_PYR1OH3 <- read_excel("HELCOM_raw_input/Final results PAH/PAH metabolites biota final results.xlsx", sheet = "Scale 3")
bio_PYR1OH3$au_level <- 3

#Bio PB
bio_PB4 <- read_excel("HELCOM_raw_input/Final results Pb/Lead biota final results.xlsx", sheet = "biota Pb scale 4")
bio_PB4$au_level <- 4
bio_PB3 <- read_excel("HELCOM_raw_input/Final results Pb/Lead biota final results.xlsx", sheet = "scale 3")
bio_PB3$au_level <- 3

#Bio PBDE
bio_PBDE4 <- read_excel("HELCOM_raw_input/Final results PBDE/PBDE biota final results.xlsx", sheet = "biota PBDEs scale 4")
bio_PBDE4$au_level <- 4
bio_PBDE3 <- read_excel("HELCOM_raw_input/Final results PBDE/PBDE biota final results.xlsx", sheet = "scale 3")
bio_PBDE3$au_level <- 3

#Dioxin
#Bio TEQDFP
bio_TEQDFP4 <- read_excel("HELCOM_raw_input/Final results PCB/Dioxins biota final resulsts.xlsx", sheet = "biota Dioxins scale 4")
bio_TEQDFP4$au_level <- 4
bio_TEQDFP3 <- read_excel("HELCOM_raw_input/Final results PCB/Dioxins biota final resulsts.xlsx", sheet = "scale 3")
bio_TEQDFP3$au_level <- 3

#PCB
#Bio SCB6
bio_SCB64 <- read_excel("HELCOM_raw_input/Final results PCB/PCBs biota final resulsts.xlsx", sheet = "biota PCBs scale 4")
bio_SCB64$au_level <- 4
bio_SCB63 <- read_excel("HELCOM_raw_input/Final results PCB/PCBs biota final resulsts.xlsx", sheet = "scale 3")
bio_SCB63$au_level <- 3

#Bio PFOS
bio_PFOS4 <- read_excel("HELCOM_raw_input/Final results PFOS/PFOS biota final results.xlsx", sheet = "biota PFOS scale 4")
bio_PFOS4$au_level <- 4
bio_PFOS3 <- read_excel("HELCOM_raw_input/Final results PFOS/PFOS biota final results.xlsx", sheet = "scale 3")
bio_PFOS3$au_level <- 3

#TBT-Imposex
#Bio VDS
bio_VDS4 <- read_excel("HELCOM_raw_input/Final results TBT/biota imposex Final results.xlsx", sheet = "biota Imposex scale 4")
bio_VDS4$au_level <- 4
bio_VDS3 <- read_excel("HELCOM_raw_input/Final results TBT/biota imposex Final results.xlsx", sheet = "scale 3")
bio_VDS3$au_level <- 3

#Merge depth profile tables
bio_All <- rbindlist(list(bio_BAP3,bio_BAP4,bio_CD3,bio_CD4,bio_FLU3,bio_FLU4,bio_HCBDD3,bio_HCBDD4,
                          bio_HG3,bio_HG4,bio_PB3,bio_PB4,bio_PBDE3, bio_PBDE4,bio_PFOS3,bio_PFOS4,
                          bio_PYR1OH3,bio_PYR1OH4,bio_SCB63,bio_SCB64,bio_TEQDFP3,bio_TEQDFP4,bio_VDS3,bio_VDS4), use.names = TRUE, fill=TRUE)
#Rename ...32 TO Conf
colnames(bio_All)[colnames(bio_All) == "...32"] = "Conf"

#Add id
#id <- seq_len(nrow(bio_All))
#bio_All <- cbind(id, bio_All)

#Save output xlxs
write_xlsx(bio_All, "oUTPUT/Bioresults.xlsx",
           col_names = TRUE)

#####################################
###Merging sediment files###

#Sed CD
sed_CD4 <- read_excel("HELCOM_raw_input/Final results Cd/Cd sediment final results.xlsx", sheet = "sediment Cd scale 4")
sed_CD4$au_level <- 4
sed_CD3 <- read_excel("HELCOM_raw_input/Final results Cd/Cd sediment final results.xlsx", sheet = "scale 3")
sed_CD3$au_level <- 3

#Sed CU
sed_CU4 <- read_excel("HELCOM_raw_input/Final results Cu/Copper final results_columnalign_hmj.xlsx", sheet = "sediment Metals AU level 4")
sed_CU4$au_level <- 4
sed_CU3 <- read_excel("HELCOM_raw_input/Final results Cu/Copper final results_columnalign_hmj.xlsx", sheet = "AU level 3")
sed_CU3$au_level <- 3

#Sed HBCDD
sed_HBCDD4 <- read_excel("HELCOM_raw_input/Final results HBCD/HBCDD in sediment.xlsx", sheet = "sediment HBCD scale 4")
sed_HBCDD4$au_level <- 4
sed_HBCDD3 <- read_excel("HELCOM_raw_input/Final results HBCD/HBCDD in sediment.xlsx", sheet = "scale 3")
sed_HBCDD3$au_level <- 3

#PAH
#Sed ANT
sed_ANT4 <- read_excel("HELCOM_raw_input/Final results PAH/PAHs sediments final results.xlsx", sheet = "ANT scale 4")
sed_ANT4$au_level <- 4
sed_ANT3 <- read_excel("HELCOM_raw_input/Final results PAH/PAHs sediments final results.xlsx", sheet = "ANT scale 3")
sed_ANT3$au_level <- 3

#PAH
#Sed FLU
sed_FLU4 <- read_excel("HELCOM_raw_input/Final results PAH/PAHs sediments final results.xlsx", sheet = "FLU scale 4")
sed_FLU4$au_level <- 4
sed_FLU3 <- read_excel("HELCOM_raw_input/Final results PAH/PAHs sediments final results.xlsx", sheet = "FLU scale 3")
sed_FLU3$au_level <- 3

#Sed PB
sed_PB4 <- read_excel("HELCOM_raw_input/Final results Pb/Lead sediment final results.xlsx", sheet = "sediment Pb scale 4")
sed_PB4$au_level <- 4
sed_PB3 <- read_excel("HELCOM_raw_input/Final results Pb/Lead sediment final results.xlsx", sheet = "scale 3")
sed_PB3$au_level <- 3

#Sed PBDE
sed_PBDE4 <- read_excel("HELCOM_raw_input/Final results PBDE/PBDE sediment final results.xlsx", sheet = "sediment PBDEs scale 4")
sed_PBDE4$au_level <- 4
sed_PBDE3 <- read_excel("HELCOM_raw_input/Final results PBDE/PBDE sediment final results.xlsx", sheet = "scale 3")
sed_PBDE3$au_level <- 3

#Sed TBSN
sed_TBSN4 <- read_excel("HELCOM_raw_input/Final results TBT/sediment TBSN+ Final results.xlsx", sheet = "sediment TBSN+")
sed_TBSN4$au_level <- 4
sed_TBSN3 <- read_excel("HELCOM_raw_input/Final results TBT/sediment TBSN+ Final results.xlsx", sheet = "scale 3")
sed_TBSN3$au_level <- 3


#Merge depth profile tables
sed_All <- rbindlist(list(sed_ANT3,sed_ANT4,sed_CD3,sed_CD4,sed_CU3,sed_CU4,sed_FLU3,sed_FLU4, sed_HBCDD3,sed_HBCDD4,
                          sed_PB3,sed_PB4,sed_PBDE3,sed_PBDE4,sed_TBSN3,sed_TBSN4), use.names = TRUE, fill=TRUE)
#Rename ...32 TO Conf
colnames(sed_All)[colnames(sed_All) == "...32"] = "Conf"
#Add id
#id <- seq_len(nrow(bio_All))
#bio_All <- cbind(id, bio_All)

#Save output xlxs
write_xlsx(sed_All, "oUTPUT/Sedresults.xlsx",
           col_names = TRUE)

#####################################
###Merging water files###

#Wat CD
wat_CD4 <- read_excel("HELCOM_raw_input/Final results Cd/Cd water final results.xlsx", sheet = "water Cd scale 4")
wat_CD4$au_level <- 4
wat_CD3 <- read_excel("HELCOM_raw_input/Final results Cd/Cd water final results.xlsx", sheet = "scale 3")
wat_CD3$au_level <- 3

#Wat PB
wat_PB4 <- read_excel("HELCOM_raw_input/Final results Pb/Lead water final results.xlsx", sheet = "water Pb scale 4")
wat_PB4$au_level <- 4
wat_PB3 <- read_excel("HELCOM_raw_input/Final results Pb/Lead water final results.xlsx", sheet = "scale 3")
wat_PB3$au_level <- 3

#Sed PFOS
wat_PFOS4 <- read_excel("HELCOM_raw_input/Final results PFOS/PFOS water final results.xlsx", sheet = "water PFOS scale 4")
wat_PFOS4$au_level <- 4
wat_PFOS3 <- read_excel("HELCOM_raw_input/Final results PFOS/PFOS water final results.xlsx", sheet = "scale 3")
wat_PFOS3$au_level <- 3

#Sed TBSN
wat_TBSN4 <- read_excel("HELCOM_raw_input/Final results TBT/water TBSN+ Final results.xlsx", sheet = "water TSBN+ Reulst scale 4 ")
wat_TBSN4$au_level <- 4
wat_TBSN3 <- read_excel("HELCOM_raw_input/Final results TBT/water TBSN+ Final results.xlsx", sheet = "scale 3")
wat_TBSN3$au_level <- 3


#Merge depth profile tables
wat_All <- rbindlist(list(wat_CD3,wat_CD4,wat_PB3,wat_PB4,wat_PFOS3,wat_PFOS4,wat_TBSN3,wat_TBSN4), use.names = TRUE, fill=TRUE)
#Rename ...32 TO Conf
colnames(wat_All)[colnames(wat_All) == "...32"] = "Conf"
#Add id
#id <- seq_len(nrow(wat_All))
#bio_All <- cbind(id, wat_All)

#Save output xlxs
write_xlsx(wat_All, "oUTPUT/Watresults.xlsx",
           col_names = TRUE)



#write output table
# write.table(wat_tsAll, file = "Results/wat_tsAll.txt", quote=FALSE, sep = "\t",
#             row.names = FALSE, col.names = TRUE, na="")

###Diverse
#head(dtAll_ts, n=10)
#tail(dtAll_ts, n=10)
#str(td1_ts)
#summary(td1_ts)
#colnames(dt1_ts)
#colnames(dt2_ts)
