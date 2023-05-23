from magic import *
n = int(input("Enter list length:"))
ob1 = ope()
ob1.accept(n)
ob2 = ope()
ob2.accept(n)
while True:
    print("1.Compare equality \n 2.Compare less than \n 3.Compare Greater than \n 4.check modulus \n 0.exit")
    ch = int(input("Enter ur choice:"))
    if ch == 1:
        ob1 == ob2
    elif ch == 2:
        ob1 < ob2
    elif ch == 3:
        ob1 > ob2
    elif ch == 4:
        ob1 % ob2
    else:
        exit()