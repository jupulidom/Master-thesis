︠d7998df7-cd89-4f32-a3db-0349a3afe9ebs︠
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

def display_table(table):
    """
    Display the table of Ehrhart polynomials and their factorizations in a readable format.
    """
    for row in table:
        print(f"{row[0]:<5} {row[1]:<5} {row[2]:<40} {row[3]}")

# Specify the ranges for k and n
k_values = range(2, 9)  # You can modify this range as needed
n_values = range(2, 8)  # You can modify this range as needed

# Generate the table with Ehrhart polynomials and their factorizations
ehrhart_table = calculate_ehrhart_polynomials(k_values, n_values)

# Display the table
display_table(ehrhart_table)


︡8189f81d-0170-44e1-8e18-fcbd91b157b6︡{"stdout":"k     n     Ehrhart Polynomial                       Factorized Ehrhart Polynomial\n2     2     t + 1                                    t + 1\n2     3     1/2*t^2 + 3/2*t + 1                      (1/2) * (t + 1) * (t + 2)\n2     4     1/3*t^3 + 3/2*t^2 + 13/6*t + 1           (1/3) * (t + 1) * (t + 3/2) * (t + 2)\n2     5     5/24*t^4 + 5/4*t^3 + 67/24*t^2 + 11/4*t + 1 (5/24) * (t + 1) * (t + 2) * (t^2 + 3*t + 12/5)\n2     6     2/15*t^5 + t^4 + 3*t^3 + 9/2*t^2 + 101/30*t + 1 (2/15) * (t + 1) * (t + 3/2) * (t + 2) * (t^2 + 3*t + 5/2)\n2     7     61/720*t^6 + 61/80*t^5 + 413/144*t^4 + 277/48*t^3 + 2357/360*t^2 + 119/30*t + 1 (61/720) * (t + 1) * (t + 2) * (t^4 + 6*t^3 + 845/61*t^2 + 888/61*t + 360/61)\n3     2     t + 1                                    t + 1\n3     3     3/2*t^2 + 5/2*t + 1                      (3/2) * (t + 2/3) * (t + 1)\n3     4     5/3*t^3 + 7/2*t^2 + 17/6*t + 1           (5/3) * (t + 1) * (t^2 + 11/10*t + 3/5)\n3     5     25/12*t^4 + 11/2*t^3 + 71/12*t^2 + 7/2*t + 1 (25/12) * (t + 1) * (t^3 + 41/25*t^2 + 6/5*t + 12/25)\n3     6     53/20*t^5 + 203/24*t^4 + 23/2*t^3 + 217/24*t^2 + 87/20*t + 1 (53/20) * (t + 1) * (t^4 + 697/318*t^3 + 683/318*t^2 + 67/53*t + 20/53)\n3     7     119/36*t^6 + 1481/120*t^5 + 1453/72*t^4 + 155/8*t^3 + 865/72*t^2 + 287/60*t + 1 (119/36) * (t + 1) * (t^5 + 3253/1190*t^4 + 118/35*t^3 + 2963/1190*t^2 + 681/595*t + 36/119)\n4     2     t + 1                                    t + 1\n4     3     3/2*t^2 + 5/2*t + 1                      (3/2) * (t + 2/3) * (t + 1)\n4     4     8/3*t^3 + 6*t^2 + 13/3*t + 1             (8/3) * (t + 1/2) * (t + 3/4) * (t + 1)\n4     5     101/24*t^4 + 127/12*t^3 + 235/24*t^2 + 53/12*t + 1 (101/24) * (t + 1) * (t^3 + 153/101*t^2 + 82/101*t + 24/101)\n4     6     104/15*t^5 + 119/6*t^4 + 45/2*t^3 + 85/6*t^2 + 167/30*t + 1 (104/15) * (t + 1) * (t^4 + 387/208*t^3 + 18/13*t^2 + 137/208*t + 15/104)\n4     7     927/80*t^6 + 3019/80*t^5 + 2425/48*t^4 + 1867/48*t^3 + 2447/120*t^2 + 103/15*t + 1 (927/80) * (t + 1) * (t^5 + 2092/927*t^4 + 5849/2781*t^3 + 1162/927*t^2 + 1408/2781*t + 80/927)\n5     2     t + 1                                    t + 1\n5     3     3/2*t^2 + 5/2*t + 1                      (3/2) * (t + 2/3) * (t + 1)\n5     4     8/3*t^3 + 6*t^2 + 13/3*t + 1             (8/3) * (t + 1/2) * (t + 3/4) * (t + 1)\n5     5     125/24*t^4 + 175/12*t^3 + 355/24*t^2 + 77/12*t + 1 (125/24) * (t + 2/5) * (t + 3/5) * (t + 4/5) * (t + 1)\n5     6     49/5*t^5 + 91/3*t^4 + 35*t^3 + 115/6*t^2 + 57/10*t + 1 (49/5) * (t + 1) * (t^4 + 44/21*t^3 + 31/21*t^2 + 47/98*t + 5/49)\n5     7     13517/720*t^6 + 15427/240*t^5 + 12313/144*t^4 + 2809/48*t^3 + 8899/360*t^2 + 36/5*t + 1 (13517/720) * (t + 1) * (t^5 + 32764/13517*t^4 + 28801/13517*t^3 + 13334/13517*t^2 + 4464/13517*t + 720/13517)\n6     2     t + 1                                    t + 1\n6     3     3/2*t^2 + 5/2*t + 1                      (3/2) * (t + 2/3) * (t + 1)\n6     4     8/3*t^3 + 6*t^2 + 13/3*t + 1             (8/3) * (t + 1/2) * (t + 3/4) * (t + 1)\n6     5     125/24*t^4 + 175/12*t^3 + 355/24*t^2 + 77/12*t + 1 (125/24) * (t + 2/5) * (t + 3/5) * (t + 4/5) * (t + 1)\n6     6     54/5*t^5 + 36*t^4 + 93/2*t^3 + 29*t^2 + 87/10*t + 1 (54/5) * (t + 1/3) * (t + 1/2) * (t + 2/3) * (t + 5/6) * (t + 1)\n6     7     16087/720*t^6 + 6619/80*t^5 + 17327/144*t^4 + 4187/48*t^3 + 12359/360*t^2 + 241/30*t + 1 (16087/720) * (t + 1) * (t^5 + 43484/16087*t^4 + 43151/16087*t^3 + 19654/16087*t^2 + 5064/16087*t + 720/16087)\n7     2     t + 1                                    t + 1\n7     3     3/2*t^2 + 5/2*t + 1                      (3/2) * (t + 2/3) * (t + 1)\n7     4     8/3*t^3 + 6*t^2 + 13/3*t + 1             (8/3) * (t + 1/2) * (t + 3/4) * (t + 1)\n7     5     125/24*t^4 + 175/12*t^3 + 355/24*t^2 + 77/12*t + 1 (125/24) * (t + 2/5) * (t + 3/5) * (t + 4/5) * (t + 1)\n7     6     54/5*t^5 + 36*t^4 + 93/2*t^3 + 29*t^2 + 87/10*t + 1 (54/5) * (t + 1/3) * (t + 1/2) * (t + 2/3) * (t + 5/6) * (t + 1)\n7     7     16807/720*t^6 + 7203/80*t^5 + 20237/144*t^4 + 1813/16*t^3 + 2233/45*t^2 + 223/20*t + 1 (16807/720) * (t + 2/7) * (t + 3/7) * (t + 4/7) * (t + 5/7) * (t + 6/7) * (t + 1)"}︡{"stdout":"\n8     2     t + 1                                    t + 1\n8     3     3/2*t^2 + 5/2*t + 1                      (3/2) * (t + 2/3) * (t + 1)\n8     4     8/3*t^3 + 6*t^2 + 13/3*t + 1             (8/3) * (t + 1/2) * (t + 3/4) * (t + 1)\n8     5     125/24*t^4 + 175/12*t^3 + 355/24*t^2 + 77/12*t + 1 (125/24) * (t + 2/5) * (t + 3/5) * (t + 4/5) * (t + 1)\n8     6     54/5*t^5 + 36*t^4 + 93/2*t^3 + 29*t^2 + 87/10*t + 1 (54/5) * (t + 1/3) * (t + 1/2) * (t + 2/3) * (t + 5/6) * (t + 1)\n8     7     16807/720*t^6 + 7203/80*t^5 + 20237/144*t^4 + 1813/16*t^3 + 2233/45*t^2 + 223/20*t + 1 (16807/720) * (t + 2/7) * (t + 3/7) * (t + 4/7) * (t + 5/7) * (t + 6/7) * (t + 1)\n"}︡{"done":true}
︠0cc17cd2-3a71-4b8f-926b-43ff18756d40s︠




#ahora imprimimos el f-vector y el volumen para distintos valores de n
from sage.geometry.polyhedron.constructor import Polyhedron

def generate_k_fibonacci_words_vectors(k, n):
    if n == 0:
        return [], []

    vectors = []
    
    def backtrack(word):
        if len(word) == n:
            vector = tuple(int(char) for char in word)
            vectors.append(vector[1:])  # Append vector excluding the first entry
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
    return vectors

# Solicita al usuario los valores de k y el rango de n
k = int(input("Ingrese el valor de k: "))
min_n = int(input("Ingrese el valor mínimo de n: "))
max_n = int(input("Ingrese el valor máximo de n: "))

# Inicializa una lista para almacenar los resultados
results = []

for n in range(min_n, max_n + 1):
    vectors = generate_k_fibonacci_words_vectors(k, n)

    if not vectors:  # Asegúrate de que vectors no esté vacío
        results.append((n, "No vectors generated", "N/A"))
    else:
        try:
            P = Polyhedron(vertices=vectors)
        except Exception as e:
            results.append((n, f"Error creating polyhedron: {e}", "N/A"))
        else:
            f_vector = P.f_vector()
            volume = P.volume()
            results.append((n, f_vector, volume))

# Imprime los resultados en formato de tabla
print(f"\nResultados para k={k}:\n")
print(f"{'n':<5} {'f-vector':<30} {'Volumen':<15}")
print("-" * 50)
for n, f_vector, volume in results:
    print(f"{n:<5} {str(f_vector):<30} {str(volume):<15}")
︡0484e618-17ee-411a-956b-a003affa8024︡{"raw_input":{"prompt":"Ingrese el valor de k: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Ingrese el valor de k: ","submitted":true,"value":"3"}}︡{"raw_input":{"prompt":"Ingrese el valor mínimo de n: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Ingrese el valor mínimo de n: ","submitted":true,"value":"2"}}︡{"raw_input":{"prompt":"Ingrese el valor máximo de n: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Ingrese el valor máximo de n: ","submitted":true,"value":"6"}}︡{"stdout":"\nResultados para k=3:\n\n"}︡{"stdout":"n     f-vector                       Volumen        \n"}︡{"stdout":"--------------------------------------------------\n"}︡{"stdout":"2     (1, 2, 1)                      1              \n3     (1, 4, 4, 1)                   3/2            \n4     (1, 7, 12, 7, 1)               5/3            \n5     (1, 13, 32, 30, 11, 1)         25/12          \n6     (1, 24, 79, 104, 63, 16, 1)    53/20          \n"}︡{"done":true}
︠8865f7b9-3812-44a8-a6b2-8615143e830bs︠
from sage.all import Polyhedron, factorial

def generate_words(n):
    words = []
    if n == 1:
        return [[2]]
    else:
        smaller_words = generate_words(n-1)
        for word in smaller_words:
            last_digit = word[-1]
            if last_digit == 2:
                words.append(word + [1])
                words.append(word + [2])
            elif last_digit == 1:
                words.append(word + [2])
    return words

n = 3
points = generate_words(n)

# Correctly define the polytope using Polyhedron
polytope = Polyhedron(vertices=points)

# Compute the Ehrhart polynomial
ehrhart_poly = polytope.ehrhart_polynomial()

# Compute the volume
volume = ehrhart_poly.leading_coefficient() / factorial(n)

print(f"Ehrhart Polynomial: {ehrhart_poly}")
print(f"Volume: {volume}")

︡131fa654-b678-4e9d-9007-e17d80959bc9︡{"stdout":"Ehrhart Polynomial: 1/2*t^2 + 3/2*t + 1\n"}︡{"stdout":"Volume: 1/12\n"}︡{"done":true}
︠5902cf62-c050-40fc-ac3a-e8c3883e1c29s︠
#Intentamos mostrar que las palabras generalizadas de Fibonacci son l.i.
from sage.geometry.polyhedron.constructor import Polyhedron
import pandas as pd

def generate_k_fibonacci_words_vectors(k, n):
    """
    Generate all k-generalized Fibonacci words of length n and their corresponding vectors.
    """
    if n == 0:
        return [], []

    words = []
    vectors = []
    queue = [str(k)]
    
    while queue:
        word = queue.pop(0)
        
        if len(word) == n:
            vector = tuple(int(char) for char in word)
            vectors.append(vector[1:])  # Append vector excluding the first entry
            words.append(word)  # Append the generated word
            continue
        
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
            queue.append(word + c)

    return vectors, words

def create_point_matrix(p, n):
    """
    Generate matrix of points for a given p and n.
    """
    vectors, words = generate_k_fibonacci_words_vectors(p, n)
    if vectors:
        try:
            num_coords = len(vectors[0])
            
            # Debugging: print the number of coordinates
            print(f"Number of coordinates for p={p}, n={n}: {num_coords}")
            
            # Create DataFrame with vectors and words
            df = pd.DataFrame(vectors, columns=[f'Coord_{i+1}' for i in range(num_coords)])
            words_df = pd.DataFrame(list(zip(*[list(word) for word in words])), columns=[f'Word_{i+1}' for i in range(n)])
            
            # Check if the number of columns in vectors matches the number of coordinates
            if len(vectors[0]) != num_coords:
                raise ValueError(f"Dimension mismatch: Expected {num_coords} columns, found {len(vectors[0])}.")
            
            return df, words_df
        except Exception as e:
            print(f"Error creating polyhedron for p={p}, n={n}: {e}")
            return None, None
    else:
        return None, None

def display_matrices(df, words_df, p, n):
    """
    Display matrices of points and words in a clear and tabular format.
    """
    if df is None or words_df is None:
        print(f"No matrices generated for p={p}, n={n}")
    else:
        print(f"\n{'=' * 50}")
        print(f"Matrix of points for p={p}, n={n}:")
        print(f"{'=' * 50}")
        print(df.to_string(index=False))
        
        print(f"\nMatrix of words for p={p}, n={n}:")
        print(f"{'=' * 50}")
        print(words_df.to_string(index=False))
        
        print(f"{'=' * 50}")

def display_all_matrices(p_range, n_range):
    """
    Display matrices of points and words for all combinations of p and n within specified ranges.
    """
    for p in p_range:
        for n in n_range:
            df, words_df = create_point_matrix(p, n)
            display_matrices(df, words_df, p, n)

# Prompt the user to enter ranges for k and n
try:
    p_min = int(input("Enter the minimum value for k: "))
    p_max = int(input("Enter the maximum value for k: "))
    n_min = int(input("Enter the minimum value for n: "))
    n_max = int(input("Enter the maximum value for n: "))

    if p_min < 1 or p_max < p_min or n_min < 1 or n_max < n_min:
        raise ValueError("Invalid range values. Ensure k and n are positive and ranges are valid.")
except ValueError as e:
    print(f"Invalid input: {e}")
else:
    p_range = range(p_min, p_max + 1)
    n_range = range(n_min, n_max + 1)
    display_all_matrices(p_range, n_range)

︡337056e4-22aa-42b2-97d9-0223426f447f︡{"raw_input":{"prompt":"Enter the minimum value for k: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the minimum value for k: ","submitted":true,"value":"5"}}︡{"raw_input":{"prompt":"Enter the maximum value for k: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the maximum value for k: ","submitted":true,"value":"6"}}︡{"raw_input":{"prompt":"Enter the minimum value for n: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the minimum value for n: ","submitted":true,"value":"1"}}︡{"raw_input":{"prompt":"Enter the maximum value for n: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the maximum value for n: ","submitted":true,"value":"4"}}︡{"stdout":"Number of coordinates for p=5, n=1: 0"}︡{"stdout":"\n\n=================================================="}︡{"stdout":"\nMatrix of points for p=5, n=1:\n==================================================\nEmpty DataFrame\nColumns: []\nIndex: [0]\n\nMatrix of words for p=5, n=1:\n==================================================\nWord_1\n     5"}︡{"stdout":"\n==================================================\nNumber of coordinates for p=5, n=2: 1\n\n==================================================\nMatrix of points for p=5, n=2:\n==================================================\n Coord_1\n       5\n       4\n\nMatrix of words for p=5, n=2:\n==================================================\nWord_1 Word_2\n     5      5\n     5      4\n==================================================\nNumber of coordinates for p=5, n=3: 2\nError creating polyhedron for p=5, n=3: 3 columns passed, passed data had 4 columns\nNo matrices generated for p=5, n=3\nNumber of coordinates for p=5, n=4: 3\nError creating polyhedron for p=5, n=4: 4 columns passed, passed data had 8 columns\nNo matrices generated for p=5, n=4\nNumber of coordinates for p=6, n=1: 0\n\n==================================================\nMatrix of points for p=6, n=1:\n==================================================\nEmpty DataFrame\nColumns: []\nIndex: [0]\n\nMatrix of words for p=6, n=1:\n==================================================\nWord_1\n     6\n==================================================\nNumber of coordinates for p=6, n=2: 1\n\n==================================================\nMatrix of points for p=6, n=2:\n==================================================\n Coord_1\n       6\n       5\n\nMatrix of words for p=6, n=2:\n==================================================\nWord_1 Word_2\n     6      6\n     6      5\n==================================================\nNumber of coordinates for p=6, n=3: 2\nError creating polyhedron for p=6, n=3: 3 columns passed, passed data had 4 columns\nNo matrices generated for p=6, n=3\nNumber of coordinates for p=6, n=4: 3\nError creating polyhedron for p=6, n=4: 4 columns passed, passed data had 8 columns\nNo matrices generated for p=6, n=4\n"}︡{"done":true}
︠86420692-0e2a-45c3-9d8b-0102884dfd6cs︠
︡6e0a91f2-41be-4497-b307-4835f038452f︡{"done":true}
︠84c9faa8-67be-411d-9b80-54a2311d8dc9s︠
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

        candidates = []
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

def save_polyhedron_plot(k, n, vectors):
    """
    Save the plot of the polyhedron as a PNG image file.
    """
    if not vectors:  # Ensure vectors are not empty
        print(f"No vectors generated for k={k}, n={n}")
        return

    try:
        P = Polyhedron(vertices=vectors)
        if n <= 6:  # Avoid plotting for large values to prevent errors
            polytope_plot = P.plot()
            filename = f"polytope_k{k}_n{n}.png"  # Save as PNG
            polytope_plot.save(filename, format='png')  # Specify format
            print(f"Polyhedron plot saved as {filename}")
        else:
            print("Plotting skipped for large dimensions.")
    except Exception as e:
        print(f"Error saving polyhedron plot for k={k}, n={n}: {e}")

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
    save_polyhedron_plot(k, n, vectors)

︡c493fc29-3c97-4e59-a80f-aaa37640e381︡{"raw_input":{"prompt":"Enter the value for k: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the value for k: ","submitted":true,"value":"3"}}︡{"raw_input":{"prompt":"Enter the value for n: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Enter the value for n: ","submitted":true,"value":"4"}}︡{"stdout":"Polyhedron plot saved as polytope_k3_n4.png"}︡{"stdout":"\n"}︡{"done":true}
︠38ae3552-a657-4bd2-bd04-61813c1b655fs︠


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

        candidates = []
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

def get_lattice_points_in_dilations(polytope, max_dilation):
    """
    Compute and return the lattice points in the dilations of the polytope.
    
    :param polytope: The polytope for which to compute dilations.
    :param max_dilation: The maximum dilation factor to consider.
    :return: A list of tuples containing the dilation factor and the corresponding lattice points.
    """
    lattice_points_by_dilation = []
    
    for t in range(1, max_dilation + 1):
        dilated_polytope = t * polytope
        lattice_points = dilated_polytope.integral_points()
        lattice_points_by_dilation.append((t, lattice_points))
    
    return lattice_points_by_dilation

def compute_lattice_points(k, n, max_dilation=3):
    """
    Generate the polytope from k-generalized Fibonacci words, compute, and return lattice points in its dilations.
    
    :param k: The value for k in k-generalized Fibonacci words.
    :param n: The length of the words.
    :param max_dilation: The maximum dilation factor to consider.
    :return: A list of tuples containing the dilation factor and lattice points.
    """
    vectors, _ = generate_k_fibonacci_words_vectors(k, n)
    if not vectors:
        return []

    P = Polyhedron(vertices=vectors)
    return get_lattice_points_in_dilations(P, max_dilation)

# Example usage:
k = 4
n = 4
max_dilation = 5
lattice_points_dilations = compute_lattice_points(k, n, max_dilation)

# Output the lattice points for each dilation
for t, points in lattice_points_dilations:
    print(f"Dilation factor t={t}:")
    print(f"Lattice points ({len(points)} points): {points}")
    print("-" * 50)
︡46bcd168-ad90-4f8f-8a81-6a7a1c361269︡{"stdout":"Dilation factor t=1:\nLattice points (14 points): ((3, 2, 1), (3, 2, 2), (3, 2, 3), (3, 2, 4), (3, 3, 2), (3, 3, 3), (3, 3, 4), (3, 4, 3), (3, 4, 4), (4, 3, 2), (4, 3, 3), (4, 3, 4), (4, 4, 3), (4, 4, 4))\n--------------------------------------------------\nDilation factor t=2:\nLattice points (55 points): ((6, 4, 2), (6, 4, 3), (6, 4, 4), (6, 4, 5), (6, 4, 6), (6, 4, 7), (6, 4, 8), (6, 5, 3), (6, 5, 4), (6, 5, 5), (6, 5, 6), (6, 5, 7), (6, 5, 8), (6, 6, 4), (6, 6, 5), (6, 6, 6), (6, 6, 7), (6, 6, 8), (6, 7, 5), (6, 7, 6), (6, 7, 7), (6, 7, 8), (6, 8, 6), (6, 8, 7), (6, 8, 8), (7, 5, 3), (7, 5, 4), (7, 5, 5), (7, 5, 6), (7, 5, 7), (7, 5, 8), (7, 6, 4), (7, 6, 5), (7, 6, 6), (7, 6, 7), (7, 6, 8), (7, 7, 5), (7, 7, 6), (7, 7, 7), (7, 7, 8), (7, 8, 6), (7, 8, 7), (7, 8, 8), (8, 6, 4), (8, 6, 5), (8, 6, 6), (8, 6, 7), (8, 6, 8), (8, 7, 5), (8, 7, 6), (8, 7, 7), (8, 7, 8), (8, 8, 6), (8, 8, 7), (8, 8, 8))\n--------------------------------------------------\nDilation factor t=3:\nLattice points (140 points): ((9, 6, 3), (9, 6, 4), (9, 6, 5), (9, 6, 6), (9, 6, 7), (9, 6, 8), (9, 6, 9), (9, 6, 10), (9, 6, 11), (9, 6, 12), (9, 7, 4), (9, 7, 5), (9, 7, 6), (9, 7, 7), (9, 7, 8), (9, 7, 9), (9, 7, 10), (9, 7, 11), (9, 7, 12), (9, 8, 5), (9, 8, 6), (9, 8, 7), (9, 8, 8), (9, 8, 9), (9, 8, 10), (9, 8, 11), (9, 8, 12), (9, 9, 6), (9, 9, 7), (9, 9, 8), (9, 9, 9), (9, 9, 10), (9, 9, 11), (9, 9, 12), (9, 10, 7), (9, 10, 8), (9, 10, 9), (9, 10, 10), (9, 10, 11), (9, 10, 12), (9, 11, 8), (9, 11, 9), (9, 11, 10), (9, 11, 11), (9, 11, 12), (9, 12, 9), (9, 12, 10), (9, 12, 11), (9, 12, 12), (10, 7, 4), (10, 7, 5), (10, 7, 6), (10, 7, 7), (10, 7, 8), (10, 7, 9), (10, 7, 10), (10, 7, 11), (10, 7, 12), (10, 8, 5), (10, 8, 6), (10, 8, 7), (10, 8, 8), (10, 8, 9), (10, 8, 10), (10, 8, 11), (10, 8, 12), (10, 9, 6), (10, 9, 7), (10, 9, 8), (10, 9, 9), (10, 9, 10), (10, 9, 11), (10, 9, 12), (10, 10, 7), (10, 10, 8), (10, 10, 9), (10, 10, 10), (10, 10, 11), (10, 10, 12), (10, 11, 8), (10, 11, 9), (10, 11, 10), (10, 11, 11), (10, 11, 12), (10, 12, 9), (10, 12, 10), (10, 12, 11), (10, 12, 12), (11, 8, 5), (11, 8, 6), (11, 8, 7), (11, 8, 8), (11, 8, 9), (11, 8, 10), (11, 8, 11), (11, 8, 12), (11, 9, 6), (11, 9, 7), (11, 9, 8), (11, 9, 9), (11, 9, 10), (11, 9, 11), (11, 9, 12), (11, 10, 7), (11, 10, 8), (11, 10, 9), (11, 10, 10), (11, 10, 11), (11, 10, 12), (11, 11, 8), (11, 11, 9), (11, 11, 10), (11, 11, 11), (11, 11, 12), (11, 12, 9), (11, 12, 10), (11, 12, 11), (11, 12, 12), (12, 9, 6), (12, 9, 7), (12, 9, 8), (12, 9, 9), (12, 9, 10), (12, 9, 11), (12, 9, 12), (12, 10, 7), (12, 10, 8), (12, 10, 9), (12, 10, 10), (12, 10, 11), (12, 10, 12), (12, 11, 8), (12, 11, 9), (12, 11, 10), (12, 11, 11), (12, 11, 12), (12, 12, 9), (12, 12, 10), (12, 12, 11), (12, 12, 12))\n--------------------------------------------------\nDilation factor t=4:\nLattice points (285 points): ((12, 8, 4), (12, 8, 5), (12, 8, 6), (12, 8, 7), (12, 8, 8), (12, 8, 9), (12, 8, 10), (12, 8, 11), (12, 8, 12), (12, 8, 13), (12, 8, 14), (12, 8, 15), (12, 8, 16), (12, 9, 5), (12, 9, 6), (12, 9, 7), (12, 9, 8), (12, 9, 9), (12, 9, 10), (12, 9, 11), (12, 9, 12), (12, 9, 13), (12, 9, 14), (12, 9, 15), (12, 9, 16), (12, 10, 6), (12, 10, 7), (12, 10, 8), (12, 10, 9), (12, 10, 10), (12, 10, 11), (12, 10, 12), (12, 10, 13), (12, 10, 14), (12, 10, 15), (12, 10, 16), (12, 11, 7), (12, 11, 8), (12, 11, 9), (12, 11, 10), (12, 11, 11), (12, 11, 12), (12, 11, 13), (12, 11, 14), (12, 11, 15), (12, 11, 16), (12, 12, 8), (12, 12, 9), (12, 12, 10), (12, 12, 11), (12, 12, 12), (12, 12, 13), (12, 12, 14), (12, 12, 15), (12, 12, 16), (12, 13, 9), (12, 13, 10), (12, 13, 11), (12, 13, 12), (12, 13, 13), (12, 13, 14), (12, 13, 15), (12, 13, 16), (12, 14, 10), (12, 14, 11), (12, 14, 12), (12, 14, 13), (12, 14, 14), (12, 14, 15), (12, 14, 16), (12, 15, 11), (12, 15, 12), (12, 15, 13), (12, 15, 14), (12, 15, 15), (12, 15, 16), (12, 16, 12), (12, 16, 13), (12, 16, 14), (12, 16, 15), (12, 16, 16), (13, 9, 5), (13, 9, 6), (13, 9, 7), (13, 9, 8), (13, 9, 9), (13, 9, 10), (13, 9, 11), (13, 9, 12), (13, 9, 13), (13, 9, 14), (13, 9, 15), (13, 9, 16), (13, 10, 6), (13, 10, 7), (13, 10, 8), (13, 10, 9), (13, 10, 10), (13, 10, 11), (13, 10, 12), (13, 10, 13), (13, 10, 14), (13, 10, 15), (13, 10, 16), (13, 11, 7), (13, 11, 8), (13, 11, 9), (13, 11, 10), (13, 11, 11), (13, 11, 12), (13, 11, 13), (13, 11, 14), (13, 11, 15), (13, 11, 16), (13, 12, 8), (13, 12, 9), (13, 12, 10), (13, 12, 11), (13, 12, 12), (13, 12, 13), (13, 12, 14), (13, 12, 15), (13, 12, 16), (13, 13, 9), (13, 13, 10), (13, 13, 11), (13, 13, 12), (13, 13, 13), (13, 13, 14), (13, 13, 15), (13, 13, 16), (13, 14, 10), (13, 14, 11), (13, 14, 12), (13, 14, 13), (13, 14, 14), (13, 14, 15), (13, 14, 16), (13, 15, 11), (13, 15, 12), (13, 15, 13), (13, 15, 14), (13, 15, 15), (13, 15, 16), (13, 16, 12), (13, 16, 13), (13, 16, 14), (13, 16, 15), (13, 16, 16), (14, 10, 6), (14, 10, 7), (14, 10, 8), (14, 10, 9), (14, 10, 10), (14, 10, 11), (14, 10, 12), (14, 10, 13), (14, 10, 14), (14, 10, 15), (14, 10, 16), (14, 11, 7), (14, 11, 8), (14, 11, 9), (14, 11, 10), (14, 11, 11), (14, 11, 12), (14, 11, 13), (14, 11, 14), (14, 11, 15), (14, 11, 16), (14, 12, 8), (14, 12, 9), (14, 12, 10), (14, 12, 11), (14, 12, 12), (14, 12, 13), (14, 12, 14), (14, 12, 15), (14, 12, 16), (14, 13, 9), (14, 13, 10), (14, 13, 11), (14, 13, 12), (14, 13, 13), (14, 13, 14), (14, 13, 15), (14, 13, 16), (14, 14, 10), (14, 14, 11), (14, 14, 12), (14, 14, 13), (14, 14, 14), (14, 14, 15), (14, 14, 16), (14, 15, 11), (14, 15, 12), (14, 15, 13), (14, 15, 14), (14, 15, 15), (14, 15, 16), (14, 16, 12), (14, 16, 13), (14, 16, 14), (14, 16, 15), (14, 16, 16), (15, 11, 7), (15, 11, 8), (15, 11, 9), (15, 11, 10), (15, 11, 11), (15, 11, 12), (15, 11, 13), (15, 11, 14), (15, 11, 15), (15, 11, 16), (15, 12, 8), (15, 12, 9), (15, 12, 10), (15, 12, 11), (15, 12, 12), (15, 12, 13), (15, 12, 14), (15, 12, 15), (15, 12, 16), (15, 13, 9), (15, 13, 10), (15, 13, 11), (15, 13, 12), (15, 13, 13), (15, 13, 14), (15, 13, 15), (15, 13, 16), (15, 14, 10), (15, 14, 11), (15, 14, 12), (15, 14, 13), (15, 14, 14), (15, 14, 15), (15, 14, 16), (15, 15, 11), (15, 15, 12), (15, 15, 13), (15, 15, 14), (15, 15, 15), (15, 15, 16), (15, 16, 12), (15, 16, 13), (15, 16, 14), (15, 16, 15), (15, 16, 16), (16, 12, 8), (16, 12, 9), (16, 12, 10), (16, 12, 11), (16, 12, 12), (16, 12, 13), (16, 12, 14), (16, 12, 15), (16, 12, 16), (16, 13, 9), (16, 13, 10), (16, 13, 11), (16, 13, 12), (16, 13, 13), (16, 13, 14), (16, 13, 15), (16, 13, 16), (16, 14, 10), (16, 14, 11), (16, 14, 12), (16, 14, 13), (16, 14, 14), (16, 14, 15), (16, 14, 16), (16, 15, 11), (16, 15, 12), (16, 15, 13), (16, 15, 14), (16, 15, 15), (16, 15, 16), (16, 16, 12), (16, 16, 13), (16, 16, 14), (16, 16, 15), (16, 16, 16))"}︡{"stdout":"\n--------------------------------------------------\nDilation factor t=5:\nLattice points (506 points): ((15, 10, 5), (15, 10, 6), (15, 10, 7), (15, 10, 8), (15, 10, 9), (15, 10, 10), (15, 10, 11), (15, 10, 12), (15, 10, 13), (15, 10, 14), (15, 10, 15), (15, 10, 16), (15, 10, 17), (15, 10, 18), (15, 10, 19), (15, 10, 20), (15, 11, 6), (15, 11, 7), (15, 11, 8), (15, 11, 9), (15, 11, 10), (15, 11, 11), (15, 11, 12), (15, 11, 13), (15, 11, 14), (15, 11, 15), (15, 11, 16), (15, 11, 17), (15, 11, 18), (15, 11, 19), (15, 11, 20), (15, 12, 7), (15, 12, 8), (15, 12, 9), (15, 12, 10), (15, 12, 11), (15, 12, 12), (15, 12, 13), (15, 12, 14), (15, 12, 15), (15, 12, 16), (15, 12, 17), (15, 12, 18), (15, 12, 19), (15, 12, 20), (15, 13, 8), (15, 13, 9), (15, 13, 10), (15, 13, 11), (15, 13, 12), (15, 13, 13), (15, 13, 14), (15, 13, 15), (15, 13, 16), (15, 13, 17), (15, 13, 18), (15, 13, 19), (15, 13, 20), (15, 14, 9), (15, 14, 10), (15, 14, 11), (15, 14, 12), (15, 14, 13), (15, 14, 14), (15, 14, 15), (15, 14, 16), (15, 14, 17), (15, 14, 18), (15, 14, 19), (15, 14, 20), (15, 15, 10), (15, 15, 11), (15, 15, 12), (15, 15, 13), (15, 15, 14), (15, 15, 15), (15, 15, 16), (15, 15, 17), (15, 15, 18), (15, 15, 19), (15, 15, 20), (15, 16, 11), (15, 16, 12), (15, 16, 13), (15, 16, 14), (15, 16, 15), (15, 16, 16), (15, 16, 17), (15, 16, 18), (15, 16, 19), (15, 16, 20), (15, 17, 12), (15, 17, 13), (15, 17, 14), (15, 17, 15), (15, 17, 16), (15, 17, 17), (15, 17, 18), (15, 17, 19), (15, 17, 20), (15, 18, 13), (15, 18, 14), (15, 18, 15), (15, 18, 16), (15, 18, 17), (15, 18, 18), (15, 18, 19), (15, 18, 20), (15, 19, 14), (15, 19, 15), (15, 19, 16), (15, 19, 17), (15, 19, 18), (15, 19, 19), (15, 19, 20), (15, 20, 15), (15, 20, 16), (15, 20, 17), (15, 20, 18), (15, 20, 19), (15, 20, 20), (16, 11, 6), (16, 11, 7), (16, 11, 8), (16, 11, 9), (16, 11, 10), (16, 11, 11), (16, 11, 12), (16, 11, 13), (16, 11, 14), (16, 11, 15), (16, 11, 16), (16, 11, 17), (16, 11, 18), (16, 11, 19), (16, 11, 20), (16, 12, 7), (16, 12, 8), (16, 12, 9), (16, 12, 10), (16, 12, 11), (16, 12, 12), (16, 12, 13), (16, 12, 14), (16, 12, 15), (16, 12, 16), (16, 12, 17), (16, 12, 18), (16, 12, 19), (16, 12, 20), (16, 13, 8), (16, 13, 9), (16, 13, 10), (16, 13, 11), (16, 13, 12), (16, 13, 13), (16, 13, 14), (16, 13, 15), (16, 13, 16), (16, 13, 17), (16, 13, 18), (16, 13, 19), (16, 13, 20), (16, 14, 9), (16, 14, 10), (16, 14, 11), (16, 14, 12), (16, 14, 13), (16, 14, 14), (16, 14, 15), (16, 14, 16), (16, 14, 17), (16, 14, 18), (16, 14, 19), (16, 14, 20), (16, 15, 10), (16, 15, 11), (16, 15, 12), (16, 15, 13), (16, 15, 14), (16, 15, 15), (16, 15, 16), (16, 15, 17), (16, 15, 18), (16, 15, 19), (16, 15, 20), (16, 16, 11), (16, 16, 12), (16, 16, 13), (16, 16, 14), (16, 16, 15), (16, 16, 16), (16, 16, 17), (16, 16, 18), (16, 16, 19), (16, 16, 20), (16, 17, 12), (16, 17, 13), (16, 17, 14), (16, 17, 15), (16, 17, 16), (16, 17, 17), (16, 17, 18), (16, 17, 19), (16, 17, 20), (16, 18, 13), (16, 18, 14), (16, 18, 15), (16, 18, 16), (16, 18, 17), (16, 18, 18), (16, 18, 19), (16, 18, 20), (16, 19, 14), (16, 19, 15), (16, 19, 16), (16, 19, 17), (16, 19, 18), (16, 19, 19), (16, 19, 20), (16, 20, 15), (16, 20, 16), (16, 20, 17), (16, 20, 18), (16, 20, 19), (16, 20, 20), (17, 12, 7), (17, 12, 8), (17, 12, 9), (17, 12, 10), (17, 12, 11), (17, 12, 12), (17, 12, 13), (17, 12, 14), (17, 12, 15), (17, 12, 16), (17, 12, 17), (17, 12, 18), (17, 12, 19), (17, 12, 20), (17, 13, 8), (17, 13, 9), (17, 13, 10), (17, 13, 11), (17, 13, 12), (17, 13, 13), (17, 13, 14), (17, 13, 15), (17, 13, 16), (17, 13, 17), (17, 13, 18), (17, 13, 19), (17, 13, 20), (17, 14, 9), (17, 14, 10), (17, 14, 11), (17, 14, 12), (17, 14, 13), (17, 14, 14), (17, 14, 15), (17, 14, 16), (17, 14, 17), (17, 14, 18), (17, 14, 19), (17, 14, 20), (17, 15, 10), (17, 15, 11), (17, 15, 12), (17, 15, 13), (17, 15, 14), (17, 15, 15), (17, 15, 16), (17, 15, 17), (17, 15, 18), (17, 15, 19), (17, 15, 20), (17, 16, 11), (17, 16, 12), (17, 16, 13), (17, 16, 14), (17, 16, 15), (17, 16, 16), (17, 16, 17), (17, 16, 18), (17, 16, 19), (17, 16, 20), (17, 17, 12), (17, 17, 13), (17, 17, 14), (17, 17, 15), (17, 17, 16), (17, 17, 17), (17, 17, 18), (17, 17, 19), (17, 17, 20), (17, 18, 13), (17, 18, 14), (17, 18, 15), (17, 18, 16), (17, 18, 17), (17, 18, 18), (17, 18, 19), (17, 18, 20), (17, 19, 14), (17, 19, 15), (17, 19, 16), (17, 19, 17), (17, 19, 18), (17, 19, 19), (17, 19, 20), (17, 20, 15), (17, 20, 16), (17, 20, 17), (17, 20, 18), (17, 20, 19), (17, 20, 20), (18, 13, 8), (18, 13, 9), (18, 13, 10), (18, 13, 11), (18, 13, 12), (18, 13, 13), (18, 13, 14), (18, 13, 15), (18, 13, 16), (18, 13, 17), (18, 13, 18), (18, 13, 19), (18, 13, 20), (18, 14, 9), (18, 14, 10), (18, 14, 11), (18, 14, 12), (18, 14, 13), (18, 14, 14), (18, 14, 15), (18, 14, 16), (18, 14, 17), (18, 14, 18), (18, 14, 19), (18, 14, 20), (18, 15, 10), (18, 15, 11), (18, 15, 12), (18, 15, 13), (18, 15, 14), (18, 15, 15), (18, 15, 16), (18, 15, 17), (18, 15, 18), (18, 15, 19), (18, 15, 20), (18, 16, 11), (18, 16, 12), (18, 16, 13), (18, 16, 14), (18, 16, 15), (18, 16, 16), (18, 16, 17), (18, 16, 18), (18, 16, 19), (18, 16, 20), (18, 17, 12), (18, 17, 13), (18, 17, 14), (18, 17, 15), (18, 17, 16), (18, 17, 17), (18, 17, 18), (18, 17, 19), (18, 17, 20), (18, 18, 13), (18, 18, 14), (18, 18, 15), (18, 18, 16), (18, 18, 17), (18, 18, 18), (18, 18, 19), (18, 18, 20), (18, 19, 14), (18, 19, 15), (18, 19, 16), (18, 19, 17), (18, 19, 18), (18, 19, 19), (18, 19, 20), (18, 20, 15), (18, 20, 16), (18, 20, 17), (18, 20, 18), (18, 20, 19), (18, 20, 20), (19, 14, 9), (19, 14, 10), (19, 14, 11), (19, 14, 12), (19, 14, 13), (19, 14, 14), (19, 14, 15), (19, 14, 16), (19, 14, 17), (19, 14, 18), (19, 14, 19), (19, 14, 20), (19, 15, 10), (19, 15, 11), (19, 15, 12), (19, 15, 13), (19, 15, 14), (19, 15, 15), (19, 15, 16), (19, 15, 17), (19, 15, 18), (19, 15, 19), (19, 15, 20), (19, 16, 11), (19, 16, 12), (19, 16, 13), (19, 16, 14), (19, 16, 15), (19, 16, 16), (19, 16, 17), (19, 16, 18), (19, 16, 19), (19, 16, 20), (19, 17, 12), (19, 17, 13), (19, 17, 14), (19, 17, 15), (19, 17, 16), (19, 17, 17), (19, 17, 18), (19, 17, 19), (19, 17, 20), (19, 18, 13), (19, 18, 14), (19, 18, 15), (19, 18, 16), (19, 18, 17), (19, 18, 18), (19, 18, 19), (19, 18, 20), (19, 19, 14), (19, 19, 15), (19, 19, 16), (19, 19, 17), (19, 19, 18), (19, 19, 19), (19, 19, 20), (19, 20, 15), (19, 20, 16), (19, 20, 17), (19, 20, 18), (19, 20, 19), (19, 20, 20), (20, 15, 10), (20, 15, 11), (20, 15, 12), (20, 15, 13), (20, 15, 14), (20, 15, 15), (20, 15, 16), (20, 15, 17), (20, 15, 18), (20, 15, 19), (20, 15, 20), (20, 16, 11), (20, 16, 12), (20, 16, 13), (20, 16, 14), (20, 16, 15), (20, 16, 16), (20, 16, 17), (20, 16, 18), (20, 16, 19), (20, 16, 20), (20, 17, 12), (20, 17, 13), (20, 17, 14), (20, 17, 15), (20, 17, 16), (20, 17, 17), (20, 17, 18), (20, 17, 19), (20, 17, 20), (20, 18, 13), (20, 18, 14), (20, 18, 15), (20, 18, 16), (20, 18, 17), (20, 18, 18), (20, 18, 19), (20, 18, 20), (20, 19, 14), (20, 19, 15), (20, 19, 16), (20, 19, 17), (20, 19, 18), (20, 19, 19), (20, 19, 20), (20, 20, 15), (20, 20, 16), (20, 20, 17), (20, 20, 18), (20, 20, 19), (20, 20, 20))"}︡{"stdout":"\n--------------------------------------------------\n"}︡{"done":true}
︠117665f7-e23f-4ef0-bfcd-718df74f32eds︠
from sage.geometry.polyhedron.constructor import Polyhedron

def generate_k_fibonacci_words_vectors(k, n):
    if n == 0:
        return [], []

    vectors = []
    
    def backtrack(word):
        if len(word) == n:
            vector = tuple(int(char) for char in word)
            vectors.append(vector[1:])  # Append vector excluding the first entry
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
    return vectors

# Fixed value of k
k = int(input("Ingrese el valor de k: "))

# Initialize a list to store the results
results = []

# Iterate over n from 2 to 6
for n in range(2, 12):
    vectors = generate_k_fibonacci_words_vectors(k, n)

    if not vectors:  # Ensure vectors is not empty
        results.append((n, "No vectors generated"))
    else:
        try:
            P = Polyhedron(vertices=vectors)
        except Exception as e:
            results.append((n, f"Error creating polyhedron: {e}"))
        else:
            f_vector = P.f_vector()
            results.append((n, f_vector))

# Generate the LaTeX table
print(f"\nResultados para k={k} en formato LaTeX:\n")
print("\\begin{table}[H]")
print("\\centering")
print("\\begin{tabular}{|c|c|}")
print("\\hline")
print("n & $f$-vector \\\\")
print("\\hline")

for n, f_vector in results:
    f_vector_str = " ".join(str(f) for f in f_vector)
    print(f"{n} & ${f_vector_str}$ \\\\")
    print("\\hline")

print("\\end{tabular}")
print("\\caption{$f$-vector for $k=" + str(k) + "$ and $n$ ranging from 2 to 6}")
print("\\end{table}")
︡785b48c3-0666-4065-bd62-fec49ffb042b︡{"raw_input":{"prompt":"Ingrese el valor de k: "}}︡{"delete_last":true}︡{"raw_input":{"prompt":"Ingrese el valor de k: ","submitted":true,"value":"3"}}︡{"stdout":"\nResultados para k=3 en formato LaTeX:\n\n"}︡{"stdout":"\\begin{table}[H]\n"}︡{"stdout":"\\centering\n"}︡{"stdout":"\\begin{tabular}{|c|c|}\n"}︡{"stdout":"\\hline\n"}︡{"stdout":"n & $f$-vector \\\\\n"}︡{"stdout":"\\hline\n"}︡{"stdout":"2 & $1 2 1$ \\\\\n\\hline\n3 & $1 4 4 1$ \\\\\n\\hline\n4 & $1 7 12 7 1$ \\\\\n\\hline\n5 & $1 13 32 30 11 1$ \\\\\n\\hline\n6 & $1 24 79 104 63 16 1$ \\\\\n\\hline\n7 & $1 44 185 319 274 118 22 1$ \\\\\n\\hline\n8 & $1 81 417 897 1010 625 203 29 1$ \\\\\n\\hline\n9 & $1 149 914 2371 3326 2712 1282 327 37 1$ \\\\\n\\hline\n10 & $1 274 1960 5982 10100 10287 6450 2423 500 46 1$ \\\\\n\\hline\n11 & $1 504 4130 14547 28832 35393 27834 13966 4291 733 56 1$ \\\\\n\\hline\n"}︡{"stdout":"\\end{tabular}\n"}︡{"stdout":"\\caption{$f$-vector for $k=3$ and $n$ ranging from 2 to 6}\n"}︡{"stdout":"\\end{table}\n"}︡{"done":true}
︠1887ed77-162c-4024-9fba-e7a9948a6e10︠

︡d6240c04-2123-432b-86f9-00f150a59a09︡{"done":true}
︠25f60dc4-336e-4532-8822-fdc5c713c6ee︠









