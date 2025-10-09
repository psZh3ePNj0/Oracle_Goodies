select i.instance_name||'.'||p.name || ' = ' || value from gv$parameter p,gv$instance i where p.inst_id = i.inst_id order by p.name,i.instance_name;
