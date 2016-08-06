PLANTS = {
    'R': 'Radishes',
    'C': 'Clover',
    'G': 'Grass',
    'V': 'Violets'
}

STUDENTS = [ 'Alice', 'Bob', 'Charlie', 'David', 'Eve', 'Fred', 'Ginny',
             'Harriet', 'Ileana', 'Joseph', 'Kincaid', 'Larry']

class Garden():

    def __init__(self, garden, students=STUDENTS):
        self.garden = garden.split("\n")
        self.students = sorted(students)

    def plants(self, student):
        starting_plant = self.students.index(student) * 2
        students_plants = []
        for row in self.garden:
            students_plants.append(row[starting_plant])
            students_plants.append(row[starting_plant + 1 ])
        return [PLANTS[plant] for plant in students_plants]
