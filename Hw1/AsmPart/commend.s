#Ahmet ÖZYILMAZ 111044014 Homework 1 Part 1 (ASM)
# // Parse edilecek 
# //Operatör tespit edilcek
# // aritmatik işlem yapılacak 
#a. input string şeklinde tek seferde okunacaktır. “2.5 + 3.72” örnekteki gibi
#operandın önce ve sonrasında 1 tane boşluk olacaktır.
#b. input parsing yapmayanlardan 20 puan kesilecektir. Bu kısım için Input alma
#şeklii; konsoldan 2 integer değer okuma, 1 karakter okuma ve 2 integer değer
#okuma şeklinde olacaktır.
#c. çözümün tamamı tek bir assembly dosyasında olmalıdır.

# Start .text segment (program code)



#   $8 == return size func
#   $9 == used as array index adress
#   $10 == computetion
#   $11 == return size func
#	$13 == ilk sayı float size
#	$14 == ikinci sayı decimal size
#	$15 == ikinci sayı float size
#	$16 == eğer 1. sayı negatifse  1 pozitifse 0
#	$17 == eğer 2. sayı negatifse  1 pozitifse 0
#	$18 == is digit se 1 değilse 0 olucak
#	$19 ==  temp counter 
#start main


# Print first elemen input
 	 #	add $9,$9,1
   	#lb $8, 0($9)
    #li  $v0,11      # print elemen in array 
    #move  $a0, $8
    #syscall