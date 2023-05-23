class Student:
    def __init__(self):
        self.name = input("Enter name:")
        self.usn = input("Enter usn:")
        self.age = int(input("Enter age:"))
        
    def sdetails(self):
        print("Name:", self.name)
        print("USN:", self.usn)

class mca(Student):
    def __init__(self):
        super().__init__()
        print("Name:", self.name)
        print("USN:", self.usn)
        print("Age:", self.age)

class College:
    def __init__(self):
        self.roll = int(input("Enter rollno:"))
        self.grade = input("Enter grade:")
    def cdetails(self):
        print("Rollno:", self.roll)
        print("Grade:", self.grade)


class MCAinfo(Student, College):
    def __init__(self):
        Student.__init__(self)
        College.__init__(self)
        self.address = input("Enter your address:")

    def alldetails(self):
        print("MCA student details-----")
        self.sdetails()
        self.cdetails()
        print("Address:", self.address)

# Single Inheritance Example
mc = mca()

print("Multiple inheritance ----------")
st = MCAinfo()
st.alldetails()
