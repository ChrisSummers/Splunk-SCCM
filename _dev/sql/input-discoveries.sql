select \
  da.agenttime, \
  disc.resourceid, \
  disc.netbios_name0 as name, \ 
  da.agentname \
from v_r_system disc \
left join v_agentdiscoveries da \
  on da.resourceid = disc.resourceid