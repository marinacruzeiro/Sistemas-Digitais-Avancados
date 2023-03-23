-- Multiplicador Matricial - Ripple Carry
-- Trabalho de Sistemas Digitais Avançados
-- Fabricio Teixeira, Marina Cruzeiro

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
use IEEE.STD_LOGIC_ARITH.ALL;

ENTITY RippleCarry IS
	
	GENERIC (N: INTEGER := 32);
	PORT (
			A, B: IN STD_LOGIC_VECTOR (N-1 DOWNTO 0);
			Carry_in: IN STD_LOGIC;
			Carry_out: OUT STD_LOGIC;
			output: OUT STD_LOGIC_VECTOR (N-1 DOWNTO 0)
			);

END RippleCarry;

ARCHITECTURE behavior OF RippleCarry IS

	-- Components
	COMPONENT adder
	
		PORT (
				inA, inB, Cin: IN STD_LOGIC;
				output, carry: OUT STD_LOGIC
				);
	
	END COMPONENT;
	
---------------------------------------------------------
	
	-- Signals
	SIGNAL carry_signal: STD_LOGIC_VECTOR (N-1 DOWNTO 0);
	
---------------------------------------------------------
	
	BEGIN
		
		adder01: adder PORT MAP (inA => A(0), inB => B(0), Cin => carry_in, output => output(0), carry => carry_signal(0));
		
		RC_adder: FOR i IN 1 TO N-1 GENERATE
						RC: adder PORT MAP (inA => A(i), inB => B(i), Cin => carry_signal(i-1), output => output(i), carry => carry_signal(i));
		END GENERATE;
		
		Carry_out <= carry_signal(N-1);
		
END behavior;