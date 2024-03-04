table_headers = ["3.1.1", "3.1.2", "3.1.3", "3.1.4", "3.2.1", "3.2.2", "3.2.3", "3.2.4", "3.2.5", "3.3.1", "3.3.2", "3.3.3", "Всего", "Вес (\%)"]
table_values = ["1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "1", "12", "11"]

# Don't edit what's below
# Тем, кто захочет почитать код ниже: сори, это изначально был черновик, а потом мне было лень делать его нормальным. Можете почитать код для таблиц по органике









if(len(table_headers) != len(table_values)):
  print("Error: headers number doesn't equal to values number.")

begin = r"""\begin{table}[H]
\small"""

# closingLatex = r"\end{table}\end{document}"

closingCode = r"""
\end{table}"""

latex = r"\begin{tabularx}{\textwidth}{|"

for i in range(len(table_headers)):
    latex = latex + "X|"

latex = latex + r"}"


# The first row of the table
firstRow = ""

for i in range(len(table_headers)-1):
  firstRow = firstRow + r"\textbf{" + table_headers[i] + "} & "
firstRow  = firstRow + r"\textbf{" + table_headers[len(table_headers)-1] + r"} \\"


# The second row of the table
secondRow = ""

for i in range(len(table_values)-1):
    secondRow += str(table_values[i]) + " & "
secondRow += table_values[len(table_values)-1] + r" \\"


latex = latex + "\n" + r"\hline\rowcolor{gray!45}" + "\n" + firstRow + "\n" + r"\hline" + "\n" + secondRow + "\n" + r"\hline" + "\n" + "\end{tabularx}"


with open("problem-points-table.tex", 'w') as f:
    f.write(begin)
    f.write(latex)
    f.write(closingCode)

print("LaTeX document has been successfully generated.")