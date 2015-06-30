Cell Lineage Images, a sampler of time-lapse microscopy data procured from the White Lab, U. Wisconsin: https://drive.google.com/folderview?id=0B_t3mQaA-HaMTEdndjJrT0lpZ00&usp=sharing_eid#list

* readme for dataset.

Division Event (temporal) Data, data from EPIC and WORMGuides datasets:
https://drive.google.com/folderview?id=0B_t3mQaA-HaMTUsxMWZ4X2RfeUU&usp=sharing_eid&tid=0B_t3mQaA-HaMTEdndjJrT0lpZ00

* contains a 30 embryo randomly-sampled subset of EPIC dataset (4 files: mean-std-cell-cycles-DevBio-2008, n-30-embryos, number of types of divisions, reanalysis-1-27-early-middle-late-embryo).

* notes on counts for 9 groups, variables of A1-3, B1-3, C1-3:

A) Number of cells of type (e.g. AB, ABllrp) per lineage tree 

=(countif(B$2:B$635237,"="&B2))/29

*** be sure to delete outliers (all negative time values).

B) Number of cells at a given timepoint

	i) =min(B$2:B$635237), =max(B$2:B$635237), =row(A1) -- min to max
	
	ii) =(countif(A$2:A$36823,$B2))/29, A2: is the "time" variable, B2 is the interval from min to max.

C) Unique Cells, Number of a Specific (Unique) Cell, Change in the Number of Particular Timepoints (Divisions)

D) Symmetrical/Asymmetrical Divisions

Symmetrical: =SUMPRODUCT((MOD(P2:P110,2)<>0)+0)

Asymmetrical: =SUMPRODUCT((P2:P110<>"")*(MOD(P2:P110,2)=0)+0)

* where P2:P110 is the Change in the Number of Particular Timepoints (Divisions).

E) Number of a Particular Timepoint per Embryo

Subfolder 4-D position, 9 groups (A1-A3, A-C) of 9 embryos (361 embryos total), EPIC dataset:
https://drive.google.com/folderview?id=0B_t3mQaA-HaMRmtvQURsWEVGVGc&usp=sharing_eid&tid=0B_t3mQaA-HaMTEdndjJrT0lpZ00

Subfolder Cell Division Intervals, 9 groups (A1-A3, A-C) of 9 embryos (361 embryos total), EPIC dataset:
https://drive.google.com/folderview?id=0B_t3mQaA-HaMTUsxMWZ4X2RfeUU&usp=sharing_eid&tid=0B_t3mQaA-HaMTEdndjJrT0lpZ00

Worm_slack, backup of Slack space, used during Fall of 2014 for discussions and other collaboration:
https://drive.google.com/folderview?id=0B_t3mQaA-HaMbF9CZjBxQVpDZ0U&usp=sharing_eid&tid=0B_t3mQaA-HaMTEdndjJrT0lpZ00
