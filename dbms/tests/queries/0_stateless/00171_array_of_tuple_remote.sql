SELECT arrayMap((x, y) -> (x, y), [1, 2, 3], [4, 5, 6]) FROM remote('localhost,127.0.0.{1,2}', system.one) ORDER BY rand();
