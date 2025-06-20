#!/bin/bash
set -e  # Stop script on error

conda activate smetana

cd /home/arog/models/xml

#######################
# V3 + V5 Prediabetes #
######################

#Default (resultado tem alguma aleatoriadade natural. Ver algoritmo)
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iYL1228.xml iEcSMS35_1347.xml iSDY_1059.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iECSE_1348.xml iETEC_1333.xml iUTI89_1310.xml -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_all

#Detailed (resultado tem alguma aleatoriadade natural. Ver algoritmo)
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iYL1228.xml iEcSMS35_1347.xml iSDY_1059.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iECSE_1348.xml iETEC_1333.xml iUTI89_1310.xml --detailed -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_all

#Default LB Anaerobic
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iYL1228.xml iEcSMS35_1347.xml iSDY_1059.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iECSE_1348.xml iETEC_1333.xml iUTI89_1310.xml -m LB[-O2] --mediadb /home/arog/Documents/GitHub/HGMB_Project/datasets/media_db.tsv -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_all_lb-o2

#Detailed LB Anaerobic
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iYL1228.xml iEcSMS35_1347.xml iSDY_1059.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iECSE_1348.xml iETEC_1333.xml iUTI89_1310.xml -m LB[-O2] --mediadb /home/arog/Documents/GitHub/HGMB_Project/datasets/media_db.tsv --detailed -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_all_lb-o2

#Default Gut Medium - Not Working
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iYL1228.xml iEcSMS35_1347.xml iSDY_1059.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iECSE_1348.xml iETEC_1333.xml iUTI89_1310.xml -m Gut --mediadb /home/arog/Documents/GitHub/HGMB_Project/datasets/media_db.tsv -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_all_Gutm

#Detailed Gut Medium - Not Working
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iYL1228.xml iEcSMS35_1347.xml iSDY_1059.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iECSE_1348.xml iETEC_1333.xml iUTI89_1310.xml -m Gut --mediadb /home/arog/Documents/GitHub/HGMB_Project/datasets/media_db.tsv --detailed -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_all_Gutm

#######
# V3 #
######

#Default (resultado tem alguma aleatoriadade natural. Ver algoritmo)
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iEcSMS35_1347.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iETEC_1333.xml iUTI89_1310.xml -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_healthy

#Detailed (resultado tem alguma aleatoriadade natural. Ver algoritmo)
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iEcSMS35_1347.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iETEC_1333.xml iUTI89_1310.xml --detailed -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_healthy

#Default LB Anaerobic
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iEcSMS35_1347.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iETEC_1333.xml iUTI89_1310.xml -m LB[-O2] --mediadb /home/arog/Documents/GitHub/HGMB_Project/datasets/media_db.tsv -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_healthy_lb-o2

#Detailed LB Anaerobic
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iEcSMS35_1347.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iETEC_1333.xml iUTI89_1310.xml -m LB[-O2] --mediadb /home/arog/Documents/GitHub/HGMB_Project/datasets/media_db.tsv --detailed -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_healthy_lb-o2

#Default Gut Medium - Not Working
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iEcSMS35_1347.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iETEC_1333.xml iUTI89_1310.xml -m Gut --mediadb /home/arog/Documents/GitHub/HGMB_Project/datasets/media_db.tsv -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_healthy_Gutm

#Detailed Gut Medium - Not Working
smetana ic_1306.xml iCN900.xml iECSF_1327.xml iNRG857_1313.xml iEcSMS35_1347.xml iEC1356_Bl21DE3.xml iECUMN_1333.xml iUMNK88_1353.xml iETEC_1333.xml iUTI89_1310.xml -m Gut --mediadb /home/arog/Documents/GitHub/HGMB_Project/datasets/media_db.tsv --detailed -o /home/arog/Documents/GitHub/HGMB_Project/comm_results/smetana_healthy_Gutm

conda deactivate

