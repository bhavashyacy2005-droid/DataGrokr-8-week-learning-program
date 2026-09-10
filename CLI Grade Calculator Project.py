# CLI Grade Calculator

def calculate_grade(percentage):
    grades = {
        "A+": 90,
        "A": 80,
        "B": 70,
        "C": 60,
        "D": 50,
        "F": 0
    }

    for grade, minimum in grades.items():
        if percentage >= minimum:
            return grade


def calculate_result(marks):
    total = sum(marks)
    percentage = total / len(marks)
    grade = calculate_grade(percentage)

    if percentage >= 50:
        result = "PASS"
    else:
        result = "FAIL"

    return total, percentage, grade, result


def main():
    print("===== GRADE CALCULATOR =====")

    name = input("Enter student name: ")
    subjects = int(input("Enter number of subjects: "))

    marks = []

    for i in range(subjects):
        mark = float(input(f"Enter marks for Subject {i + 1}: "))

        while mark < 0 or mark > 100:
            print("Please enter marks between 0 and 100.")
            mark = float(input(f"Enter marks for Subject {i + 1}: "))

        marks.append(mark)

    total, percentage, grade, result = calculate_result(marks)

    print("\n===== RESULT =====")
    print("Student:", name)
    print("Total Marks:", total, "/", subjects * 100)
    print("Percentage:", percentage, "%")
    print("Grade:", grade)
    print("Result:", result)


main()