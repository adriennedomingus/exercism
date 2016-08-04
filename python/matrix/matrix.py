class Matrix():
    def __init__(self, string):
        self.rows = self.to_rows(string)
        self.columns = self.to_columns(string)

    def to_rows(self, string):
        rows = string.split("\n")
        individual = map(lambda x: x.split(" "), rows)
        return [[int(num) for num in row] for row in individual]

    def to_columns(self, string):
        rows = self.to_rows(string)
        columns = []
        while len(columns) < len(rows[0]):
            columns.append([])
        for row in rows:
            for index, number in enumerate(row):
                columns[index].append(number)
        return columns
