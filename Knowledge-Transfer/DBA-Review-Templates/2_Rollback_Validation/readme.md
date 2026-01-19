<h2>ROLLBACK REVIEW</h2>

<br>
A portion of the [Script Validation] (https://github.com/psZh3ePNj0/Oracle_Goodies/tree/main/Knowledge-Transfer/DBA-Review-Templates/1_Script_Validation) section was dedicated towards rollback. In that context - the rollback was centered around script execution failure / data restoration requirement. However, with data structure rollback (DDLs) such as:

- $$\color{blue}Package$$
- $$\color{blue}Stored Procedures$$
- $$\color{blue}Functions$$
- $$\color{blue}Views$$
- $$\color{blue}Triggers$$

there could be hundreds of lines of code. 

<br>

What makes sense is, $$\color{blue} before \space a \space data \space structure \space deployment, \space take \space a \space snapshot \space copy \space of \space the \space data \space structure$$ Should a rollback be required - restore the snapshot copy $$\color{red} (given \space no \space other \space  data \space structure \space / \space dependency \space was \space impacted).$$

For review - the strategy is relatively straightforward. Take the Rollout / Rollback SQL files and use a comparative tool like or if in a Linux environment using the $$\color{blue} diff$$ command with the two files to ensure the difference in the files are the ones that are intended.

Post the side-by-side validation, $$\color{blue} ensure \space rollout \space and \space rollback \space scripts \space execute \space fine \space in \space non-production \space environment \space and \space have \space gone \space through \space UAT \space / \space Regression \space testing.$$
