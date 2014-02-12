-- Import logs and run against production to get the peer groups created by institution.

select 
  b.inst_name,
  count(*) 
from 
  OIR_PEER_GROUP.institution_usage_02122014 a
  inner join OIR_PEER_GROUP.institutions b
    on a.institution_id = b.id
group by inst_name
order by 2 desc;
