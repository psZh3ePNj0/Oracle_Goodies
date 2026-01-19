<h2>ROLLBACK REVIEW</h2>

<br>
A portion of <Script Validation> section was dedicated towards rollback. In that context - the rollback was centered around script execution failure / data restoration requirement.

However, with data structure rollback (DDLs) such as:

- Package
- Stored procedures
- Functions
- Views
- Triggers

there could be hundreds of lines of code. What arguably makes the most sense, is before a data structure deployment, take a snapshot copy of the data structure being modified. Should a rollback be required - the snapshot copy would be restored (given no other data structure / dependency was impacted).

For review - the strategy is relatively straightforward. Take the Rollout / Rollback SQL files and use a comparative tool like
or if in a Linux environment using the <diff> command with the two files to ensure the difference in the files are the ones that are intended.

Post the side-by-side validation - ensure that the RollOut and Rollback scripts execute fine in a non-production environment and have gone through UAT / Regression testing (covered in the next section).
