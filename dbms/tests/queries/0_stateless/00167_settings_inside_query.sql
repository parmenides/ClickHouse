SELECT min(number) FROM system.numbers WHERE toUInt64(number % 1000) IN (SELECT DISTINCT blockSize() FROM system.numbers SETTINGS max_block_size = 123, max_rows_to_read = 1000, read_overflow_mode = 'break') SETTINGS max_rows_to_read = 1000000, read_overflow_mode = 'break';
SELECT * FROM (SELECT DISTINCT blockSize() AS x FROM system.numbers SETTINGS max_block_size = 123, max_rows_to_read = 1000, read_overflow_mode = 'break');
SELECT x FROM (SELECT DISTINCT blockSize() AS x FROM remote('localhost,127.0.0.{1,2}', system.numbers) WHERE number IN (SELECT number * 2 FROM system.numbers SETTINGS max_rows_to_read = 10000, read_overflow_mode = 'break') SETTINGS max_block_size = 123, max_rows_to_read = 1000, read_overflow_mode = 'break') ORDER BY x;
