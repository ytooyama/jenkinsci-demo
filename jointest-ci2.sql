\set ON_ERROR_STOP true
explain analyze SELECT count(*)
    FROM    t_test AS a, t_join AS b, t_test AS c,
        t_join AS d, t_test AS e, t_join AS f
    WHERE   a.id = b.id
        AND b.id = c.id
        AND c.id = d.id
        AND d.id = e.id
        AND e.id = f.id;