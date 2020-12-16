delete from user_role;
delete from usr;

insert into usr(id, active, password, username) values
(1, true, '$2a$08$kkE4v1rJFErspZYc28I96OUS9C6KMmTdZn5ot0LY1Z/N0r7bSdPLi', 'admin'),
(2, true, '$2a$08$FKKVUmZzRT93f762wRD/SuqKBM.rFDDAaLFkJn8uk/RCiWDa.OTd.', 'pasha');

insert into user_role(user_id, roles) values
(1, 'USER'), (1, 'ADMIN'),
(2, 'USER');