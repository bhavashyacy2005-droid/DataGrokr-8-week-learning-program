# CLI Grade Calculator

This is a simple **Command Line Grade Calculator** made using Python.
The project takes the student's name and marks for each subject, then calculates the total marks, percentage, grade, and pass/fail result.

## Features

* Takes the student's name as input
* Allows the user to enter marks for multiple subjects
* Calculates total marks
* Calculates percentage
* Assigns a grade based on the percentage
* Shows whether the student has passed or failed
* Checks that marks are between 0 and 100

## Grade System

| Percentage | Grade |
| ---------- | ----- |
| 90 - 100   | A+    |
| 80 - 89    | A     |
| 70 - 79    | B     |
| 60 - 69    | C     |
| 50 - 59    | D     |
| Below 50   | F     |

## Python Concepts Used

This project was created using basic Python concepts that I learned in Week 1:

* Functions
* For loops
* While loops
* Dictionaries
* Lists
* If-else conditions
* User input and output
* Basic calculations

## How to Run

1. Make sure Python is installed on your computer.
2. Download or clone this repository.
3. Open the project folder in the terminal.
4. Run the following command:

```bash
python grade_calculator.py
```

## Sample Output

```text
===== GRADE CALCULATOR =====

Enter student name: Bhavashya
Enter number of subjects: 5

Enter marks for Subject 1: 85
Enter marks for Subject 2: 72
Enter marks for Subject 3: 91
Enter marks for Subject 4: 68
Enter marks for Subject 5: 79

===== RESULT =====
Student: Bhavashya
Total Marks: 395.0 / 500
Percentage: 79.0 %
Grade: B
Result: PASS
```

## Project Structure

```text
GradeCalculator/
│
├── grade_calculator.py
└── README.md
```

## About the Project

I created this project as part of my **Week 1 Python Mini Project** to practice the basic concepts of Python by building a small application that can be used from the command line.

