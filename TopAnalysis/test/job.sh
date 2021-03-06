python topAnalysis.py --txtfiles=../python/sourceFiles/KISTI/TT_TuneCUETP8M1_13TeV-powheg-pythia8.txt --outputFile=plots_ttbar.root --doMC --maximum 38662 &
python topAnalysis.py --txtfiles=../python/sourceFiles/KISTI/ST_t-channel_top_4f_leptonDecays_13TeV-powheg-pythia8_TuneCUETP8M1.txt --outputFile=plots_singletop_t.root --doMC --maximum 6322 &
python topAnalysis.py --txtfiles=../python/sourceFiles/KISTI/ST_t-channel_antitop_4f_leptonDecays_13TeV-powheg-pythia8_TuneCUETP8M1.txt --outputFile=plots_antisingletop_t.root --doMC --maximum 3762 &
python topAnalysis.py --txtfiles=../python/sourceFiles/KISTI/ST_tW_top_5f_inclusiveDecays_13TeV-powheg-pythia8_TuneCUETP8M1.txt --outputFile=plots_singletop_tW.root --doMC --maximum 1654 &
python topAnalysis.py --txtfiles=../python/sourceFiles/KISTI/ST_tW_antitop_5f_inclusiveDecays_13TeV-powheg-pythia8_TuneCUETP8M1.txt --outputFile=plots_antisingletop_tW.root --doMC --maximum 1654 &
#python topAnalysis.py --txtfiles=../python/sourceFiles/KISTI/WJetsToLNu_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8.txt --outputFile=plots_wjets.root --doMC --maximum 2859761 &
python topAnalysis.py --txtfiles=../python/sourceFiles/KISTI/DYJetsToLL_M-50_TuneCUETP8M1_13TeV-amcatnloFXFX-pythia8.txt --outputFile=plots_zjets.root --doMC --maximum 280051 &
python topAnalysis.py --txtfiles=../python/sourceFiles/KISTI/SingleMuon.txt --outputFile=plots_data.root &
