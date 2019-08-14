EESchema Schematic File Version 4
LIBS:sparkvend-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 3 4
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
L power:+5V #PWR?
U 1 1 5D575F4C
P 9400 1300
AR Path="/5D575F4C" Ref="#PWR?"  Part="1" 
AR Path="/5D3FF622/5D575F4C" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 9400 1150 50  0001 C CNN
F 1 "+5V" H 9415 1473 50  0000 C CNN
F 2 "" H 9400 1300 50  0001 C CNN
F 3 "" H 9400 1300 50  0001 C CNN
	1    9400 1300
	1    0    0    -1  
$EndComp
$Comp
L Jumper:Jumper_2_Open JP1
U 1 1 5D632492
P 9050 1450
F 0 "JP1" H 9050 1685 50  0000 C CNN
F 1 "Power From Pi" H 9050 1594 50  0000 C CNN
F 2 "Connector_PinHeader_2.54mm:PinHeader_1x02_P2.54mm_Vertical" H 9050 1450 50  0001 C CNN
F 3 "~" H 9050 1450 50  0001 C CNN
	1    9050 1450
	1    0    0    -1  
$EndComp
Wire Wire Line
	9400 1450 9400 1300
Wire Wire Line
	9250 1450 9400 1450
Text Label 7650 2150 2    60   ~ 0
P5V_HAT
Wire Wire Line
	6900 2150 7050 2150
Wire Wire Line
	5800 2150 6250 2150
$Comp
L raspberrypi_hat:DMG2305UX Q1
U 1 1 5D46DCAE
P 6650 2150
F 0 "Q1" V 6800 2300 50  0000 R CNN
F 1 "DMG2305UX" V 6800 2100 50  0000 R CNN
F 2 "Package_TO_SOT_SMD:SOT-23" H 6850 2250 50  0001 C CNN
F 3 "" H 6650 2150 50  0000 C CNN
	1    6650 2150
	0    -1   -1   0   
$EndComp
$Comp
L Device:R R6
U 1 1 58E15896
P 6250 3500
F 0 "R6" V 6330 3500 50  0000 C CNN
F 1 "10K" V 6250 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6180 3500 50  0001 C CNN
F 3 "" H 6250 3500 50  0001 C CNN
	1    6250 3500
	1    0    0    -1  
$EndComp
$Comp
L Device:R R7
U 1 1 5D46DCB2
P 7050 3500
F 0 "R7" V 7130 3500 50  0000 C CNN
F 1 "47K" V 7050 3500 50  0000 C CNN
F 2 "Resistor_SMD:R_0603_1608Metric_Pad1.05x0.95mm_HandSolder" V 6980 3500 50  0001 C CNN
F 3 "" H 7050 3500 50  0001 C CNN
	1    7050 3500
	1    0    0    -1  
$EndComp
Wire Wire Line
	6250 3700 6250 3650
Wire Wire Line
	7050 3700 7050 3650
Wire Wire Line
	6650 3300 7050 3300
Connection ~ 7050 3300
Connection ~ 6250 2150
Connection ~ 7050 2150
Text Label 1700 2400 0    60   ~ 0
ID_SD_EEPROM
Wire Wire Line
	7050 3300 7050 3350
Wire Wire Line
	6250 2150 6400 2150
Wire Wire Line
	7050 2150 7650 2150
Wire Wire Line
	2550 1200 2150 1200
Wire Wire Line
	2550 1300 2150 1300
$Comp
L raspberrypi_hat:OX40HAT J3
U 1 1 5D621359
P 3150 1100
F 0 "J3" H 3150 1325 50  0000 C CNN
F 1 "OX40HAT" H 3150 1234 50  0000 C CNN
F 2 "Connector_PinSocket_2.54mm:PinSocket_2x20_P2.54mm_Vertical" H 3150 1300 50  0001 C CNN
F 3 "" H 2450 1100 50  0000 C CNN
	1    3150 1100
	1    0    0    -1  
$EndComp
NoConn ~ 2550 1400
NoConn ~ 2550 1600
NoConn ~ 2550 1700
NoConn ~ 2550 1800
NoConn ~ 2550 1900
NoConn ~ 2550 2000
NoConn ~ 2550 2100
NoConn ~ 2550 2200
NoConn ~ 2550 2500
NoConn ~ 2550 2600
NoConn ~ 2550 2700
NoConn ~ 2550 2800
NoConn ~ 2550 2900
NoConn ~ 3750 1400
NoConn ~ 3750 1500
NoConn ~ 3750 1600
NoConn ~ 3750 1800
NoConn ~ 3750 1900
NoConn ~ 3750 2100
NoConn ~ 3750 2200
NoConn ~ 3750 2300
NoConn ~ 3750 2600
NoConn ~ 3750 2800
NoConn ~ 3750 2900
NoConn ~ 3750 3000
$Comp
L power:GNDD #PWR?
U 1 1 5D62C5CE
P 2450 3100
AR Path="/5D62C5CE" Ref="#PWR?"  Part="1" 
AR Path="/5D3FF622/5D62C5CE" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 2450 2850 50  0001 C CNN
F 1 "GNDD" H 2454 2945 50  0000 C CNN
F 2 "" H 2450 3100 50  0001 C CNN
F 3 "" H 2450 3100 50  0001 C CNN
	1    2450 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	2450 3100 2450 3000
Wire Wire Line
	2450 1500 2550 1500
Wire Wire Line
	2550 2300 2450 2300
Connection ~ 2450 2300
Wire Wire Line
	2450 2300 2450 1500
Wire Wire Line
	2550 3000 2450 3000
Connection ~ 2450 3000
Wire Wire Line
	2450 3000 2450 2300
$Comp
L power:GNDD #PWR?
U 1 1 5D62E554
P 3850 3100
AR Path="/5D62E554" Ref="#PWR?"  Part="1" 
AR Path="/5D3FF622/5D62E554" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3850 2850 50  0001 C CNN
F 1 "GNDD" H 3854 2945 50  0000 C CNN
F 2 "" H 3850 3100 50  0001 C CNN
F 3 "" H 3850 3100 50  0001 C CNN
	1    3850 3100
	1    0    0    -1  
$EndComp
Wire Wire Line
	3850 3100 3850 2700
Wire Wire Line
	3850 2700 3750 2700
Wire Wire Line
	3750 2500 3850 2500
Wire Wire Line
	3850 2500 3850 2700
Connection ~ 3850 2700
Wire Wire Line
	3750 2000 3850 2000
Wire Wire Line
	3850 2000 3850 2500
Connection ~ 3850 2500
Wire Wire Line
	3750 1700 3850 1700
Wire Wire Line
	3850 1700 3850 2000
Connection ~ 3850 2000
Wire Wire Line
	3750 1300 3850 1300
Wire Wire Line
	3850 1300 3850 1700
Connection ~ 3850 1700
Text Label 4600 1100 2    60   ~ 0
P5V_HAT
Text Label 4600 1200 2    60   ~ 0
P5V_HAT
Text Label 4600 2400 2    60   ~ 0
ID_SC_EEPROM
$Comp
L power:GNDD #PWR?
U 1 1 5D429856
P 6250 3700
AR Path="/5D429856" Ref="#PWR?"  Part="1" 
AR Path="/5D3FF622/5D429856" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 6250 3450 50  0001 C CNN
F 1 "GNDD" H 6254 3545 50  0000 C CNN
F 2 "" H 6250 3700 50  0001 C CNN
F 3 "" H 6250 3700 50  0001 C CNN
	1    6250 3700
	1    0    0    -1  
$EndComp
$Comp
L power:GNDD #PWR?
U 1 1 5D42A393
P 7050 3700
AR Path="/5D42A393" Ref="#PWR?"  Part="1" 
AR Path="/5D3FF622/5D42A393" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 7050 3450 50  0001 C CNN
F 1 "GNDD" H 7054 3545 50  0000 C CNN
F 2 "" H 7050 3700 50  0001 C CNN
F 3 "" H 7050 3700 50  0001 C CNN
	1    7050 3700
	1    0    0    -1  
$EndComp
Wire Wire Line
	7050 3200 7050 3300
$Comp
L raspberrypi_hat:DMMT5401 Q2
U 2 1 58E153D6
P 6950 3000
F 0 "Q2" H 7150 3075 50  0000 L CNN
F 1 "DMMT5401" H 7150 3000 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 7150 2925 50  0001 L CIN
F 3 "" H 6950 3000 50  0000 L CNN
	2    6950 3000
	1    0    0    1   
$EndComp
Connection ~ 6550 3000
Connection ~ 6250 3000
Wire Wire Line
	6550 3000 6750 3000
Wire Wire Line
	6250 3000 6550 3000
Wire Wire Line
	6550 2650 6550 3000
Wire Wire Line
	6250 2850 6250 3000
$Comp
L raspberrypi_hat:DMMT5401 Q2
U 1 1 58E1538B
P 6350 2650
F 0 "Q2" H 6550 2725 50  0000 L CNN
F 1 "DMMT5401" H 6550 2650 50  0000 L CNN
F 2 "Package_TO_SOT_SMD:SOT-23-6" H 6550 2575 50  0001 L CIN
F 3 "" H 6350 2650 50  0000 L CNN
	1    6350 2650
	-1   0    0    1   
$EndComp
Wire Wire Line
	6250 2450 6250 2150
Wire Wire Line
	6650 2400 6650 3300
Wire Wire Line
	7050 2150 7050 2800
Wire Wire Line
	6250 3000 6250 3350
Wire Wire Line
	8400 1450 8850 1450
Wire Wire Line
	1700 2400 2550 2400
Wire Wire Line
	3750 2400 4600 2400
Text Label 2150 1100 0    60   ~ 0
P3V3
Wire Wire Line
	2550 1100 2150 1100
Wire Wire Line
	3750 1100 4600 1100
Wire Wire Line
	3750 1200 4600 1200
$Comp
L power:+5V #PWR?
U 1 1 5D456176
P 5800 2050
AR Path="/5D456176" Ref="#PWR?"  Part="1" 
AR Path="/5D3FF622/5D456176" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 1900 50  0001 C CNN
F 1 "+5V" H 5815 2223 50  0000 C CNN
F 2 "" H 5800 2050 50  0001 C CNN
F 3 "" H 5800 2050 50  0001 C CNN
	1    5800 2050
	1    0    0    -1  
$EndComp
Wire Wire Line
	5800 2050 5800 2150
Text Label 8400 1450 0    60   ~ 0
P5V_HAT
$Comp
L Device:R_Small R8
U 1 1 5D446218
P 2600 4800
F 0 "R8" H 2659 4846 50  0000 L CNN
F 1 "10K" H 2659 4755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 2600 4800 50  0001 C CNN
F 3 "~" H 2600 4800 50  0001 C CNN
	1    2600 4800
	1    0    0    -1  
$EndComp
$Comp
L Device:R_Small R9
U 1 1 5D4466F0
P 2900 4800
F 0 "R9" H 2959 4846 50  0000 L CNN
F 1 "10K" H 2959 4755 50  0000 L CNN
F 2 "Resistor_THT:R_Axial_DIN0207_L6.3mm_D2.5mm_P7.62mm_Horizontal" H 2900 4800 50  0001 C CNN
F 3 "~" H 2900 4800 50  0001 C CNN
	1    2900 4800
	1    0    0    -1  
$EndComp
Text Label 2150 1200 0    50   ~ 0
I2C_SDA
Text Label 2150 1300 0    50   ~ 0
I2C_SCL
Text HLabel 2200 5000 0    50   Input ~ 0
I2C_SDA
Text HLabel 2200 5100 0    50   Input ~ 0
I2C_SCL
Text Label 3500 5000 2    50   ~ 0
I2C_SDA
Text Label 3500 5100 2    50   ~ 0
I2C_SCL
$Comp
L power:+3V3 #PWR?
U 1 1 5D45791F
P 2600 4600
F 0 "#PWR?" H 2600 4450 50  0001 C CNN
F 1 "+3V3" H 2615 4773 50  0000 C CNN
F 2 "" H 2600 4600 50  0001 C CNN
F 3 "" H 2600 4600 50  0001 C CNN
	1    2600 4600
	1    0    0    -1  
$EndComp
$Comp
L power:+3V3 #PWR?
U 1 1 5D458996
P 2900 4600
F 0 "#PWR?" H 2900 4450 50  0001 C CNN
F 1 "+3V3" H 2915 4773 50  0000 C CNN
F 2 "" H 2900 4600 50  0001 C CNN
F 3 "" H 2900 4600 50  0001 C CNN
	1    2900 4600
	1    0    0    -1  
$EndComp
Wire Wire Line
	2600 4600 2600 4700
Wire Wire Line
	2900 4600 2900 4700
Wire Wire Line
	2200 5000 2600 5000
Wire Wire Line
	2200 5100 2900 5100
Wire Wire Line
	2600 4900 2600 5000
Connection ~ 2600 5000
Wire Wire Line
	2600 5000 3500 5000
Wire Wire Line
	2900 4900 2900 5100
Connection ~ 2900 5100
Wire Wire Line
	2900 5100 3500 5100
$EndSCHEMATC
