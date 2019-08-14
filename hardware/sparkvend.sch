EESchema Schematic File Version 4
LIBS:sparkvend-cache
EELAYER 29 0
EELAYER END
$Descr A4 11693 8268
encoding utf-8
Sheet 1 4
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
L Graphic:Logo_Open_Hardware_Small LOGO3
U 1 1 5D799637
P 10700 6850
F 0 "LOGO3" H 10700 7350 50  0001 C CNN
F 1 "OSHW Logo goes here" H 10700 6650 50  0000 C CNN
F 2 "Symbol:OSHW-Logo2_7.3x6mm_SilkScreen" H 10700 6850 50  0001 C CNN
F 3 "~" H 10700 6850 50  0001 C CNN
	1    10700 6850
	1    0    0    -1  
$EndComp
$Sheet
S 3000 2500 1000 1000
U 5D3FEF32
F0 "mdb_interface" 50
F1 "mdb_interface.sch" 50
F2 "SLAVE_IN" O R 4000 2900 50 
F3 "SLAVE_OUT" I R 4000 3000 50 
F4 "MASTER_IN" O R 4000 2600 50 
F5 "MASTER_OUT" I R 4000 2700 50 
$EndSheet
$Sheet
S 6000 2500 1000 1000
U 5D3FF622
F0 "host_interface" 50
F1 "host_interface.sch" 50
F2 "I2C_SDA" B L 6000 2600 50 
F3 "I2C_SCL" I L 6000 2700 50 
$EndSheet
$Sheet
S 4500 2500 1000 1000
U 5D3FFD03
F0 "teensy_connections" 50
F1 "teensy_connections.sch" 50
F2 "MASTER_IN" I L 4500 2600 50 
F3 "MASTER_OUT" O L 4500 2700 50 
F4 "SLAVE_IN" I L 4500 2900 50 
F5 "SLAVE_OUT" O L 4500 3000 50 
F6 "I2C_SDA" B R 5500 2600 50 
F7 "I2C_SCL" I R 5500 2700 50 
$EndSheet
Wire Wire Line
	4000 2600 4500 2600
Wire Wire Line
	4000 2700 4500 2700
Wire Wire Line
	4000 2900 4500 2900
Wire Wire Line
	4000 3000 4500 3000
$Comp
L Mechanical:MountingHole H1
U 1 1 5D6080B7
P 3400 5150
F 0 "H1" H 3500 5196 50  0000 L CNN
F 1 "MountingHole" H 3500 5105 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3400 5150 50  0001 C CNN
F 3 "~" H 3400 5150 50  0001 C CNN
	1    3400 5150
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H2
U 1 1 5D60936E
P 3400 5350
F 0 "H2" H 3500 5396 50  0000 L CNN
F 1 "MountingHole" H 3500 5305 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3400 5350 50  0001 C CNN
F 3 "~" H 3400 5350 50  0001 C CNN
	1    3400 5350
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H3
U 1 1 5D609496
P 3400 5550
F 0 "H3" H 3500 5596 50  0000 L CNN
F 1 "MountingHole" H 3500 5505 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3400 5550 50  0001 C CNN
F 3 "~" H 3400 5550 50  0001 C CNN
	1    3400 5550
	1    0    0    -1  
$EndComp
$Comp
L Mechanical:MountingHole H4
U 1 1 5D6096A8
P 3400 5750
F 0 "H4" H 3500 5796 50  0000 L CNN
F 1 "MountingHole" H 3500 5705 50  0000 L CNN
F 2 "MountingHole:MountingHole_2.7mm_M2.5" H 3400 5750 50  0001 C CNN
F 3 "~" H 3400 5750 50  0001 C CNN
	1    3400 5750
	1    0    0    -1  
$EndComp
$Comp
L ellie:sparkcc-logo LOGO1
U 1 1 5D3FAA13
P 7300 6850
F 0 "LOGO1" H 7300 6850 50  0001 C CNN
F 1 "SparkCC logo" H 7750 6850 50  0000 C CNN
F 2 "ellie:SPARKCC_LOGO" H 7300 6850 50  0001 C CNN
F 3 "" H 7300 6850 50  0001 C CNN
	1    7300 6850
	1    0    0    -1  
$EndComp
Wire Wire Line
	5500 2700 6000 2700
Wire Wire Line
	5500 2600 6000 2600
$EndSCHEMATC
