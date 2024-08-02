#!/bin/bash

# Associative array for additional information
declare -A operator_info

# Array of logical operators with natural language descriptions
operators=(
    "∧ AND"
    "∨ OR"
    "¬ NOT"
    "⊕ XOR"
    "→ IMPLIES"
    "↔ IFF"
    "∃ EXISTS backwards e"
    "∀ FOR ALL upside down A"
    "∈ ELEMENT OF lowercase e with line"
    "∉ NOT ELEMENT OF slashed lowercase e with line"
    "⊂ SUBSET OF c shape"
    "⊃ SUPERSET OF backwards c shape"
    "∪ UNION u shape"
    "∩ INTERSECTION n shape"
    "∅ EMPTY SET circle with slash"
    "ℕ NATURAL NUMBERS"
    "ℤ INTEGERS"
    "ℚ RATIONAL NUMBERS"
    "ℝ REAL NUMBERS"
    "ℂ COMPLEX NUMBERS"
    "∞ INFINITY sideways 8"
    "≈ APPROXIMATELY EQUAL"
    "≠ NOT EQUAL"
    "≤ LESS THAN OR EQUAL"
    "≥ GREATER THAN OR EQUAL"
    "± PLUS-MINUS"
    "× MULTIPLICATION"
    "÷ DIVISION"
    "√ SQUARE ROOT check mark"
    "∑ SUMMATION big sigma"
    "∏ PRODUCT big pi"
    "∂ PARTIAL DERIVATIVE curly d"
    "∇ NABLA/DEL triangle"
    "∫ INTEGRAL long s"
    "∮ CONTOUR INTEGRAL circle integral"
    "∝ PROPORTIONAL TO infinity symbol on side"
    "° DEGREE"
    "⊥ PERPENDICULAR"
    "∠ ANGLE less than symbol with line"
    "π PI"
    "ε EPSILON"
    "μ MU"
    "σ SIGMA"
    "Ω OMEGA"
    "α ALPHA"
    "β BETA"
    "γ GAMMA"
    "δ DELTA"
    "θ THETA"
    "λ LAMBDA"
    "φ PHI"
    "ψ PSI"
    "ω OMEGA LOWERCASE"
    "ℏ PLANCK CONSTANT h with bar"
    "⟨ LEFT ANGLE BRACKET left pointy bracket"
    "⟩ RIGHT ANGLE BRACKET right pointy bracket"
    "ℒ LAGRANGIAN cursive L"
    "ℋ HAMILTONIAN cursive H"
    "⊗ TENSOR PRODUCT circle with x"
    "⊕ DIRECT SUM circle with plus"
    "† HERMITIAN CONJUGATE cross"
    "‖ NORM double vertical lines"
    "→ VECTOR ARROW"
    "⇌ EQUILIBRIUM double arrow with equal top"
    "⇋ REVERSIBLE REACTION double arrow with half arrow top"
    "∴ THEREFORE triangle of dots"
    "⟨| BRA left angle bracket with vertical bar"
    "|⟩ KET vertical bar with right angle bracket"
    "⟨|⟩ BRAKET left angle bracket, vertical bar, right angle bracket"
)

# Populate the associative array with additional information
operator_info["∧"]="Logical AND: True if both operands are true."
operator_info["∨"]="Logical OR: True if at least one operand is true."
operator_info["¬"]="Logical NOT: Negates the truth value of its operand."
operator_info["⊕"]="Exclusive OR: True if exactly one operand is true."
operator_info["→"]="Implication: False only when the antecedent is true and the consequent is false."
operator_info["↔"]="If and only if (IFF): True when both operands have the same truth value."
operator_info["∃"]="Existential Quantifier: There exists at least one instance where the statement is true."
operator_info["∀"]="Universal Quantifier: The statement is true for all instances."
operator_info["∈"]="Element of: Indicates that an element belongs to a set."
operator_info["∉"]="Not an element of: Indicates that an element does not belong to a set."
operator_info["⊂"]="Subset: All elements of one set are contained in another set."
operator_info["⊃"]="Superset: Contains all elements of another set."
operator_info["∪"]="Union: Combines all unique elements from two or more sets."
operator_info["∩"]="Intersection: Contains elements common to all sets involved."
operator_info["∅"]="Empty Set: A set that contains no elements."
operator_info["ℕ"]="Natural Numbers: The set of positive integers (sometimes including 0)."
operator_info["ℤ"]="Integers: The set of all positive and negative whole numbers, including zero."
operator_info["ℚ"]="Rational Numbers: Numbers that can be expressed as a fraction of two integers."
operator_info["ℝ"]="Real Numbers: The set of all rational and irrational numbers."
operator_info["ℂ"]="Complex Numbers: Numbers with both real and imaginary parts."
operator_info["∞"]="Infinity: A concept of something without any limit."
operator_info["≈"]="Approximately equal: Indicates that two values are nearly equal."
operator_info["≠"]="Not equal: Indicates that two values are not equal."
operator_info["≤"]="Less than or equal to: Indicates that one value is less than or equal to another."
operator_info["≥"]="Greater than or equal to: Indicates that one value is greater than or equal to another."
operator_info["±"]="Plus-minus: Indicates a value that can be either positive or negative."
operator_info["×"]="Multiplication: The operation of multiplying two numbers."
operator_info["÷"]="Division: The operation of dividing one number by another."
operator_info["√"]="Square root: A value that, when multiplied by itself, gives the number under the radical."
operator_info["∑"]="Summation: The addition of a sequence of numbers."
operator_info["∏"]="Product: The multiplication of a sequence of numbers."
operator_info["∂"]="Partial derivative: The derivative of a function of several variables with respect to one variable."
operator_info["∇"]="Nabla or Del: A vector differential operator."
operator_info["∫"]="Integral: In calculus, used to calculate areas, volumes, and other quantities."
operator_info["∮"]="Contour integral: An integral taken along a path in a complex plane."
operator_info["∝"]="Proportional to: Indicates that two values have a constant ratio."
operator_info["°"]="Degree: A unit of measurement for angles or temperature."
operator_info["⊥"]="Perpendicular: Indicates that two lines are at right angles to each other."
operator_info["∠"]="Angle: A figure formed by two rays sharing a common endpoint."
operator_info["π"]="Pi: The ratio of a circle's circumference to its diameter, approximately 3.14159."
operator_info["ε"]="Epsilon: Often used to represent a small positive quantity."
operator_info["μ"]="Mu: Often used to represent the mean of a distribution in statistics."
operator_info["σ"]="Sigma: Often used to represent standard deviation in statistics."
operator_info["Ω"]="Omega: Often used to represent ohms in electrical engineering or the sample space in probability."
operator_info["α"]="Alpha: Often used to represent angular acceleration in physics."
operator_info["β"]="Beta: Often used to represent the standardized regression coefficient in statistics."
operator_info["γ"]="Gamma: Often used to represent the specific weight in physics."
operator_info["δ"]="Delta: Often used to represent a small change in a variable."
operator_info["θ"]="Theta: Often used to represent an angle in geometry."
operator_info["λ"]="Lambda: Often used to represent wavelength in physics."
operator_info["φ"]="Phi: Often used to represent the golden ratio in mathematics."
operator_info["ψ"]="Psi: Often used to represent the wave function in quantum mechanics."
operator_info["ω"]="Omega (lowercase): Often used to represent angular velocity in physics."
operator_info["ℏ"]="Planck constant: A fundamental constant of quantum mechanics."
operator_info["⟨"]="Left angle bracket: Often used in bra-ket notation in quantum mechanics."
operator_info["⟩"]="Right angle bracket: Often used in bra-ket notation in quantum mechanics."
operator_info["ℒ"]="Lagrangian: A function that summarizes the dynamics of a physical system."
operator_info["ℋ"]="Hamiltonian: A function used to describe the total energy of a system."
operator_info["⊗"]="Tensor product: An operation on two tensors that yields a tensor."
operator_info["⊕"]="Direct sum: A binary operation between two vector spaces."
operator_info["†"]="Hermitian conjugate: The conjugate transpose of a matrix."
operator_info["‖"]="Norm: A function that assigns a strictly positive length or size to a vector."
operator_info["→"]="Vector arrow: Indicates a vector quantity or an implication."
operator_info["⇌"]="Equilibrium: Indicates a reversible reaction in chemical equations."
operator_info["⇋"]="Reversible reaction: Indicates a reaction that can proceed in both directions."
operator_info["∴"]="Therefore: Used to indicate that a statement follows logically from previous statements."
operator_info["⟨|"]="Bra: In quantum mechanics, represents a row vector in the dual space of the ket vectors. Part of the bra-ket notation introduced by Paul Dirac."
operator_info["|⟩"]="Ket: In quantum mechanics, represents a column vector in a complex Hilbert space. Part of the bra-ket notation introduced by Paul Dirac."
operator_info["⟨|⟩"]="Braket: In quantum mechanics, represents the inner product of a bra and a ket. Used to calculate expectation values and transition amplitudes."

# Function to notify and print
notify_and_print() {
    local title="$1"
    local symbol="$2"
    local symbol_name="$3"
    
    if ! notify-send "$title" "$symbol $symbol_name"; then
        echo "Notification failed. $title: $symbol $symbol_name" >&2
    fi
    echo "Copied to clipboard: $symbol $symbol_name"
}

# Function to show additional info and handle user input
show_info() {
    local symbol="$1"
    local selected="$2"
    local message="${operator_info[$symbol]:-No additional information available for this symbol.}"
    
    local result=$(echo "$symbol" | rofi -dmenu -p "Info (Enter to copy, Esc to return):" -mesg "$message")
    local exit_code=$?

    if [ $exit_code -eq 0 ]; then
        # User pressed Enter, copy the symbol
        echo -n "$result" | xclip -selection clipboard
        notify_and_print "Copied to clipboard" "$result" "${selected#* }"
        return 0
    else
        # User pressed Esc, return to main menu
        return 1
    fi
}

# Main menu logic
while true; do
    selected=$(printf '%s\n' "${operators[@]}" | rofi -dmenu -i -p "Select logical operator:" -kb-custom-1 "Alt+i")
    
    exit_code=$?
    
    if [ $exit_code -eq 1 ]; then
        # User pressed Esc, exit the loop
        break
    elif [ $exit_code -eq 10 ]; then
        # User pressed Alt+i, show additional info
        symbol="${selected%% *}"
        show_info "$symbol" "$selected"
        # Continue the loop regardless of the show_info result
        continue
    else
        # User made a selection, copy to clipboard and exit
        symbol="${selected%% *}"
        echo -n "$symbol" | xclip -selection clipboard
        notify_and_print "Copied to clipboard" "$symbol" "${selected#* }"
        break
    fi
done
