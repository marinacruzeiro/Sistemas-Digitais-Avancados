-- Multiplicador Sequencial
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;
LIBRARY WORK;
USE WORK.type_array.all;

ENTITY MultiplicadorSequencial IS
	
	GENERIC (N: INTEGER := 4);
	PORT (
			MR, MD: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			PR: OUT STD_LOGIC_VECTOR ((N*2)-1 DOWNTO 0) -- dobro de bits do que está sendo multiplicado
			);

END MultiplicadorSequencial;

ARCHITECTURE behavior OF MultiplicadorSequencial IS

	-- Componentes:
	COMPONENT RippleCarry
		
		GENERIC (N: INTEGER := 4);
		PORT (
				A, B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
				Carry_in: IN STD_LOGIC;
				Carry_out: OUT STD_LOGIC;
				output: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
				);
	
	END COMPONENT;
	
	COMPONENT mux_2to1

		PORT (
				inputA, inputB: IN STD_LOGIC_VECTOR(3 DOWNTO 0);
				sel: IN STD_LOGIC;
				output: OUT STD_LOGIC_VECTOR(3 DOWNTO 0)
				);
		
	END COMPONENT;
---------------------------------------------------------
	-- Signals
	SIGNAL half_prod_vec, other_half_prod_vec, half_prod_vec2: STD_LOGIC_VECTOR(3 DOWNTO 0);
	
	SIGNAL half_prod: half_product;
	SIGNAL other_half_prod: half_product;
	SIGNAL prod: half_product;
	SIGNAL out_mux: output_mux;
	SIGNAL sig_carry_out: STD_LOGIC_VECTOR(4 DOWNTO 0);
	SIGNAL sig_concat: concatenated;
	SIGNAL sig_MR: MR_concatenated;
---------------------------------------------------------
	BEGIN
		
		half_prod_vec <= "0000";
		other_half_prod_vec <= "0000";
		
		Mux1: mux_2to1 PORT MAP (inputA => "0000", inputB => MD, sel => MR(0), output => out_mux(0));
		
		sig_MR(0) <= '0' & MR(3 DOWNTO 1);
				
		Sum1: RippleCarry PORT MAP (A => half_prod_vec, B => out_mux(0), Carry_in => '0', Carry_out => sig_carry_out(0), output => half_prod_vec2);
		
		sig_concat(0) <= sig_carry_out(0) & half_prod_vec2 & other_half_prod_vec(3 DOWNTO 1);
		
		----------------------------
		
		multi: FOR i IN 0 TO N-2 GENERATE
			
			half_prod(i) <= sig_concat(i)(7 DOWNTO 4);
			other_half_prod(i) <= sig_concat(i)(3 DOWNTO 0);
			
			Mux2: mux_2to1 PORT MAP (inputA => "0000", inputB => MD, sel => sig_MR(i)(0), output => out_mux(i+1));
				
			sig_MR(i+1) <= '0' & MR(3 DOWNTO 1);
			
	Sum2: RippleCarry PORT MAP (A => half_prod(i), B => out_mux(i+1), Carry_in => '0', Carry_out => sig_carry_out(i+1), output => prod(i));
		
			sig_concat(i+1) <= sig_carry_out(i+1) & prod(i) & other_half_prod(i)(3 DOWNTO 1);	
		
		END GENERATE;
		----------------------------
		--TESTE:
		PR <= sig_concat(3);
	
END behavior;