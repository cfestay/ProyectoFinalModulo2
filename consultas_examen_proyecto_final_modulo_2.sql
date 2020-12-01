
SELECT CAPACITACION.IDCAPACITACION, CAPFECHA, CAPLUGAR, ASISTENTES.ASISTNOMBRECOMPLETO, ASISTEDAD, ASISTCORREO 
FROM ASISTENTES INNER JOIN CAPACITACION
ON CAPACITACION.IDCAPACITACION=ASISTENTES.IDASISTENTE WHERE ASISTENTES.IDASISTENTE=3;




SELECT VISITA.IDVISITA, CLIENTE.CLICOMUNA, VISITA.VISFECHA, registrochequeo.cumplimiento
    FROM VISITA
    INNER JOIN CLIENTE
        ON CLIENTE.IDCLIENTE = VISITA.IDVISITA
    INNER JOIN CHEQUEOS
        ON CHEQUEOS.IDCHEQUEO = VISITA.IDVISITA
        
     INNER JOIN registrochequeo
        ON CHEQUEOS.IDCHEQUEO = registrochequeo.idregistrochequeo
        
        WHERE CLIENTE.CLICOMUNA='valparaiso';



SELECT cliente.clinombres, cliente.cliapellidos, cliente.rutcliente,cliente.clitelefono,
accidente.accifecha, accidente.accihora, accidente.accilugar, accidente.acciconsecuencias
FROM accidente 
INNER JOIN cliente
ON accidente.idaccidente = cliente.idcliente;
