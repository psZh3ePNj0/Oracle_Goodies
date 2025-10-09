select table_owner, owner synonym_owner, count(*)
from dba_synonyms
group by table_owner, owner
order by table_owner, owner
/
