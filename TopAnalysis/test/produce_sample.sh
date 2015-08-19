#!/bin/bash

## MC Sample
### Signal sample
python topAnalysis.py --txtfiles=../python/sourceFiles/TT_TuneCUETP8M1_13TeV-powheg-pythia8.txt --outputFile=plots_ttbar.root --doMC --maximum 380000
### Small Background
python topAnalysis.py --txtfiles=../python/sourceFiles/ST_t-channel_top_4f_leptonDecays_13TeV-powheg-pythia8_TuneCUETP8M1.txt --outputFile=plots_singletop.root --doMC --maximum 17000
python topAnalysis.py --txtfiles=../python/sourceFiles/ST_t-channel_antitop_4f_leptonDecays_13TeV-powheg-pythia8_TuneCUETP8M1.txt --outputFile=plots_antisingletop.root --doMC --maximum 17000
python topAnalysis.py --txtfiles=../python/sourceFiles/WW_TuneCUETP8M1_13TeV-pythia8.txt --outputFile=plots_ww.root --doMC --maximum 52000
python topAnalysis.py --txtfiles=../python/sourceFiles/WZ_TuneCUETP8M1_13TeV-pythia8.txt --outputFile=plots_wz.root --doMC --maximum 31000
python topAnalysis.py --txtfiles=../python/sourceFiles/ZZ_TuneCUETP8M1_13TeV-pythia8.txt --outputFile=plots_zz.root --doMC --maximum 8000
### Big Background
python topAnalysis.py --txtfiles=../python/sourceFiles/WJetsToLNu_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8.txt --outputFile=plots_wjets.root --doMC #--maximum 28598000
python topAnalysis.py --txtfiles=../python/sourceFiles/DYJetsToLL_M-50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8.txt --outputFile=plots_zjets.root --doMC --maximum 2801000

## Real Data
### Single Lepton
python topAnalysis.py --txtfiles=../python/sourceFiles/SingleMuon.txt --outputFile=plots_SingleMuon_data.root
python topAnalysis.py --txtfiles=../python/sourceFiles/SingleElectron.txt --outputFile=plots_SingleElectron_data.root
### Di-lepton
python topAnalysis.py --txtfiles=../python/sourceFiles/DoubleMuon.txt --outputFile=plots_DoubleMuon_data.root
python topAnalysis.py --txtfiles=../python/sourceFiles/DoubleElectron.txt --outputFile=plots_DoubleElectron_data.root
python topAnalysis.py --txtfiles=../python/sourceFiles/MuonEG.txt --outputFile=plots_MuonEG_data.root

## For QCD Estimation,
python topAnalysis.py --txtfiles=../python/TT_TuneCUETP8M1_13TeV-powheg-pythia8.txt --outputFile=qcd_plots_ttbar.root --doMC --invertPFIso
python topAnalysis.py --txtfiles=../python/SingleMuon.txt  --outputFile=qcd_plots_data.root --invertPFIso

