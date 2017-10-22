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


la $a0, buffer  # reload byte space to primary address
    move $a0
    la $a0, str2    # load and print "you wrote" string
    li $v0, 4
    syscall, $t0   # primary address = t0 address (load pointer)
    li $v0, 4       # print string
    syscall

