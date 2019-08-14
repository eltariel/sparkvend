EESchema Schematic File Version 4
LIBS:sparkvend-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 4 4
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
L power:GNDD #PWR?
U 1 1 5D5814F4
P 3000 3150
AR Path="/5D5814F4" Ref="#PWR?"  Part="1" 
AR Path="/5D3FFD03/5D5814F4" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 3000 2900 50  0001 C CNN
F 1 "GNDD" H 3004 2995 50  0000 C CNN
F 2 "" H 3000 3150 50  0001 C CNN
F 3 "" H 3000 3150 50  0001 C CNN
	1    3000 3150
	1    0    0    -1  
$EndComp
Text Label 6250 2550 2    50   ~ 0
I2C0_SDA
Text Label 6250 2450 2    50   ~ 0
I2C0_SCL
Text HLabel 1250 5250 0    50   Input ~ 0
MASTER_IN
Text HLabel 1250 5350 0    50   Output ~ 0
MASTER_OUT
Text HLabel 1250 6250 0    50   BiDi ~ 0
I2C_SDA
Text HLabel 1250 6150 0    50   Input ~ 0
I2C_SCL
Text Label 1900 5250 2    50   ~ 0
MASTER_IN
Text Label 1900 5350 2    50   ~ 0
MASTER_OUT
Wire Wire Line
	1900 5250 1250 5250
Wire Wire Line
	1900 5350 1250 5350
Text Label 1900 6250 2    50   ~ 0
I2C0_SDA
Text Label 1900 6150 2    50   ~ 0
I2C0_SCL
Wire Wire Line
	1250 6150 1900 6150
Wire Wire Line
	1250 6250 1900 6250
Wire Wire Line
	6250 2450 5600 2450
Wire Wire Line
	6250 2550 5600 2550
Wire Wire Line
	1900 5650 1250 5650
Wire Wire Line
	1900 5550 1250 5550
Text Label 1900 5650 2    50   ~ 0
SLAVE_OUT
Text Label 1900 5550 2    50   ~ 0
SLAVE_IN
Text HLabel 1250 5650 0    50   Output ~ 0
SLAVE_OUT
Text HLabel 1250 5550 0    50   Input ~ 0
SLAVE_IN
$Comp
L power:+3V3 #PWR?
U 1 1 5D581535
P 5800 1850
AR Path="/5D581535" Ref="#PWR?"  Part="1" 
AR Path="/5D3FFD03/5D581535" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5800 1700 50  0001 C CNN
F 1 "+3V3" H 5815 2023 50  0000 C CNN
F 2 "" H 5800 1850 50  0001 C CNN
F 3 "" H 5800 1850 50  0001 C CNN
	1    5800 1850
	1    0    0    -1  
$EndComp
$Comp
L power:+5V #PWR?
U 1 1 5D58152F
P 5700 1650
AR Path="/5D58152F" Ref="#PWR?"  Part="1" 
AR Path="/5D3FFD03/5D58152F" Ref="#PWR?"  Part="1" 
F 0 "#PWR?" H 5700 1500 50  0001 C CNN
F 1 "+5V" H 5715 1823 50  0000 C CNN
F 2 "" H 5700 1650 50  0001 C CNN
F 3 "" H 5700 1650 50  0001 C CNN
	1    5700 1650
	1    0    0    -1  
$EndComp
$Comp
L sparkvend:teensy-3.x-common U?
U 1 1 5D5814C2
P 4350 2400
AR Path="/5D5814C2" Ref="U?"  Part="1" 
AR Path="/5D3FFD03/5D5814C2" Ref="U4"  Part="1" 
F 0 "U4" H 4350 3400 60  0000 C CNN
F 1 "Teensy3.2" H 4350 3250 60  0000 C CNN
F 2 "sparkvend:teensy-3.x-common" H 4350 3881 60  0001 C CNN
F 3 "" H 4350 1600 60  0000 C CNN
	1    4350 2400
	1    0    0    -1  
$EndComp
Text Label 2450 1950 0    50   ~ 0
MASTER_OUT
Wire Wire Line
	2450 1950 3100 1950
Wire Wire Line
	2450 1850 3100 1850
Text Label 2450 1850 0    50   ~ 0
MASTER_IN
Text Label 2450 2550 0    50   ~ 0
SLAVE_IN
Text Label 2450 2650 0    50   ~ 0
SLAVE_OUT
Wire Wire Line
	2450 2550 3100 2550
Wire Wire Line
	2450 2650 3100 2650
NoConn ~ 3100 3050
NoConn ~ 5600 1850
NoConn ~ 5600 3050
Wire Wire Line
	5700 1650 5700 1750
Wire Wire Line
	5700 1750 5600 1750
Wire Wire Line
	5600 1950 5800 1950
Wire Wire Line
	5800 1950 5800 1850
Wire Wire Line
	3000 3150 3000 1750
Wire Wire Line
	3000 1750 3100 1750
NoConn ~ 3100 2050
NoConn ~ 3100 2150
NoConn ~ 3100 2250
NoConn ~ 3100 2350
NoConn ~ 3100 2450
NoConn ~ 3100 2750
NoConn ~ 3100 2850
NoConn ~ 3100 2950
NoConn ~ 5600 2050
NoConn ~ 5600 2150
NoConn ~ 5600 2250
NoConn ~ 5600 2350
NoConn ~ 5600 2650
NoConn ~ 5600 2750
NoConn ~ 5600 2850
NoConn ~ 5600 2950
$EndSCHEMATC
