while True:
    print("1.String \n 2.Tuple \ 3.Exit")
    choice = int(input("Enter ur choice"))
    while True:
        if choice == 1:
            print("1.IsAlphanum \n 2.Isdigit \n 3.Sorting \n 4.Join \n 5.istitle")
            str = input("Enter a string")
            while True:
                ch = int(input("Enter ur choice"))
                if ch == 1:
                    print("Is alphanum:",str.isalnum())
                elif ch == 2:
                    print("Is digit:",str.isdigit())
                elif ch == 3:
                    print("Sorted string:",sorted(str))
                elif ch == 4:
                    s2 = input("Enter another string:")
                    print(str.join(s2))
                elif ch == 5:
                    print("Check title:",str.istitle())
                else:
                    exit()
        elif choice == 2:
            print("1.Sum \n 2.Sorted \n 3.All \n 4.Index position \n 5.Tuple repetition")
            tup = (4, 5, 7, 1, 8)
            while True:
                ch = int(input("Enter ur choice:"))
                if ch == 1:
                    print("Sum:",sum(tup))
                elif ch == 2:
                    print("Sorted tuple:", sorted(tup))
                elif ch == 3:
                    print("All",all(tup))
                elif ch == 4:
                    ele = int(input("Enter element:"))
                    print("Position is:",tup.index(ele))
                elif ch == 5:
                    n = int(input("Enter repetition times:"))
                    print(tup * n)
                else:
                    exit()
        else:
            exit()