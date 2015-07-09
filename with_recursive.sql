SELECT
	tmp.id,
	tmp.price
FROM
(
	WITH RECURSIVE
		cat_tree (id, parent_id, price) AS (
			SELECT t.id, t.parent_id, t.price
			FROM table_1 t
			WHERE t.price IS NULL

			UNION ALL

			SELECT ct.id, t.parent_id, t.price
			FROM
				table_1 t
				JOIN cat_tree ct ON ct.parent_id = t.id AND ct.price IS NULL
		)
	SELECT *
	FROM cat_tree
	WHERE cat_tree.price IS NOT NULL
) tmp

UNION ALL

SELECT t.id, t.price
FROM table_1 t
WHERE t.price IS NOT NULL
;
