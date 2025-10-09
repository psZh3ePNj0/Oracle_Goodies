select index_name, column_name
from user_ind_columns
where table_name = upper('&table_name')
order by index_name, column_position
/
