<h2>DB PERFORMANCE REVIEW</h2>
<br>

$$\color{blue}DB \space performance \space document$$ is the final component for DBA Review of <b>Data | Data Structure | Database </b> changes and should contain performance assessment | impacts post DB changes.
Within the document, one should have the below key areas and metrics (before and after changes) detailed for a DBA:

- $$\color{blue}Explain \space Plan$$ of changed DB objects (SP / Function / Package) or key SQL area changed.
- $$\color{blue}Healthy \space sample \space amount$$ of the preformancee testing ($$\color{blue}recommendation:$$ 25% of peak usage period in production). If not 25%, the percentage amount supplied $$\color{blue}needs \space to \space have \space an \space explanation.$$
- Indicate if the code changed will used in a $$\color{blue}batch \space based \space process$$ (1x per interval) vs $$\color{blue}OLTP \space process$$ (single request but constantly called). 
<br>

Where applicable there is scope to not provide some information: 
- If the changes is a $$\color{blue}fisrt \space time \space deployment,$$ there are no previous benchmarks to provide. 
- If the total volumne of data to be impacted is $$\color{blue}very \space small,$$ 25% sample testing may not make sense w.r.t volume impact. 

