︠89236b35-15a9-4d72-b6d7-9dad038f8acbs︠

from sage.geometry.polyhedron.constructor import Polyhedron

def generate_k_fibonacci_words_vectors(k, n):
    """
    Generate all k-generalized Fibonacci words of length n and their corresponding vectors.
    """
    if n == 0:
        return [], []

    vectors = []
    words = []

    def backtrack(word):
        if len(word) == n:
            vector = tuple(int(char) for char in word)
            vectors.append(vector[1:])  # Append vector excluding the first entry
            words.append(word)  # Append the generated word
            return

        if len(word) == 0:
            candidates = [str(k)]
        else:
            last_char = int(word[-1])
            if last_char == k:
                candidates = [str(k), str(k-1)]
            elif last_char == 1:
                candidates = [str(k)]
            else:
                candidates = [str(last_char - 1), str(k)]

        for c in candidates:
            backtrack(word + c)

    backtrack('')
    return vectors, words

def display_results(k, n, vectors, words):
    """
    Display results in an organized and aesthetically pleasing manner.
    """
    if not vectors:  # Ensure vectors are not empty
        print(f"\nNo vectors generated for k={k}, n={n}")
        return

    # Create a polyhedron from the vectors
    try:
        P = Polyhedron(vertices=vectors)
    except Exception as e:
        print(f"\nError creating polyhedron for k={k}, n={n}: {e}")
        return

    # Compute the volume of the polyhedron and the f-vector
    try:
        volume = P.volume()  # This is a Rational number
        f_vector = P.f_vector()
    except Exception as e:
        print(f"\nError computing properties for k={k}, n={n}: {e}")
        return

    # Display results
    print(f"\nGenerated Fibonacci Words and Vectors for k={k}, n={n}:")
    print("-" * 50)
    
    print(f"{'Word':<20} {'Vector':<40}")
    print("-" * 60)
    for word, vector in zip(words, vectors):
        print(f"{word:<20} {vector}")

    print("-" * 50)
    print(f"\nVolume of the polyhedron (as a rational number): {volume}")
    print(f"f-vector (Number of faces by dimension): {f_vector}")
    
    # Plot the polyhedron
    if n <= 6:  # Avoid plotting for large values to prevent errors
        try:
            polytope_plot = P.plot()
            print("\nPlotting the polyhedron...")
            polytope_plot.show()
        except Exception as e:
            print(f"\nError plotting polyhedron for k={k}, n={n}: {e}")
    else:
        print("\nPlotting is skipped for large dimensions to avoid errors.")

# Prompt the user to enter specific values for k and n
try:
    k = int(input("Enter the value for k: "))
    n = int(input("Enter the value for n: "))
    
    if k < 1 or n < 1:
        raise ValueError("k and n must be positive integers.")
except ValueError as e:
    print(f"Invalid input: {e}")
else:
    vectors, words = generate_k_fibonacci_words_vectors(k, n)
    display_results(k, n, vectors, words)
︡bd1b7ddd-d6bc-45d8-936f-36f479d7689a︡{"raw_input":{"prompt":"Enter the value for k: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the value for k: ","submitted":true,"value":"4"}}︡{"raw_input":{"prompt":"Enter the value for n: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the value for n: ","submitted":true,"value":"3"}}︡{"stdout":"\nGenerated Fibonacci Words and Vectors for k=4, n=2:"}︡{"stdout":"\n--------------------------------------------------\nWord                 Vector                                  \n------------------------------------------------------------\n44                   (4,)\n43                   (3,)\n--------------------------------------------------\n\nVolume of the polyhedron (as a rational number): 1\nf-vector (Number of faces by dimension): (1, 2, 1)\n\nPlotting the polyhedron...\n"}︡{"file":{"filename":"/tmp/tmpk4izn18t/tmp_p6sdko16.svg","show":true,"text":null,"uuid":"b5d11ef0-97d6-46d1-9198-9ae0bf21f635"},"once":false}︡{"done":true}
︠1c98e8ac-7047-420f-9b42-1e204db866c6︠

︡b6645481-63fc-48df-9cf3-ac08d82911f3︡
︠0f9ea295-c4e5-487e-ac41-8a51687dad84s︠
# Example polyhedron and viewpoint
P = Polyhedron(vertices=[[3,3,3],[3,3,2],[3,2,1],[3,2,3],[2,1,3],[2,3,3],[2,3,2]])
P.show(aspect_ratio=1)

# Adjust these values based on your desired view
viewpoint = [4, 4, 4]
angle = 80

# Generate TikZ code
Img = P.tikz(viewpoint, angle)
print(Img)

︡c02e66aa-2739-4ed9-85e9-06d31ba97cd0︡{"file":{"filename":"441e2f4d-a441-4601-800d-0583a78de5ea.sage3d","uuid":"441e2f4d-a441-4601-800d-0583a78de5ea"}}︡{"stderr":"/ext/sage/10.4/local/var/lib/sage/venv-python3.12.4/lib/python3.12/site-packages/scikits/__init__.py:1: DeprecationWarning: pkg_resources is deprecated as an API. See https://setuptools.pypa.io/en/latest/pkg_resources.html\n  __import__(\"pkg_resources\").declare_namespace(__name__)\n"}︡{"stderr":"/ext/sage/10.4/local/var/lib/sage/venv-python3.12.4/lib/python3.12/site-packages/scikits/__init__.py:1: DeprecationWarning: Deprecated call to `pkg_resources.declare_namespace('scikits')`.\nImplementing implicit namespace packages (as specified in PEP 420) is preferred to `pkg_resources.declare_namespace`. See https://setuptools.pypa.io/en/latest/references/keywords.html#keyword-namespace-packages\n  __import__(\"pkg_resources\").declare_namespace(__name__)\n"}︡{"stderr":"/ext/sage/10.4/src/sage/geometry/polyhedron/base6.py:616: DeprecationWarning: The default type of the returned object will soon be changed from `sage.misc.latex.LatexExpr` to `sage.misc.latex_standalone.TikzPicture`.  Please update your code to specify the desired output type as `.tikz(output_type='LatexExpr')` to keep the old behavior or `.tikz(output_type='TikzPicture')` to use the future default behavior.\nSee https://github.com/sagemath/sage/issues/33002 for details.\n  return self.projection().tikz(view, angle, scale,\n"}︡{"stdout":"\\begin{tikzpicture}%\n\t[x={(0.449099cm, 0.844030cm)},\n\ty={(-0.293128cm, 0.449099cm)},\n\tz={(0.844030cm, -0.293128cm)},\n\tscale=1.000000,\n\tback/.style={loosely dotted, thin},\n\tedge/.style={color=blue!95!black, thick},\n\tfacet/.style={fill=blue!95!black,fill opacity=0.800000},\n\tvertex/.style={inner sep=1pt,circle,draw=green!25!black,fill=green!75!black,thick}]\n%\n%\n%% This TikZ-picture was produced with Sagemath version 10.4\n%% with the command: ._tikz_3d_in_3d and parameters:\n%% view = [4, 4, 4]\n%% angle = 80\n%% scale = 1\n%% edge_color = blue!95!black\n%% facet_color = blue!95!black\n%% opacity = 0.8\n%% vertex_color = green\n%% axis = False\n%%\n%% Coordinate of the vertices:\n%%\n\\coordinate (2.00000, 1.00000, 3.00000) at (2.00000, 1.00000, 3.00000);\n\\coordinate (2.00000, 3.00000, 2.00000) at (2.00000, 3.00000, 2.00000);\n\\coordinate (2.00000, 3.00000, 3.00000) at (2.00000, 3.00000, 3.00000);\n\\coordinate (3.00000, 2.00000, 1.00000) at (3.00000, 2.00000, 1.00000);\n\\coordinate (3.00000, 2.00000, 3.00000) at (3.00000, 2.00000, 3.00000);\n\\coordinate (3.00000, 3.00000, 2.00000) at (3.00000, 3.00000, 2.00000);\n\\coordinate (3.00000, 3.00000, 3.00000) at (3.00000, 3.00000, 3.00000);\n%%\n%%\n%% Drawing edges in the back\n%%\n\\draw[edge,back] (2.00000, 1.00000, 3.00000) -- (3.00000, 2.00000, 1.00000);\n\\draw[edge,back] (3.00000, 2.00000, 1.00000) -- (3.00000, 2.00000, 3.00000);\n%%\n%%\n%% Drawing vertices in the back\n%%\n%%\n%%\n%% Drawing the facets\n%%\n\\fill[facet] (3.00000, 3.00000, 3.00000) -- (2.00000, 3.00000, 3.00000) -- (2.00000, 1.00000, 3.00000) -- (3.00000, 2.00000, 3.00000) -- cycle {};\n\\fill[facet] (3.00000, 3.00000, 3.00000) -- (2.00000, 3.00000, 3.00000) -- (2.00000, 3.00000, 2.00000) -- (3.00000, 3.00000, 2.00000) -- cycle {};\n\\fill[facet] (2.00000, 3.00000, 3.00000) -- (2.00000, 1.00000, 3.00000) -- (2.00000, 3.00000, 2.00000) -- cycle {};\n\\fill[facet] (3.00000, 3.00000, 2.00000) -- (2.00000, 3.00000, 2.00000) -- (3.00000, 2.00000, 1.00000) -- cycle {};\n%%\n%%\n%% Drawing edges in the front\n%%\n\\draw[edge] (2.00000, 1.00000, 3.00000) -- (2.00000, 3.00000, 2.00000);\n\\draw[edge] (2.00000, 1.00000, 3.00000) -- (2.00000, 3.00000, 3.00000);\n\\draw[edge] (2.00000, 1.00000, 3.00000) -- (3.00000, 2.00000, 3.00000);\n\\draw[edge] (2.00000, 3.00000, 2.00000) -- (2.00000, 3.00000, 3.00000);\n\\draw[edge] (2.00000, 3.00000, 2.00000) -- (3.00000, 2.00000, 1.00000);\n\\draw[edge] (2.00000, 3.00000, 2.00000) -- (3.00000, 3.00000, 2.00000);\n\\draw[edge] (2.00000, 3.00000, 3.00000) -- (3.00000, 3.00000, 3.00000);\n\\draw[edge] (3.00000, 2.00000, 1.00000) -- (3.00000, 3.00000, 2.00000);\n\\draw[edge] (3.00000, 2.00000, 3.00000) -- (3.00000, 3.00000, 3.00000);\n\\draw[edge] (3.00000, 3.00000, 2.00000) -- (3.00000, 3.00000, 3.00000);\n%%\n%%\n%% Drawing the vertices in the front\n%%\n\\node[vertex] at (2.00000, 1.00000, 3.00000)     {};\n\\node[vertex] at (2.00000, 3.00000, 2.00000)     {};\n\\node[vertex] at (2.00000, 3.00000, 3.00000)     {};\n\\node[vertex] at (3.00000, 2.00000, 1.00000)     {};\n\\node[vertex] at (3.00000, 2.00000, 3.00000)     {};\n\\node[vertex] at (3.00000, 3.00000, 2.00000)     {};\n\\node[vertex] at (3.00000, 3.00000, 3.00000)     {};\n%%\n%%\n\\end{tikzpicture}\n"}︡{"done":true}
︠25545bc8-e892-41a0-8c40-fa5b718cfb33s︠
from sage.all import *

# Define the vertices of the polytope
vertices = [(4,4,4), (4,4,3), (4,3,2), (4,3,4), (3,2,1), (3,2,4), (3,4,4), (3,4,3)]

# Create the polytope
P = Polyhedron(vertices=vertices)

# Compute the Ehrhart polynomial
ehrhart_poly = P.ehrhart_polynomial()

# Display the result
ehrhart_poly
# 
︡539ab541-a865-42ca-9e79-019cf1c1608c︡{"stdout":"8/3*t^3 + 6*t^2 + 13/3*t + 1\n"}︡{"done":true}
︠249f2400-da5a-435b-b5d2-b32ffeb403fcs︠
from sage.geometry.polyhedron.constructor import Polyhedron

def generate_k_fibonacci_words_vectors(k, n):
    """
    Generate all k-generalized Fibonacci words of length n and their corresponding vectors.
    """
    if n == 0:
        return [], []

    vectors = []
    words = []

    def backtrack(word):
        if len(word) == n:
            vector = tuple(int(char) for char in word)
            vectors.append(vector[1:])  # Append vector excluding the first entry
            words.append(word)  # Append the generated word
            return

        if len(word) == 0:
            candidates = [str(k)]
        else:
            last_char = int(word[-1])
            if last_char == k:
                candidates = [str(k), str(k-1)]
            elif last_char == 1:
                candidates = [str(k)]
            else:
                candidates = [str(last_char - 1), str(k)]

        for c in candidates:
            backtrack(word + c)

    backtrack('')
    return vectors, words

def calculate_ehrhart_polynomials(k_values, n_values):
    """
    Calculate the Ehrhart polynomials for a range of k and n values and return them as a table.
    """
    table = [["k", "n", "Ehrhart Polynomial", "Factorized Ehrhart Polynomial"]]

    for k in k_values:
        for n in n_values:
            vectors, _ = generate_k_fibonacci_words_vectors(k, n)
            if vectors:
                P = Polyhedron(vertices=vectors)
                ehrhart_poly = P.ehrhart_polynomial()
                factorized_ehrhart_poly = ehrhart_poly.factor()
                table.append([k, n, str(ehrhart_poly), str(factorized_ehrhart_poly)])
            else:
                table.append([k, n, "No polytope (no vectors)", "N/A"])

    return table

def display_latex_table(table):
    """
    Display the table of Ehrhart polynomials in LaTeX format, including only k, n, and the factored Ehrhart polynomial.
    """
    print(r"\begin{table}[h]")
    print(r"\centering")
    print(r"\begin{tabular}{|c|c|l|}")
    print(r"\hline")
    print(r"\textbf{k} & \textbf{n} & \textbf{Factorized Ehrhart Polynomial} \\")
    print(r"\hline")
    
    for row in table[1:]:  # Skip header row
        k, n, _, factorized_ehrhart_poly = row
        print(f"{k} & {n} & {factorized_ehrhart_poly} \\\\")
        print(r"\hline")

    print(r"\end{tabular}")
    print(r"\caption{Factorized Ehrhart polynomials for different values of \( k \) and \( n \).}")
    print(r"\label{tab:factored_ehrhart_polynomials}")
    print(r"\end{table}")

# Specify the ranges for k and n
k_values = range(2, 9)  # You can modify this range as needed
n_values = range(2, 8)  # You can modify this range as needed

# Generate the table with Ehrhart polynomials and their factorizations
ehrhart_table = calculate_ehrhart_polynomials(k_values, n_values)

# Display the table in LaTeX format
display_latex_table(ehrhart_table)

︡84fde093-b0f3-493e-9419-093f95b910cd︡{"stdout":"\\begin{table}[h]\n\\centering\n\\begin{tabular}{|c|c|l|}\n\\hline\n\\textbf{k} & \\textbf{n} & \\textbf{Factorized Ehrhart Polynomial} \\\\\n\\hline\n2 & 2 & t + 1 \\\\\n\\hline\n2 & 3 & (1/2) * (t + 1) * (t + 2) \\\\\n\\hline\n2 & 4 & (1/3) * (t + 1) * (t + 3/2) * (t + 2) \\\\\n\\hline\n2 & 5 & (5/24) * (t + 1) * (t + 2) * (t^2 + 3*t + 12/5) \\\\\n\\hline\n2 & 6 & (2/15) * (t + 1) * (t + 3/2) * (t + 2) * (t^2 + 3*t + 5/2) \\\\\n\\hline\n2 & 7 & (61/720) * (t + 1) * (t + 2) * (t^4 + 6*t^3 + 845/61*t^2 + 888/61*t + 360/61) \\\\\n\\hline\n3 & 2 & t + 1 \\\\\n\\hline\n3 & 3 & (3/2) * (t + 2/3) * (t + 1) \\\\\n\\hline\n3 & 4 & (5/3) * (t + 1) * (t^2 + 11/10*t + 3/5) \\\\\n\\hline\n3 & 5 & (25/12) * (t + 1) * (t^3 + 41/25*t^2 + 6/5*t + 12/25) \\\\\n\\hline\n3 & 6 & (53/20) * (t + 1) * (t^4 + 697/318*t^3 + 683/318*t^2 + 67/53*t + 20/53) \\\\\n\\hline\n3 & 7 & (119/36) * (t + 1) * (t^5 + 3253/1190*t^4 + 118/35*t^3 + 2963/1190*t^2 + 681/595*t + 36/119) \\\\\n\\hline\n4 & 2 & t + 1 \\\\\n\\hline\n4 & 3 & (3/2) * (t + 2/3) * (t + 1) \\\\\n\\hline\n4 & 4 & (8/3) * (t + 1/2) * (t + 3/4) * (t + 1) \\\\\n\\hline\n4 & 5 & (101/24) * (t + 1) * (t^3 + 153/101*t^2 + 82/101*t + 24/101) \\\\\n\\hline\n4 & 6 & (104/15) * (t + 1) * (t^4 + 387/208*t^3 + 18/13*t^2 + 137/208*t + 15/104) \\\\\n\\hline\n4 & 7 & (927/80) * (t + 1) * (t^5 + 2092/927*t^4 + 5849/2781*t^3 + 1162/927*t^2 + 1408/2781*t + 80/927) \\\\\n\\hline\n5 & 2 & t + 1 \\\\\n\\hline\n5 & 3 & (3/2) * (t + 2/3) * (t + 1) \\\\\n\\hline\n5 & 4 & (8/3) * (t + 1/2) * (t + 3/4) * (t + 1) \\\\\n\\hline\n5 & 5 & (125/24) * (t + 2/5) * (t + 3/5) * (t + 4/5) * (t + 1) \\\\\n\\hline\n5 & 6 & (49/5) * (t + 1) * (t^4 + 44/21*t^3 + 31/21*t^2 + 47/98*t + 5/49) \\\\\n\\hline\n5 & 7 & (13517/720) * (t + 1) * (t^5 + 32764/13517*t^4 + 28801/13517*t^3 + 13334/13517*t^2 + 4464/13517*t + 720/13517) \\\\\n\\hline\n6 & 2 & t + 1 \\\\\n\\hline\n6 & 3 & (3/2) * (t + 2/3) * (t + 1) \\\\\n\\hline\n6 & 4 & (8/3) * (t + 1/2) * (t + 3/4) * (t + 1) \\\\\n\\hline\n6 & 5 & (125/24) * (t + 2/5) * (t + 3/5) * (t + 4/5) * (t + 1) \\\\\n\\hline\n6 & 6 & (54/5) * (t + 1/3) * (t + 1/2) * (t + 2/3) * (t + 5/6) * (t + 1) \\\\\n\\hline\n6 & 7 & (16087/720) * (t + 1) * (t^5 + 43484/16087*t^4 + 43151/16087*t^3 + 19654/16087*t^2 + 5064/16087*t + 720/16087) \\\\\n\\hline\n7 & 2 & t + 1 \\\\\n\\hline\n7 & 3 & (3/2) * (t + 2/3) * (t + 1) \\\\\n\\hline\n7 & 4 & (8/3) * (t + 1/2) * (t + 3/4) * (t + 1) \\\\\n\\hline\n7 & 5 & (125/24) * (t + 2/5) * (t + 3/5) * (t + 4/5) * (t + 1) \\\\\n\\hline\n7 & 6 & (54/5) * (t + 1/3) * (t + 1/2) * (t + 2/3) * (t + 5/6) * (t + 1) \\\\\n\\hline\n7 & 7 & (16807/720) * (t + 2/7) * (t + 3/7) * (t + 4/7) * (t + 5/7) * (t + 6/7) * (t + 1) \\\\\n\\hline\n8 & 2 & t + 1 \\\\\n\\hline\n8 & 3 & (3/2) * (t + 2/3) * (t + 1) \\\\\n\\hline\n8 & 4 & (8/3) * (t + 1/2) * (t + 3/4) * (t + 1) \\\\\n\\hline\n8 & 5 & (125/24) * (t + 2/5) * (t + 3/5) * (t + 4/5) * (t + 1) \\\\\n\\hline\n8 & 6 & (54/5) * (t + 1/3) * (t + 1/2) * (t + 2/3) * (t + 5/6) * (t + 1) \\\\\n\\hline\n8 & 7 & (16807/720) * (t + 2/7) * (t + 3/7) * (t + 4/7) * (t + 5/7) * (t + 6/7) * (t + 1) \\\\\n\\hline\n\\end{tabular}\n\\caption{Factorized Ehrhart polynomials for different values of \\( k \\) and \\( n \\).}\n\\label{tab:factored_ehrhart_polynomials}\n\\end{table}\n"}︡{"done":true}
︠ae23d14f-63f8-4882-9074-24cdfd236104︠









