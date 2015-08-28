#!/usr/bin/env python
import os
import glob
import ROOT
import sys

ROOT.gROOT.Macro("rootlogon.C")
from DataFormats.FWLite import Events, Handle
from CrossSectionTable import *

def setSamples() : 
  mc_samples = []
  mc_samples = glob.glob("./plots*.root")
  mc_samples.remove("./plots_data.root")
  mc_set={}
  data_samples = []
  data_samples.append("./plots_data.root")
  data_set ={ 'SingleMuon':"./plots_data.root"}

  for mc in mc_samples :
    title = mc.replace("./plots_","").replace(".root","")
    mc_set[title]=mc
  return mc_set, data_set

def countEntries( hist,xmin,xmax, ymin, ymax) :
  if ( xmin ==0 ) :
    xbin_min = 0
  else :
    xbin_min = hist.GetXaxis().FindBin(xmin)+1
  if ( ymin ==0 ) :
    ybin_min =0
  else :  
    ybin_min = hist.GetYaxis().FindBin(ymin)+1
  if ( xmax == "max") :
    xbin_max = hist.GetXaxis().GetLast()+1
  else :
    xbin_max = hist.GetXaxis().FindBin(xmax)
  if ( ymax == "max" ) :
    ybin_max = hist.GetYaxis().GetLast()+1
  else :  
    ybin_max = hist.GetYaxis().FindBin(ymax)
  value = hist.Integral(xbin_min, xbin_max, ybin_min, ybin_max)
  return value 

MC_set, DATA_set = setSamples()

print MC_set, DATA_set

from optparse import OptionParser

parser = OptionParser()

parser.add_option('--pfIso', metavar='F', type='float', action='store',
                  default=0.2,
                  dest='pfIso',
                  help='Set pfIso max')
parser.add_option('--MET', metavar='F', type='float', action='store',
                  default=20,
                  dest='MET',
                  help='Set MET value')

(options, args) = parser.parse_args()

lumi = 46.478
isoMax = options.pfIso
MET = options.MET

NEvent = {}
#Xsection["wjets"] = 61526.4
#Xsection["ttbar"] = 831.8
#Xsection["zjets"] = 6025.2 


NEvent["wjets"] = 24040263
NEvent["ttbar"] = 38662 
NEvent["zjets"] = 280051


regionAs=0
regionBs=0
regionCs=0
regionDs=0

for title, MC in MC_set.items() :
  #print MC
  f= ROOT.TFile( MC )
  metVsIso = f.Get("metVsIso")
  if ( title == "wjets" or title=="ttbar" ) :
    metVsIso.Scale( Xsection[title]*lumi / NEvent[title])
  regionA = countEntries( metVsIso, MET, "max",0, isoMax)
  regionB = countEntries( metVsIso, 0, MET,0,isoMax)
  regionC = countEntries( metVsIso, 0, MET, isoMax, "max")
  regionD = countEntries( metVsIso, MET, "max",isoMax, "max")

  print title, "(",metVsIso.GetEntries(),")", regionA, regionB, regionC, regionD,"=", regionA+regionB+regionC+regionD
  regionAs += regionA
  regionBs += regionB
  regionCs += regionC
  regionDs += regionD
  f.Close()
print "MC : ", regionAs, regionBs, regionCs, regionDs

data_regionA =0
data_regionB =0
data_regionC =0
data_regionD =0

for title, DATA in DATA_set.items() :
  f = ROOT.TFile( DATA )
  metVsIso = f.Get("metVsIso")
  regionA = countEntries( metVsIso, 20, "max",0,0.20)
  regionB = countEntries( metVsIso, 0, 20,0,0.20)
  regionC = countEntries( metVsIso, 0, 20,0.12, "max")
  regionD = countEntries( metVsIso, 20, "max",0.12, "max")
  #print title, regionA, regionB, regionC, regionD
  data_regionA += regionA
  data_regionB += regionB
  data_regionC += regionC
  data_regionD += regionD
  f.Close()
print "Data : ", data_regionA, data_regionB, data_regionC, data_regionD
rA = data_regionA - regionAs
rB = data_regionB - regionBs
rC = data_regionC - regionCs
rD = data_regionD - regionDs
print "Data - MC :", rA, rB, rC, rD

print 
print "QCD estimation at Region A : ", "B*D/C : ", float(rB)*float(rC)/float(rD)   
