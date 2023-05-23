class ope:
    def __init__(self) -> None:
        self.l1 = []
    def accept(self, n):
        for i in range(0, n):
            e = int(input("Enter ele:"))
            self.l1.append(e)
        print("List:",self.l1)
    def __eq__(self, other):
        nlist = []
        for i in range(len(self.l1)):
            nlist.append(self.l1[i] == other.l1[i])
        print(nlist)
    def __lt__(self, other):
        nlist = []
        for i in range(len(self.l1)):
            nlist.append(self.l1[i] < other.l1[i])
        print(nlist)
    def __gt__(self, other):
        nlist = []
        for i in range(len(self.l1)):
            nlist.append(self.l1[i] > other.l1[i])
        print(nlist)
    def __mod__(self, other):
        nlist = []
        for i in range(len(self.l1)):
            nlist.append(self.l1[i] % other.l1[i])
        print(nlist)