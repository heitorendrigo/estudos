select a.not_in_codigo
from mgven.ven_notafiscal a
where a.not_in_numero in (6833)
      and a.tpd_in_codigo = 22




update mgven.ven_itemnotafiscal t
set t.itn_re_icmsrecupera = t.itn_re_valoricms,
    t.itn_re_vlcofinsrecupera = t.itn_re_vlcofinsimport,
    t.itn_re_vlpisrecupera    = t.itn_re_vlpisimport
where t.not_in_codigo in (select a.not_in_codigo
                                 from mgven.ven_notafiscal a
                                 where a.not_in_numero in (6833)
                                 and a.tpd_in_codigo = 22)




/*
select a.not_in_codigo
from mgven.ven_notafiscal a
where a.not_in_numero in (6166,6167,6173,6172) -- numero da nota
      and a.tpd_in_codigo = 22
      


update mgven.ven_itemnotafiscal t
set t.itn_re_icmsrecupera = t.itn_re_valoricms
where t.not_in_codigo in (319983)


select t.rowid, t.itn_re_icmsrecupera, t.itn_re_valoricms from mgven.ven_itemnotafiscal t
where t.not_in_codigo in (319470,319760,319975,319983)



6166,6167,6173,6172
*/
