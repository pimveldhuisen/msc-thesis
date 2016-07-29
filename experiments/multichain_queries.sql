# Number of blocks in database
SELECT COUNT(*) FROM multi_chain;

# Number of distinct public_keys
SELECT count(*) FROM (SELECT public_key_requester AS key FROM multi_chain UNION SELECT public_key_responder AS key FROM multi_chain);

# Number of blocks per identity
SELECT hex(key), count(*) FROM (SELECT public_key_requester AS key, previous_hash_requester AS prev FROM multi_chain UNION SELECT public_key_responder AS key, previous_hash_responder AS prev FROM multi_chain) GROUP BY key ORDER BY COUNT(*) DESC;

# Reuse of key, sequence number pair (should return no results)
SELECT hex(key), num, COUNT(*) FROM (SELECT public_key_requester AS key, sequence_number_requester AS num FROM multi_chain UNION SELECT public_key_responder AS key, sequence_number_responder AS num FROM multi_chain) GROUP BY key, num HAVING COUNT(*) > 1 ORDER BY key, num;

# Reuse of previous_hash (should return no results)
SELECT hex(prev), COUNT(*) FROM (SELECT previous_hash_requester AS prev FROM multi_chain UNION SELECT previous_hash_responder AS prev from multi_chain) GROUP BY prev HAVING count(*) > 1 ORDER BY prev;

# Total up and down in MB per identity
SELECT hex(key), total_up, total_down FROM (	SELECT public_key_requester AS key, MAX(total_up_requester) AS total_up, MAX(total_down_requester) AS total_down FROM multi_chain GROUP BY key 
						UNION
 						SELECT public_key_responder AS key, MAX(total_up_responder) AS total_up, MAX(total_down_responder) AS total_down FROM multi_chain GROUP BY key
						) GROUP BY key ORDER BY total_up;
