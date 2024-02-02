Punto 8 

WITH PromedioPorCurso AS (
  SELECT
    asignaturaid,
    AVG(nota) AS promedionota
  FROM
    Notas
  GROUP BY
    asignaturaid
)
SELECT
  CONCAT(d.nombres,' ',d.apellidos) AS nombredocente,
  a.nombre AS nombrecurso,
  pc.promedionota AS promedionotacurso,
  CONCAT(e.nombres,' ',e.apellidos) AS nombreestudiante,
  n.nota AS notaestudiante
FROM
  Notas n
INNER JOIN Estudiante e ON n.estudianteid = e.numeroidentidad
INNER JOIN Asignatura a ON n.asignaturaid = a.id
INNER JOIN Docente d ON a.docenteid = d.numeroidentidad
INNER JOIN PromedioPorCurso pc ON n.asignaturaid = pc.asignaturaid
WHERE
  n.nota > pc.promedionota
ORDER BY
  -- a.nombre ASC,
  n.nota ASC; -- en el punto 8 lo especifica 
  -- n.nota DESC; puede ser tambien descendente ya sea el caso

punto 9 

WITH CursoPromedio AS (
  SELECT
    asignaturaid,AVG(nota) AS promedionota
  FROM Notas
  GROUP BY
    asignaturaid
), NotaMaximaPorCurso AS (
  SELECT
    n.asignaturaid,n.estudianteid,n.nota,
    ROW_NUMBER() OVER(PARTITION BY n.asignaturaid ORDER BY n.nota DESC) AS rnk
  FROM
    Notas n
)
SELECT
  CONCAT(d.nombres,' ',d.apellidos) AS nombredocente,
  a.nombre AS nombrecurso,cp.promedionota AS promedionotacurso,
  CONCAT(e.nombres,' ',e.apellidos) AS nombreestudiante,nmpc.nota AS notaestudiante
FROM
  NotaMaximaPorCurso nmpc
JOIN
  CursoPromedio cp ON nmpc.asignaturaid = cp.asignaturaid
JOIN
  Asignatura a ON nmpc.asignaturaid = a.id
JOIN Docente d ON a.docenteid = d.numeroidentidad
JOIN
  Estudiante e ON nmpc.estudianteid = e.numeroidentidad
WHERE
  nmpc.rnk = 1
ORDER BY
  a.nombre ASC;
