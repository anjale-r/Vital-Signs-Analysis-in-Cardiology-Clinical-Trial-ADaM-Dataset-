/* Vital sign analysis dataset of cardiology-ADAM dataset */

filename reffile '/home/u64220165/SAS Stat/adam_advs_20250830_115949.csv';

proc import datafile=reffile
    out=adam_vs
    dbms=dlm
    replace;
    delimiter=",";
    getnames=yes;
run;

proc sort data=adam_vs;
    by visitnum;
run;

/************ Normality Checking ***********/

proc univariate data=adam_vs normal;
   class trtpn;         /* Treatment variable */
   var chg;             /* Change from baseline */
   histogram chg / normal kernel;
   qqplot chg / normal(mu=est sigma=est);
run;


/* Step 2: Independent T-Test */
proc ttest data=adam_vs;
   class trtpn;
   var chg;
run;

/* Step 3: Wilcoxon Rank-Sum Test (Nonparametric test) */
proc npar1way data=adam_vs wilcoxon;
   class trtpn;
   var chg;
run;

**Independent T-Test:** 
  - p = 0.03 → suggested a significant difference in mean CHG between treatment groups.
  - However, this test assumes normality, which was violated.

- **Wilcoxon Rank-Sum Test:** 
  - p = 0.11 → no significant difference in CHG distributions between treatment groups.
  - Since the normality assumption was not satisfied, this result is more reliable.

**Conclusion:**  
Although the t-test indicated significance, the nonparametric Wilcoxon test did not confirm this.  
Therefore, we conclude that there is no strong evidence of a difference between treatment groups in terms of change from baseline.



