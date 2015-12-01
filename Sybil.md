Problems
========

'
Sybil attack ----> Stranger Allowance Abuse (SAA):
             \
              ---> Cluster Reputation Frogery (CRF) 
'


SAA:
--- 
  Networks must have some way to let new users with no reputation into the network.
  This tolerance can be abused by an attacker creating new identities, making use of the stranger allowance, and then abandoning the identity.

CRF:
---
  Peers can 'give' reputation to others by some means, in this case by acknowledging uploading from the other users.
  An attacker can create a cluster of identities, generating reputation for each other, without being of actual benefit to the users.

Solutions
=========
CRF:
---
* Caclulate reputation based on a grid of resistors.
* Download/Uploads are seen as *directional resistors*.
* Reputation is not a property of a node, but a property of a path between nodes.
* Reputation is calculated as the equivalent resistance between two nodes.
* The value of the resistor is determined by the data size. (MBs)
* Depth of the crawl increases accuracy, but the algoritm converges fast.
* Multichain keeps track of the transactions.



SAA:
---
Initiation of node A (with no reputation) into the network.
1. A broadcasts a request inititate message.
2. B offers an initiation.
3. A checks the reputation of B.
4. A downloads blocks with hash % 2 = 0 from B. B allows this, even though A has no reputatation.
5. A seeds the blocks and gains reputation.

A cannot gain any advantage from abusing the initiate by only downloading. It can however attempt to criple the network.
This can be made more costly by B serving A a Proof of work puzzle before uploading.