with software as ( \
select \
  [timestamp], \
  resourceid, \
  active=1, \
  softwarepropertieshash0, \
  softwarepropertieshashex0, \
  normalizedname as product_name, \
  normalizedversion as product_version, \
  normalizedpublisher as product_publisher, \
  InstallDate0 as installation_date, \
  categoryname as category, \
  familyname as family \
from v_gs_installed_software_categorized \
UNION ALL \
select \
  s.[timestamp], \
  s.resourceid, \
  active=0, \
  s.softwarepropertieshash0, \
  s.softwarepropertieshashex0, \
  coalesce (sl.commonname, s.productname0) as product_name, \
  coalesce (sl.commonpublisher, s.publisher0) as product_publisher, \
  coalesce (sl.commonversion, s.productversion0) as product_version, \
  installdate0 as installation_date, \
  fam.familyname, \
  cat.categoryname \
from v_hs_installed_software s \
left outer join  v_lu_softwarehash sh \
   on sh.softwarepropertieshash = s.softwarepropertieshash0 \
left outer join v_lu_softwarelist sl \
  on sl.softwareid = sh.softwareid \
inner join v_lu_category as cat \
  on cat.categoryid = coalesce(sl.categoryid, 4892) \
inner join v_lu_family as fam \
  on fam.familyid = coalesce(sl.familyid, 4891) \
where softwarepropertieshash0 is not null) \
select * \
from software
