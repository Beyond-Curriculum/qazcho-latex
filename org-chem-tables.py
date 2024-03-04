# Names of the unknown compounds
compounds = ["I", "II", "III", "A", "B"]
file = "Solution" # Either "Solution" or "Blank"


# Don't edit what's below





if ((file != "Blank") and (file != "Solution")):
  print("Please rewrite the type of document you need this table for.")


begin = r"""\noindent
\begin{tabularx}{\textwidth}{|Y|Y|Y|}
\hline\rowcolor{gray!25}
"""
close = r"\end{tabularx}"


fullRows = int(len(compounds) / 3)
extracells = len(compounds) % 3

counter = 0
mainCode = ""

# Fill the rows that have 3 columns
while (counter < fullRows*3):
  if (counter+1) % 3 != 0:
    mainCode = mainCode + r"\textbf{" + compounds[counter] + "} & "
  else:
    mainCode = mainCode + r"\textbf{" + compounds[counter] + r"} \\" + "\n" + r"\hline" + "\n"

    if (file == "Blank"):
      mainCode += r"""\filler{2.5cm} & \filler{2.5cm} & \filler{2.5cm} \\
\hline\rowcolor{gray!25}
"""
    else:
      mainCode += r"""\chemcompound{} & \chemcompound{} & \chemcompound{} \\
\hline\rowcolor{gray!25}
"""
  
  counter += 1


# Fill the remaining row
while(counter < len(compounds)):
  if (extracells == 1):
    mainCode = mainCode + r"\textbf{" + compounds[counter] + r"} \\" + "\n" + r"\cline{1-1}" + "\n"

    if (file == "Blank"):
      mainCode += r"""\filler{2.5cm} \\
\cline{1-1}
"""
    else:
      mainCode += r"""\chemcompound{} \\
\cline{1-1}
"""

  else:
    if (counter+1) % 3 == 1:
      mainCode = mainCode + r"\textbf{" + compounds[counter] + "} & "
    else:
      mainCode = mainCode + r"\textbf{" + compounds[counter] + r"} \\" + "\n" + r"\cline{1-2}" + "\n"

      if (file == "Blank"):
        mainCode += r"""\filler{2.5cm} & \filler{2.5cm} \\
\cline{1-2}
"""
      else:
        mainCode += r"""\chemcompound{} & \chemcompound{} \\
\cline{1-2}
"""

  counter += 1

# print(fullRows, extracells, counter)

with open("org-chem-table.tex", "w") as f:
  f.write(begin)
  f.write(mainCode)
  f.write(close)

print("LaTeX code has been successfully created.")