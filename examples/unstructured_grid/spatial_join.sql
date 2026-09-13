LOAD spatial;

CREATE OR REPLACE TABLE grid_cells AS
SELECT cell_id::INTEGER AS cell_id, geom
FROM ST_Read('examples/unstructured_grid/grid.geojson');

-- Each point is matched to the polygons that cover it. Shared edges can
-- produce multiple matches; a point outside the grid gets a NULL cell ID.
CREATE OR REPLACE MACRO locate_cells_spatial(point_table) AS TABLE
SELECT p.*, c.cell_id
FROM query_table(point_table) AS p
LEFT JOIN grid_cells AS c
  ON ST_Covers(c.geom, ST_Point(p.x::DOUBLE, p.y::DOUBLE));

-- SELECT * FROM locate_cells_spatial('measurements');
