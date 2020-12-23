ENTITY parity_gen IS
	GENERIC (size: integer := 8); -- É similar á um #define size 8
	PORT (input: in bit_vector(size-1 downto 0); 
			output: out bit);
END parity_gen;

ARCHITECTURE parity OF parity_gen IS 
	SIGNAL boxes: bit_vector(size downto 0);
BEGIN
	laco: for i in 0 to size-1 generate 
		boxes(i+1)<=input(i) xor boxes(i);
	end generate;

	output<=boxes(size);
END parity;
