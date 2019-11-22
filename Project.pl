/*<Sudoku! Solver, This program was made to solve sudokus 9X9>
  Copyright (C) <2019>  <Pablo Pozos Aguilar>

  This program is free software: you can redistribute it and/or modify
  it under the terms of the GNU General Public License as published by
  the Free Software Foundation, either version 3 of the License, or
  (at your option) any later version.

  This program is distributed in the hope that it will be useful,
  but WITHOUT ANY WARRANTY; without even the implied warranty of
  MERCHANTABILITY or FITNESS FOR A PARTICULAR PURPOSE.  See the
  GNU General Public License for more details.

  You should have received a copy of the GNU General Public License
  along with this program.  If not, see <https://www.gnu.org/licenses/>.*/

/* Use of library bounds */
:-use_module(library(bounds)).

/*all_different([]).
all_different([X|Xs]) :-
  different(Xs,X),
  all_different(Xs).

different([],_).
different([Y|Ys],X) :-
  neq(X,Y,yes),
  different(Ys,X).*/

/* Validate if a line of elements the numbers are diferents and 1 to 9*/
validate_line(X):-all_different(X), X in 1..9.
/* Validate if the column all elements are diferentes */
validate_column(X):-all_different(X).
/* Validate the block if all elements are diferentes */
validate_square(X):-all_different(X).

sudoku(
        A1, A2, A3, A4, A5, A6, A7, A8, A9,
	B1, B2, B3, B4, B5, B6, B7, B8, B9,
	C1, C2, C3, C4, C5, C6, C7, C8, C9,
	D1, D2, D3, D4, D5, D6, D7, D8, D9,
	E1, E2, E3, E4, E5, E6, E7, E8, E9,
	F1, F2, F3, F4, F5, F6, F7, F8, F9,
	G1, G2, G3, G4, G5, G6, G7, G8, G9,
	H1, H2, H3, H4, H5, H6, H7, H8, H9,
	I1, I2, I3, I4, I5, I6, I7, I8, I9) :-
  /* For each of the sudoku rows the rows must be validated, when requesting that it be validated the row we are also indicating
  that the domain of each number is (1,9) */
  validate_line([A1,A2,A3,A4,A5,A6,A7,A8,A9]),
  validate_line([B1,B2,B3,B4,B5,B6,B7,B8,B9]),
  validate_line([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
  validate_line([D1,D2,D3,D4,D5,D6,D7,D8,D9]),
  validate_line([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
  validate_line([F1,F2,F3,F4,F5,F6,F7,F8,F9]),
  validate_line([G1,G2,G3,G4,G5,G6,G7,G8,G9]),
  validate_line([H1,H2,H3,H4,H5,H6,H7,H8,H9]),
  validate_line([I1,I2,I3,I4,I5,I6,I7,I8,I9]),
  /* Validate the columns */
  validate_column([A1,B1,C1,D1,E1,F1,G1,H1,I1]),
  validate_column([A2,B2,C2,D2,E2,F2,G2,H2,I2]),
  validate_column([A3,B3,C3,D3,E3,F3,G3,H3,I3]),
  validate_column([A4,B4,C4,D4,E4,F4,G4,H4,I4]),
  validate_column([A5,B5,C5,D5,E5,F5,G5,H5,I5]),
  validate_column([A6,B6,C6,D6,E6,F6,G6,H6,I6]),
  validate_column([A7,B7,C7,D7,E7,F7,G7,H7,I7]),
  validate_column([A8,B8,C8,D8,E8,F8,G8,H8,I8]),
  validate_column([A9,B9,C9,D9,E9,F9,G9,H9,I9]),
  /* Validate the squares */
  validate_square([A1,A2,A3,B1,B2,B3,C1,C2,C3]),
  validate_square([A4,A5,A6,B4,B5,B6,C4,C5,C6]),
  validate_square([A7,A8,A9,B7,B8,B9,C7,C8,C9]),
  validate_square([D1,D2,D3,E1,E2,E3,F1,F2,F3]),
  validate_square([D4,D5,D6,E4,E5,E6,F4,F5,F6]),
  validate_square([D7,D8,D9,E7,E8,E9,F7,F8,F9]),
  validate_square([G1,G2,G3,H1,H2,H3,I1,I2,I3]),
  validate_square([G4,G5,G6,H4,H5,H6,I4,I5,I6]),
  validate_square([G7,G8,G9,H7,H8,H9,I7,I8,I9]),
  /* Return values using the funcion label penteneciente a the library bound*/
  /* Label: */
  label([A1,A2,A3,A4,A5,A6,A7,A8,A9]),
  label([B1,B2,B3,B4,B5,B6,B7,B8,B9]),
  label([C1,C2,C3,C4,C5,C6,C7,C8,C9]),
  label([D1,D2,D3,D4,D5,D6,D7,D8,D9]),
  label([E1,E2,E3,E4,E5,E6,E7,E8,E9]),
  label([F1,F2,F3,F4,F5,F6,F7,F8,F9]),
  label([G1,G2,G3,G4,G5,G6,G7,G8,G9]),
  label([H1,H2,H3,H4,H5,H6,H7,H8,H9]),
  label([I1,I2,I3,I4,I5,I6,I7,I8,I9]),

  print(A1,A2,A3,A4,A5,A6,A7,A8,A9,
  B1,B2,B3,B4,B5,B6,B7,B8,B9,
  C1,C2,C3,C4,C5,C6,C7,C8,C9,
  D1,D2,D3,D4,D5,D6,D7,D8,D9,
  E1,E2,E3,E4,E5,E6,E7,E8,E9,
  F1,F2,F3,F4,F5,F6,F7,F8,F9,
  G1,G2,G3,G4,G5,G6,G7,G8,G9,
  H1,H2,H3,H4,H5,H6,H7,H8,H9,
  I1,I2,I3,I4,I5,I6,I7,I8,I9).


print(A1,A2,A3,B1,B2,B3,C1,C2,C3,
A4,A5,A6,B4,B5,B6,C4,C5,C6,
A7,A8,A9,B7,B8,B9,C7,C8,C9,
D1,D2,D3,E1,E2,E3,F1,F2,F3,
D4,D5,D6,E4,E5,E6,F4,F5,F6,
D7,D8,D9,E7,E8,E9,F7,F8,F9,
G1,G2,G3,H1,H2,H3,I1,I2,I3,
G4,G5,G6,H4,H5,H6,I4,I5,I6,
G7,G8,G9,H7,H8,H9,I7,I8,I9):-
write('___________________\n'),
write('|'),
write(A1),write(' '),write(A2),write(' '),write(A3),
write('|'),
write(B1),write(' '),write(B2),write(' '),write(B3),
write('|'),
write(C1),write(' '),write(C2),write(' '),write(C3),
write('|\n'),
write('|'),
write(A4),write(' '),write(A5),write(' '),write(A6),
write('|'),
write(B4),write(' '),write(B5),write(' '),write(B6),
write('|'),
write(C4),write(' '),write(C5),write(' '),write(C6),
write('|\n'),
write('|'),
write(A7),write(' '),write(A8),write(' '),write(A9),
write('|'),
write(B7),write(' '),write(B8),write(' '),write(B9),
write('|'),
write(C7),write(' '),write(C8),write(' '),write(C9),
write('|\n'),
write('___________________\n'),
write('|'),
write(D1),write(' '),write(D2),write(' '),write(D3),
write('|'),
write(E1),write(' '),write(E2),write(' '),write(E3),
write('|'),
write(F1),write(' '),write(F2),write(' '),write(F3),
write('|\n'),
write('|'),
write(D4),write(' '),write(D5),write(' '),write(D6),
write('|'),
write(E4),write(' '),write(E5),write(' '),write(E6),
write('|'),
write(F4),write(' '),write(F5),write(' '),write(F6),
write('|\n'),
write('|'),
write(D7),write(' '),write(D8),write(' '),write(D9),
write('|'),
write(E7),write(' '),write(E8),write(' '),write(E9),
write('|'),
write(F7),write(' '),write(F8),write(' '),write(F9),
write('|\n'),
write('___________________\n'),
write('|'),
write(G1),write(' '),write(G2),write(' '),write(G3),
write('|'),
write(H1),write(' '),write(H2),write(' '),write(H3),
write('|'),
write(I1),write(' '),write(I2),write(' '),write(I3),
write('|\n'),
write('|'),
write(G4),write(' '),write(G5),write(' '),write(G6),
write('|'),
write(H4),write(' '),write(H5),write(' '),write(H6),
write('|'),
write(I4),write(' '),write(I5),write(' '),write(I6),
write('|\n'),
write('|'),
write(G7),write(' '),write(G8),write(' '),write(G9),
write('|'),
write(H7),write(' '),write(H8),write(' '),write(H9),
write('|'),
write(I7),write(' '),write(I8),write(' '),write(I9),
write('|\n'),
write('___________________\n').

/* sudoku( _,6,_,1,7,_,_,5,_,
_,_,8,3,_,5,6,_,_,
2,_,_,_,_,_,_,_,1,
8,_,_,4,_,7,_,_,6,
_,_,6,_,_,_,3,_,_,
7,_,_,9,_,1,_,_,4,
5,_,9,_,_,_,_,_,2,
_,_,7,2,_,6,9,_,_,
_,4,_,5,_,8,_,7,_).*/

/*sudoku(5,3,_,_,7,_,_,_,_,
6,_,_,1,9,5,_,_,_,
_,9,8,_,_,_,_,6,_,
8,_,_,_,6,_,_,_,3,
4,_,_,8,_,3,_,_,1,
7,_,_,_,2,_,_,_,6,
_,6,_,_,_,_,2,8,_,
_,_,_,4,1,9,_,_,5,
_,_,_,_,8,_,_,7,9).*/
