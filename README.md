# Vital-Signs-Analysis-in-Cardiology-Clinical-Trial-ADaM-Dataset-

##Comparing the change from baseline (CHG) between treatment groups using:
##1. Normality check (PROC UNIVARIATE)
##2. Independent t-test (PROC TTEST)
##3. Wilcoxon rank-sum test (PROC NPAR1WAY)
  
##Dataset: ADaM dataset (adam_vs) of vital signs.

## Normality Assessment
The Shapiro-Wilk test and Q–Q plots indicated that the CHG variable 
was not normally distributed in one or both treatment groups.  Shapiro-Wilk p-value:

## Alternative Analysis
Since the normality assumption was violated, a Wilcoxon rank-sum test 
was performed.  
This approach provides a more reliable comparison of treatment groups 
under non-normal data conditions.

## Results & Interpretation

- **Independent T-Test:** 
  - p = 0.03 → suggested a significant difference in mean CHG between treatment groups.
  - However, this test assumes normality, which was violated.

- **Wilcoxon Rank-Sum Test:** 
  - p = 0.11 → no significant difference in CHG distributions between treatment groups.
  - Since the normality assumption was not satisfied, this result is more reliable.

**Conclusion:**  
Although the t-test indicated significance, the nonparametric Wilcoxon test did not confirm this.  
Therefore, we conclude that there is **no strong evidence of a difference between treatment groups** in terms of change from baseline.
