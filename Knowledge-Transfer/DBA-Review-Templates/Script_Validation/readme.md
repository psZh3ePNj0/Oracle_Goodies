<h2>SCRIPT EXECUTION VALIDATION REVIEW:</h2> 
<br>

$$\color{blue} Both \space syntax \space and \space semantics \space based,$$ SQL scripts should be validated on:

- If a script completed with no errors $$\color{blue}and$$
- $$\color{blue}A \space scripts \space intent \space and \space business \space process \space impact.$$ For example, while a scripts synax is correct, its probably undesirable to delete hundreds of thousands of active core customer data......

<br>

Within a script, $$\color{blue} comment \space headers \space and \space comment \space snippets$$ are key best practices. Comment headers should provide an effective narrative and history. Comment headers should contain important information such as $$\color{blue}Author, \space Release \space Date, \space Script \space Name, \space Objectives, \space Dependencies \space and \space Version \space Control \space Info.$$
Comment snippets should guide developers / reviewers to key explanation points | milestone indicators.

<br>

$$\color{blue}Another \space best \space practice \space is \space meaningful \space script \space names.$$ Each organisation has its own standards, however, within scripts $$\color{blue} having \space RO \space(rollout) \space or \space RB \space (rollback)$$ makes a script quickly recognisable to a key area of its purpose. In addition to the base scripts, $$\color{blue}validation \space scripts,$$ for rollout $$\color{blue}(ROV)$$ and rollback $$\color{blue}(RBV)$$ can / should be used to validate the base scripts.


<br>
<h4>Script Execution Types:</h4>

- Rollout (RO) Scripts
- Rollback (RB) Scripts
- Rollout Validation (ROV) Scripts
- Rollback Validation (RBV) Scripts

<br>

Please see sample scripts templates. 
