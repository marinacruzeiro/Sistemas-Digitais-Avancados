-- Trabalho de Sistemas Digitais Avançados
-- Marina Cruzeiro 

LIBRARY	IEEE;
USE IEEE.std_logic_1164.all;
USE IEEE.NUMERIC_STD.ALL;
LIBRARY work;
USE work.type_array2.all;

ENTITY datapath IS

	PORT (
			
			OpCode : IN STD_LOGIC_VECTOR (5 DOWNTO 0);
			Rs, Rt, Rd : IN STD_LOGIC_VECTOR (4 DOWNTO 0);
			constante, dado_entrada : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
			BCte, DEntULA, clock, clear : IN STD_LOGIC;
			dado_saida, saida_end, saida_final : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
			);

END datapath;

ARCHITECTURE comportamento OF datapath IS

   -------------------------------------------------------------
	COMPONENT bancoCompleto
		PORT (
				data_in : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				selectC : IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				clock, clear : IN STD_LOGIC;
				data_out1 : OUT array_reg
				);
	END COMPONENT;

	COMPONENT mux5para32A
		PORT (
				sel_A: IN STD_LOGIC_VECTOR(4 DOWNTO 0);
				data_in: IN array_reg; 
				data_out_A: OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
				);
	END COMPONENT;
	
	COMPONENT mux_cte
		PORT (
				data_b, const : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				sel : IN STD_LOGIC;
				data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
				);
	END COMPONENT;
	
	COMPONENT ULA
		PORT (
				data_a, data_b : IN STD_LOGIC_VECTOR(7 DOWNTO 0);
				OpCode : IN STD_LOGIC_VECTOR(5 DOWNTO 0);
				data_out : OUT STD_LOGIC_VECTOR(7 DOWNTO 0) 
				);
	END COMPONENT;
	
	COMPONENT mux_saida
		PORT (
				data_ula, data_ent : IN STD_LOGIC_VECTOR (7 DOWNTO 0);
				sel : IN STD_LOGIC;
				data_out : OUT STD_LOGIC_VECTOR (7 DOWNTO 0)
				);
	END COMPONENT;
	
	-----------------------------------------------------------------

	SIGNAL arrayBanco : array_reg;
	SIGNAL B, dadoS, dadoE, saidaULA, saidaMUX : STD_LOGIC_VECTOR (7 DOWNTO 0);

	-----------------------------------------------------------------

	BEGIN
		
		BANCO: bancoCompleto PORT MAP (data_in => saidaMUX, selectC => Rd, clock => clock, clear => clear, data_out1 => arrayBanco);
		
		muxA: mux5para32A PORT MAP (sel_A => Rs, data_in => arrayBanco, data_out_A => dadoE);
		
		saida_end <= dadoE;
		
		muxB: mux5para32A PORT MAP (sel_A => Rt, data_in => arrayBanco, data_out_A => B);
				
		muxCte: mux_cte PORT MAP (data_b => B, const => constante, sel => BCte, data_out => dadoS);
		
		dado_saida <= dadoS;
		
		ula1: ULA PORT MAP (data_a => dadoE, data_b => dadoS, OpCode => OpCode, data_out => saidaULA);
		
		ultimo_mux: mux_saida PORT MAP (data_ula => saidaULA, data_ent => dado_entrada, sel => DEntULA, data_out => saidaMUX);

		saida_final <= saidaMUX;
		
END comportamento;