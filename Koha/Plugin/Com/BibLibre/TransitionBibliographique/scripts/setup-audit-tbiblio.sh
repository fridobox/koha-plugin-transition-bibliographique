#!/bin/bash

# mysql -e "DROP TABLE IF EXISTS audit_tb;"

mysql -e "
    CREATE TABLE audit_tb (
      audit_id int(11) NOT NULL AUTO_INCREMENT,
      timestamp timestamp NOT NULL default CURRENT_TIMESTAMP on update CURRENT_TIMESTAMP, -- date d exécution de l audit
      check_marcfield_009  tinyint(1) NOT NULL, -- presence du 009
      check_marcfield_033a tinyint(1) NOT NULL,
      check_marcfield_181c tinyint(1) NOT NULL,
      check_marcfield_182c tinyint(1) NOT NULL,
      check_marcfield_183c tinyint(1) NOT NULL,
      check_marcfield_219  tinyint(1)  NOT NULL,
      count_marcfield_009  int(11) NOT NULL, -- nombre de 009 renseignés
      count_marcfield_033a int(11) NOT NULL,
      count_marcfield_181c int(11) NOT NULL,
      count_marcfield_182c int(11) NOT NULL,
      count_marcfield_183c int(11) NOT NULL,
      count_marcfield_219  int(11) NOT NULL,
      count_bnf_ark        int(11) NOT NULL, -- nombre de notices avec un ARK BnF (en 033a)
      count_sudoc_ppn      int(11) NOT NULL, -- nombre de notices avec un PPN Abes (en 009 ou 033a)
      count_ids_in_033a    int(11) NOT NULL,  -- nombre de notices avec autre chose qu un ARK BnF ou PPB
      count_biblios  int(11) NOT NULL, -- nombre de biblio
      count_aligned_biblios  int(11) NOT NULL, -- nombre de biblios considerees comme alignees
      tb_score  int(11) NOT NULL,  -- score peut etre a retirer
      quality_score  int(11) NOT NULL,  -- score de qualite des donnees sera renseigne plus tard
      PRIMARY KEY (audit_id)
    ) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;
"

# mysql -e "insert into audit_tb values  (1, NOW(),1,1,0,0,0, 1,2304,0,0,23, 123,343,50,334,2.5, 289343, 45223, 3,0);"
# mysql -e "insert into audit_tb values  (2, NOW(),1,1,1,0,0, 1,2544,0,0,23, 223,344,50,334,3, 289344, 45244, 4,0);"
# mysql -e "insert into audit_tb values  (3, NOW(),1,1,1,1,0, 1,2894,0,0,26, 423,355,50,534,3, 289353, 45243, 4,0);"