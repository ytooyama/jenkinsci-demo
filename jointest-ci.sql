\set ON_ERROR_STOP true
explain analyze SELECT count(*) FROM t_test AS a, t_join AS b WHERE a.id = b.id GROUP BY a.ten;