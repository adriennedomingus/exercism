class School():
    def __init__(self, name):
        self.name = name
        self.students = {}

    def grade(self, grade):
        if grade in self.students.keys():
            return self.students[grade]
        return []

    def add(self, student, grade):
        if grade in self.students.keys():
            self.students[grade].append(student)
        else:
             self.students[grade] = [student]

    def sort(self):
        sorted_school = {}
        for grade in sorted(self.students.keys()):
            sorted_school[grade] = None
        for key, value in self.students.iteritems():
            sorted_school[key] = tuple(sorted(self.students[key]))
        return sorted_school
