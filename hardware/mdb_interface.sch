EESchema Schematic File Version 4
LIBS:sparkvend-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 2 4
Title ""
Date ""
Rev ""
Comp ""
Comment1 ""
Comment2 ""
Comment3 ""
Comment4 ""
$EndDescr
$Comp
L Connector_Generic:Conn_02x03_Top_Bottom J2
U 1 1 5D455079
P 1950 6400
F 0 "J2" H 2000 6717 50  0000 C CNN
F 1 "MDB/ICP" H 2000 6626 50  0000 C CNN
F 2 "Connector_Molex:Molex_Mini-Fit_Jr_5569-06A2_2x03_P4.20mm_Horizontal" H 1950 6400 50  0001 C CNN
F 3 "~" H 1950 6400 50  0001 C CNN
	1    1950 6400
	1    0    0    -1  
$EndComp
NoConn ~ 1750 6500
Text Label 3050 6400 2    50   ~ 0
MDB_MASTER_TX
Text Label 3050 6300 2    50   ~ 0
MDB_MASTER_RX
Wire Wire Line
	2050 4400 2050 4350
Wire Wire Line
	2050 4350 2100 4350
$Comp
L power:GNDD #PWR?
U 1 1 5D45512F
P 2750 4400
F 0 "#PWR?" H 2750 4150 50  0001 C CNN
F 1 "GNDD" H 2754 4245 50  0000 C CNN
F 2 "" H 2750 4400 50  0001 C CNN
F 3 "" H 2750 4400 50  0001 C CNN
	1    2750 4400
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 3750 2750 3800
$Comp
L Isolator:VO615A-9 U3
U 1 1 5D455151
P 2400 4250
F 0 "U3" H 2400 4575 50  0000 C CNN
F 1 "VO615A-9" H 2400 4484 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 2400 4250 50  0001 C CNN
F 3 "http://www.vishay.com/docs/81753/vo615a.pdf" H 2400 4250 50  0001 C CNN
	1    2400 4250
	1    0    0    -1  
$EndComp
Wire Wire Line
	2700 4150 2750 4150
Connection ~ 2750 4150
Wire Wire Line
	2750 4400 2750 4350
Wire Wire Line
	2750 4350 2700 4350
$Comp
L Connector:Screw_Terminal_01x06 J1
U 1 1 5D45517C
P 3250 6200
F 0 "J1" H 3150 6650 50  0000 C CNN
F 1 "MDB Signals" H 3150 6550 50  0000 C CNN
F 2 "Connectors:SCREWTERMINAL-3.5MM-6" H 3250 6200 50  0001 C CNN
F 3 "~" H 3250 6200 50  0001 C CNN
	1    3250 6200
	1    0    0    -1  
$EndComp
NoConn ~ 3050 6200
$Comp
L sparkvend:V_MDBPWR #PWR?
U 1 1 5D509019
P 1450 5900
AR Path="/5D509019" Ref="#PWR?"  Part="1" 
AR Path="/5D3FEF32/5D509019" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1450 5750 50  0001 C CNN
F 1 "V_MDBPWR" H 1465 6073 50  0000 C CNN
F 2 "" H 1450 5900 50  0001 C CNN
F 3 "" H 1450 5900 50  0001 C CNN
	1    1450 5900
	1    0    0    -1  
$EndComp
Wire Wire Line
	1550 6400 1750 6400
Wire Wire Line
	1450 6300 1750 6300
Text HLabel 3050 4150 2    50   Input ~ 0
MASTER_IN
Wire Wire Line
	2750 4150 3050 4150
Wire Wire Line
	2750 4100 2750 4150
Wire Wire Line
	2750 2650 2750 2700
Text Label 1000 2700 0    50   ~ 0
MDB_MASTER_TX
Wire Wire Line
	2750 2700 3050 2700
Text HLabel 3050 2700 2    50   Input ~ 0
SLAVE_IN
$Comp
L Device:R R2
U 1 1 5D4550DD
P 1850 2700
F 0 "R2" V 1950 2750 50  0000 L CNN
F 1 "4.7K" V 1950 2500 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1780 2700 50  0001 C CNN
F 3 "~" H 1850 2700 50  0001 C CNN
	1    1850 2700
	0    -1   -1   0   
$EndComp
Wire Wire Line
	2750 2900 2700 2900
Wire Wire Line
	2750 2950 2750 2900
Connection ~ 2750 2700
Wire Wire Line
	2700 2700 2750 2700
$Comp
L Isolator:VO615A-9 U2
U 1 1 5D4550D1
P 2400 2800
F 0 "U2" H 2400 3125 50  0000 C CNN
F 1 "VO615A-9" H 2400 3034 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 2400 2800 50  0001 C CNN
F 3 "http://www.vishay.com/docs/81753/vo615a.pdf" H 2400 2800 50  0001 C CNN
	1    2400 2800
	1    0    0    -1  
$EndComp
Wire Wire Line
	2750 2300 2750 2350
$Comp
L power:+3V3 #PWR?
U 1 1 5D4550C4
P 2750 2300
F 0 "#PWR?" H 2750 2150 50  0001 C CNN
F 1 "+3V3" H 2765 2473 50  0000 C CNN
F 2 "" H 2750 2300 50  0001 C CNN
F 3 "" H 2750 2300 50  0001 C CNN
	1    2750 2300
	1    0    0    -1  
$EndComp
$Comp
L Device:R R3
U 1 1 5D4550BD
P 2750 2500
F 0 "R3" H 2680 2546 50  0000 R CNN
F 1 "10K" H 2680 2455 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2680 2500 50  0001 C CNN
F 3 "~" H 2750 2500 50  0001 C CNN
	1    2750 2500
	-1   0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5D4550AF
P 2750 2950
F 0 "#PWR?" H 2750 2700 50  0001 C CNN
F 1 "GNDD" H 2754 2795 50  0000 C CNN
F 2 "" H 2750 2950 50  0001 C CNN
F 3 "" H 2750 2950 50  0001 C CNN
	1    2750 2950
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 2900 2100 2900
Wire Wire Line
	2050 2950 2050 2900
$Comp
L power:+3V3 #PWR?
U 1 1 5DA79EBC
P 2750 3750
F 0 "#PWR?" H 2750 3600 50  0001 C CNN
F 1 "+3V3" H 2765 3923 50  0000 C CNN
F 2 "" H 2750 3750 50  0001 C CNN
F 3 "" H 2750 3750 50  0001 C CNN
	1    2750 3750
	-1   0    0    -1  
$EndComp
$Comp
L Device:R R5
U 1 1 5D45513D
P 2750 3950
F 0 "R5" H 2680 3996 50  0000 R CNN
F 1 "10K" H 2680 3905 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 2680 3950 50  0001 C CNN
F 3 "~" H 2750 3950 50  0001 C CNN
	1    2750 3950
	-1   0    0    -1  
$EndComp
$Comp
L sparkvend:GND_MDBPWR #PWR?
U 1 1 5D50646E
P 1550 6600
AR Path="/5D50646E" Ref="#PWR?"  Part="1" 
AR Path="/5D3FEF32/5D50646E" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 1550 6400 50  0001 C CNN
F 1 "GND_MDBPWR" H 1554 6446 50  0000 C CNN
F 2 "" H 1550 6550 50  0001 C CNN
F 3 "" H 1550 6550 50  0001 C CNN
	1    1550 6600
	1    0    0    -1  
$EndComp
$Comp
L sparkvend:GND_MDBSIG #PWR?
U 1 1 5D5076AE
P 2350 6600
AR Path="/5D5076AE" Ref="#PWR?"  Part="1" 
AR Path="/5D3FEF32/5D5076AE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2350 6350 50  0001 C CNN
F 1 "GND_MDBSIG" H 2355 6427 50  0000 C CNN
F 2 "" H 2350 6600 50  0001 C CNN
F 3 "" H 2350 6600 50  0001 C CNN
	1    2350 6600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2350 6500 2350 6600
Wire Wire Line
	1550 6400 1550 6600
Wire Wire Line
	2250 6500 2350 6500
Wire Wire Line
	1550 6100 1550 6400
Connection ~ 1550 6400
Wire Wire Line
	1450 5900 1450 6000
Connection ~ 1450 6000
Wire Wire Line
	1450 6000 1450 6300
Wire Wire Line
	2350 6500 3050 6500
Connection ~ 2350 6500
Wire Wire Line
	2250 6300 3050 6300
Wire Wire Line
	2250 6400 3050 6400
Wire Wire Line
	1550 6100 3050 6100
Wire Wire Line
	1450 6000 3050 6000
Wire Wire Line
	1000 2700 1700 2700
Wire Wire Line
	2000 2700 2100 2700
Text Label 1000 4150 0    50   ~ 0
MDB_MASTER_RX
Wire Wire Line
	1000 4150 1700 4150
$Comp
L Device:R R4
U 1 1 5D596511
P 1850 4150
F 0 "R4" V 1950 4200 50  0000 L CNN
F 1 "4.7K" V 1950 3950 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1780 4150 50  0001 C CNN
F 3 "~" H 1850 4150 50  0001 C CNN
	1    1850 4150
	0    -1   -1   0   
$EndComp
Wire Wire Line
	1550 1400 1700 1400
Text HLabel 1550 1400 0    50   Input ~ 0
SLAVE_OUT
Wire Wire Line
	2700 1400 3500 1400
$Comp
L Device:R R1
U 1 1 5D4550E9
P 1850 1400
F 0 "R1" V 1750 1550 50  0000 R CNN
F 1 "100" V 1750 1350 50  0000 R CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" V 1780 1400 50  0001 C CNN
F 3 "~" H 1850 1400 50  0001 C CNN
	1    1850 1400
	0    -1   1    0   
$EndComp
Wire Wire Line
	2750 1600 2750 1650
Wire Wire Line
	2700 1600 2750 1600
$Comp
L Isolator:VO615A-9 U1
U 1 1 5D4550CB
P 2400 1500
F 0 "U1" H 2400 1825 50  0000 C CNN
F 1 "VO615A-9" H 2400 1734 50  0000 C CNN
F 2 "Package_DIP:DIP-4_W7.62mm" H 2400 1500 50  0001 C CNN
F 3 "http://www.vishay.com/docs/81753/vo615a.pdf" H 2400 1500 50  0001 C CNN
	1    2400 1500
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5D4550A9
P 2050 1650
F 0 "#PWR?" H 2050 1400 50  0001 C CNN
F 1 "GNDD" H 2054 1495 50  0000 C CNN
F 2 "" H 2050 1650 50  0001 C CNN
F 3 "" H 2050 1650 50  0001 C CNN
	1    2050 1650
	1    0    0    -1  
$EndComp
Wire Wire Line
	2050 1600 2100 1600
Wire Wire Line
	2050 1650 2050 1600
Text Label 3500 1400 2    50   ~ 0
MDB_MASTER_RX
Wire Wire Line
	2100 4150 2000 4150
Wire Wire Line
	2000 1400 2100 1400
$Comp
L sparkvend:GND_MDBSIG #PWR?
U 1 1 5D4DFED4
P 2050 4400
AR Path="/5D4DFED4" Ref="#PWR?"  Part="1" 
AR Path="/5D3FEF32/5D4DFED4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2050 4150 50  0001 C CNN
F 1 "GND_MDBSIG" H 2055 4227 50  0000 C CNN
F 2 "" H 2050 4400 50  0001 C CNN
F 3 "" H 2050 4400 50  0001 C CNN
	1    2050 4400
	1    0    0    -1  
$EndComp
$Comp
L sparkvend:GND_MDBSIG #PWR?
U 1 1 5D4E0810
P 2050 2950
AR Path="/5D4E0810" Ref="#PWR?"  Part="1" 
AR Path="/5D3FEF32/5D4E0810" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2050 2700 50  0001 C CNN
F 1 "GND_MDBSIG" H 2055 2777 50  0000 C CNN
F 2 "" H 2050 2950 50  0001 C CNN
F 3 "" H 2050 2950 50  0001 C CNN
	1    2050 2950
	1    0    0    -1  
$EndComp
$Comp
L sparkvend:GND_MDBSIG #PWR?
U 1 1 5D4E0DB2
P 2750 1650
AR Path="/5D4E0DB2" Ref="#PWR?"  Part="1" 
AR Path="/5D3FEF32/5D4E0DB2" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2750 1400 50  0001 C CNN
F 1 "GND_MDBSIG" H 2755 1477 50  0000 C CNN
F 2 "" H 2750 1650 50  0001 C CNN
F 3 "" H 2750 1650 50  0001 C CNN
	1    2750 1650
	1    0    0    -1  
$EndComp
$EndSCHEMATC
