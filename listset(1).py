while True:
    print("1. List\n2. Set\n3. Exit")
    choice = int(input("Enter your choice: "))
    while True:
        if choice == 1:
            print("1. Sum\n2. Any\n3. All\n4. Sorting\n5. Reverse")
            lis = list(map(int, input("Enter list: ").split()))
            while True:  
                ch = int(input("Enter your choice: "))
                if ch == 1:
                    print("Sum:", sum(lis))
                elif ch == 2:
                    print("Any:", any(lis))
                elif ch == 3:
                    print("All:", all(lis))
                elif ch == 4:
                    lis.sort()
                    print("Sorted:", lis)
                elif ch == 5:
                    lis.reverse()
                    print("Reversed list:", lis)
                else:
                    exit()

        elif choice == 2:
            print("1. Equality\n2. Inequality\n3. Issuperset\n4. Issubset\n5. Sum")
            set1 = set(map(int, input("Enter set1: ").split()))
            set2 = set(map(int, input("Enter set2: ").split()))
            while True:
                ch = int(input("Enter your choice: "))
                if ch == 1:
                    print("Equality:", set1 == set2)
                elif ch == 2:
                    print("Inequality:", set1 != set2)
                elif ch == 3:
                    print("Superset:", set1.issuperset(set2))
                elif ch == 4:
                    print("Subset:", set1.issubset(set2))
                elif ch == 5:
                    print("Sum:", sum(set1))
                else:
                    exit()

        else:
            break
