% Use this editor as a MiniZinc scratch book
enum disciplinas = {POR, ESP, ART, MAT, FIS, QUI, BIO, HIS, GEO, SOC, FIL, EDF};
enum turmas = {R1J, R2F, R3E, M1A, M1B, M2B, M3A, M3B};
enum professores = {AA, AO, CL, IL, RI, KL, MA, MI, LU, HE, ZE, SA};
enum aulas = {POR_R1J,POR_R2F,POR_R3E,POR_M1A,POR_M1B,POR_M2B,POR_M3A,POR_M3B,ESP_R1J,ESP_R2F,ESP_R3E,ESP_M1A,ESP_M1B,ESP_M2B,ESP_M3A,ESP_M3B,ART_R1J,ART_R2F,ART_R3E,ART_M1A,ART_M1B,ART_M2B,ART_M3A,ART_M3B,MAT_R1J,MAT_R2F,MAT_R3E,MAT_M1A,MAT_M1B,MAT_M2B,MAT_M3A,MAT_M3B,FIS_R1J,FIS_R2F,FIS_R3E,FIS_M1A,FIS_M1B,FIS_M2B,FIS_M3A,FIS_M3B,QUI_R1J,QUI_R2F,QUI_R3E,QUI_M1A,QUI_M1B,QUI_M2B,QUI_M3A,QUI_M3B,BIO_R1J,BIO_R2F,BIO_R3E,BIO_M1A,BIO_M1B,BIO_M2B,BIO_M3A,BIO_M3B,HIS_R1J,HIS_R2F,HIS_R3E,HIS_M1A,HIS_M1B,HIS_M2B,HIS_M3A,HIS_M3B,GEO_R1J,GEO_R2F,GEO_R3E,GEO_M1A,GEO_M1B,GEO_M2B,GEO_M3A,GEO_M3B,SOC_R1J,SOC_R2F,SOC_R3E,SOC_M1A,SOC_M1B,SOC_M2B,SOC_M3A,SOC_M3B,FIL_R1J,FIL_R2F,FIL_R3E,FIL_M1A,FIL_M1B,FIL_M2B,FIL_M3A,FIL_M3B,EDF_R1J,EDF_R2F,EDF_R3E,EDF_M1A,EDF_M1B,EDF_M2B,EDF_M3A,EDF_M3B};

array[professores] of int: K = [24, 17, 20, 25, 24, 15, 24, 20, 2, 8, 18, 3];

enum horarios = {seg1, seg2, seg3, seg4, seg5, ter1, ter2, ter3, ter4, ter5, qua1, qua2, qua3, qua4, qua5, qui1, qui2, qui3, qui4, qui5, sex1, sex2, sex3, sex4, sex5};

enum dias = {seg, ter, qua, qui, sex};

array[dias, horarios] of 0..1: Q =
[| 1, 1, 1, 1, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  1, 1, 1, 1, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  1, 1, 1, 1, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  1, 1, 1, 1, 1,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  1, 1, 1, 1, 1
|];

array[aulas,professores] of 0..1: T =
/* AA, AO, CL, IL, RI, KL, MA, MI, LU, HE, ZE, SA */
[|  0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  1,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  1,  0,  0,  0,  0,  0, 0

|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0

|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, 0
|   1,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 1
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 1
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  0, 1

|   0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  1,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, 0

|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  0,  1, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  1,  0,  0, 0

|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  1,  0,  0,  0, 0

/* AA, AO, CL, IL, RI, KL, MA, MI, LU, HE, ZE, SA*/
|   0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0
|   0,  1,  0,  0,  0,  0,  0,  0,  0,  0,  0, 0

|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0

|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0

|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  1,  0,  0,  0,  0,  0,  0, 0

|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0
|   0,  0,  0,  0,  0,  0,  1,  0,  0,  0,  0, 0

|   0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0, 0
|   0,  0,  0,  0,  0,  0,  0,  0,  0,  1,  0, 0
|];

array[aulas] of int: A = [
  5, 5, 5, 5, 5, 5, 5, 5,
  2, 2, 2, 2, 2, 2, 2, 2,
  1, 1, 0, 1, 1, 1, 1, 1,
  4, 4, 4, 4, 4, 4, 4, 4,
  2, 2, 2, 2, 2, 2, 2, 2,
  2, 2, 2, 2, 2, 2, 2, 2,
  2, 2, 3, 2, 2, 2, 2, 2,
  2, 2, 2, 2, 2, 2, 2, 2,
  2, 2, 2, 2, 2, 2, 2, 2,
  1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1,
  1, 1, 1, 1, 1, 1, 1, 1
];

array[horarios, professores] of 0..1: d =
/* AA, AO, CL, IL, RI, KL, MA, MI, LU, HE, ZE, SA */
/*|  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1,  1*/
[|  1,  0,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0
 |  1,  0,  1,  1,  1,  1,  1,  1,  1,  0,  0,  0
 |  1,  0,  1,  1,  1,  1,  1,  1,  0,  0,  0,  1
 |  1,  0,  1,  1,  1,  1,  1,  1,  0,  0,  0,  1
 |  1,  0,  1,  1,  1,  1,  1,  1,  0,  0,  0,  1
 
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  0,  1,  0
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  0,  1,  0
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  0,  1,  0
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  0,  1,  0
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  0,  1,  0
 
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  1,  1,  0
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  1,  1,  0
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  1,  1,  0
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  1,  1,  0
 |  1,  1,  1,  1,  1,  0,  1,  1,  0,  1,  1,  0
 
 |  1,  1,  0,  1,  1,  1,  1,  1,  0,  0,  1,  0
 |  1,  1,  0,  1,  1,  1,  1,  1,  0,  0,  1,  0
 |  1,  1,  0,  1,  1,  1,  1,  1,  0,  0,  1,  0
 |  1,  1,  0,  1,  1,  1,  1,  1,  0,  0,  1,  0
 |  1,  1,  0,  1,  1,  1,  1,  1,  0,  0,  1,  0

 |  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  0
 |  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  0
 |  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  0
 |  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  0
 |  1,  1,  1,  1,  1,  1,  1,  0,  0,  1,  1,  0
|];

array[horarios, horarios] of var 0..1: v =
[| 1, 1, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 1, 1, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 1, 1, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 1, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 
 | 0, 0, 0, 0, 0,  1, 1, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 1, 1, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 1, 1, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 1, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0

 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  1, 1, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 1, 1, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 1, 1, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 1, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 1,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0
 
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  1, 1, 0, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 1, 1, 0, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 1, 1, 0,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 1, 1,  0, 0, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 1,  0, 0, 0, 0, 0
 
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  1, 1, 0, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 1, 1, 0, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 1, 1, 0
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 1, 1
 | 0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 0,  0, 0, 0, 0, 1
 
|];

array[aulas, turmas] of var 0..1: g =
[| 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
 
 | 1, 0, 0, 0, 0, 0, 0, 0
 | 0, 1, 0, 0, 0, 0, 0, 0
 | 0, 0, 1, 0, 0, 0, 0, 0
 | 0, 0, 0, 1, 0, 0, 0, 0
 | 0, 0, 0, 0, 1, 0, 0, 0
 | 0, 0, 0, 0, 0, 1, 0, 0
 | 0, 0, 0, 0, 0, 0, 1, 0
 | 0, 0, 0, 0, 0, 0, 0, 1
|];

% VARIÁVEL DE DECISÃO
array[horarios, aulas] of var 0..1: S;

% R1
constraint forall (i in horarios, k in professores)(
  let {var int: q = sum(j in aulas)(S[i, j]*T[j,k])} in (q == 0 \/ q == 1)
);

% R2
constraint forall (i in horarios, k in professores)(
  (sum(j in aulas)(S[i, j]*T[j,k]) == 0) \/ (d[i, k] == 1)
);

% R3
constraint forall (j in aulas)(
  let {var int: aj_ = sum(h in horarios)(S[h, j])} in aj_ == A[j]
);

% R4
constraint forall (j in professores)(
  sum(q in aulas, p in horarios)(S[p, q] * T[q, j]) == K[j]
);

% R5
constraint forall (j in aulas, h in 1..length(horarios)-2)(
  (S[horarios[h], j] + S[horarios[h+1], j] + S[horarios[h+2], j]) < 3
);

% R6
constraint forall (i in horarios, j in turmas) (
  sum(k in aulas)(S[i, k]*g[k, j]) == 1
);

%R7
constraint forall (d in dias, a in aulas)(
  sum(h in horarios)(Q[d, h]*S[h, a]) < 3
);

solve maximize sum(j in aulas) (
  sum(k in 1..length(horarios)-1)(if ((k mod 5) != 0) /\ (S[horarios[k], j] == 1) /\ (S[horarios[k+1], j] == 1) then 1 else 0 endif)
);