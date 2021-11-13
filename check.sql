select  *,
        (case when t.testtype in
                  (select testtype
                   from   Offer as o
                   where  o.testcentre = t.testcentre)
         then 'yes' else 'no' end) as offered
from  Test as t;
