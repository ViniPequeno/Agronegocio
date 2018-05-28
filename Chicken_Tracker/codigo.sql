use chickentracker;
insert into perfil (usuario, email, nome, senha, foto) values ('pedro', 'pedro@gmail.com','Pedro Vinícius', 'pedro123', '../imagensUsuario/pedro.png');
insert into perfil (usuario, email, nome, senha, foto) values ('yan', 'yan@gmail.com','Victor Yan', 'victor123', '../imagensUsuario/yan.png');
insert into perfil (usuario, email, nome, senha, foto) values ('gabriel', 'gabriel@gmail.com','Gabriel San Martin', 'gabriel123', '../imagensUsuario/gabriel.png');
insert into perfil (usuario, email, nome, senha, foto) values ('wyller', 'wyller@gmail.com','Wyller Douglas', 'wyller123', '../img/farmer.jpg');


insert into negocio (empresaCNPJ, email, linkFacebook, userInstagram, lucroTotal, nome, telefone1, telefone2, perfil_id) 
values ('11111111', 'negocio1@gmail.com', 'facebook.com/negocio1', 'negocio1', 0.0, 'negocio1', '4002-8922', '99321-3232', 'pedro');

insert into negocio (empresaCNPJ, email, linkFacebook, userInstagram, lucroTotal, nome, telefone1, telefone2, perfil_id) 
values ('22222222', 'negocio2@gmail.com', 'facebook.com/negocio2', 'negocio2', 0.0, 'negocio2', '4002-8922', '99321-3232', 'pedro');

insert into negocio (empresaCNPJ, email, linkFacebook, userInstagram, lucroTotal, nome, perfil_id) 
values ('33333333', 'negocio3@gmail.com', 'facebook.com/negocio3', 'negocio3', 0.0, 'negocio3', 'yan');

insert into negocio (empresaCNPJ, email, linkFacebook, userInstagram, lucroTotal, nome, perfil_id) 
values ('44444444', 'negocio4@gmail.com', 'facebook.com/negocio4', 'negocio4', 0.0, 'negocio4', 'yan');

insert into negocio (empresaCNPJ, email, linkFacebook, userInstagram, lucroTotal, nome, perfil_id) 
values ('55555555', 'negocio5@gmail.com', 'facebook.com/negocio5', 'negocio5', 0.0, 'negocio5', 'gabriel');

insert into negocio (empresaCNPJ, email, linkFacebook, userInstagram, lucroTotal, nome, perfil_id) 
values ('66666666', 'negocio6@gmail.com', 'facebook.com/negocio6', 'negocio6', 0.0, 'negocio6', 'gabriel');

insert into negocio (empresaCNPJ, email, linkFacebook, userInstagram, lucroTotal, nome, perfil_id) 
values ('77777777', 'negocio7@gmail.com', 'facebook.com/negocio7', 'negocio7', 0.0, 'negocio7', 'wyller');

insert into negocio (empresaCNPJ, email, linkFacebook, userInstagram, lucroTotal, nome, perfil_id) 
values ('88888888', 'negocio8@gmail.com', 'facebook.com/negocio8', 'negocio8', 0.0, 'negocio8', 'wyller');


insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('67253-234', '12345', 'Distrito Industrial', 'Manaus', 'Amazonas', 'Rua das Flores Violetas', 10.0, '0001', '11111111');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('32476-094', '12345', 'Armando Mendes', 'Manaus', 'Amazonas', 'Rua das Flores Castanhas', 78320.0, '0002', '11111111');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('32673-783', '12345', 'Floresta Park', 'Manaus', 'Amazonas', 'Rua das Botões', 1323.0, '0001', '22222222');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('43254-323', '12345', 'Aleixo', 'Manaus', 'Amazonas', 'Rua das Flores Cinzas', 100.0, '0002', '22222222');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('34567-323', '12345', 'Casa do Sr. C', 'Campinas', 'São Paulo', 'Rua das Ruas', 666.0, '0001', '33333333');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('43432-43', '12345', 'Reservado', 'Pão', 'Minas Gerais', 'Rua Padre Amaro', 3230.0, '0001', '44444444');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('54894-655', '12345', 'Viagem Doce', 'Japurá', 'Piauí', 'Rua das Abelhas Assassinas', 3220.0, '0001', '55555555');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('78022-534', '12345', 'Laira', 'Pirassununga', 'São Paulo', 'Rua Fica Frio Aí', 0.0, '0001', '66666666');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('54894-655', '12345', 'Havana Uh Na Na', 'Aloha', 'Havaí', 'Rua Half Of My Heart', 0.0, '0001', '77777777');

insert into estabelecimento (CEP, CNAE, bairro, cidade, estado, rua, saldo, sufixoCNPJ_id, negocio_id)
values ('54894-655', '12345', 'Dont', 'Stop', 'The Party', 'Dont Dont Dont Dont', 0.0, '0001', '88888888');


insert into funcionario (CPF, RG, nome) values ('50418263906', '320023059', 'funcionario1');
insert into funcionario (CPF, RG, nome) values ('08953614260', '189194443', 'funcionario2');

insert into estabelecimentofuncionario (Id, cargo, salario, situacao, estabelecimento_id, funcionario_id)
values (1, 'desenvolvedor junior', 1000.0, 'A', '1', '50418263906');

insert into estabelecimentofuncionario (Id, cargo, salario, situacao, estabelecimento_id, funcionario_id)
values (2, 'cozinheiro', 2000.0, 'I', '2', '08953614260');

insert into produto (codigo, descricao, nome, quantidadeAtual, quantidadeMaxima, quantidadeMinima, tipo, estabelecimento_id)
values (1234, 'produto para comer', 'ração para criança', 20, 40, 10, 'E', 42345);

insert into produto (codigo, descricao, nome, quantidadeAtual, quantidadeMaxima, quantidadeMinima, tipo, estabelecimento_id)
values (1235, 'produto para limpeza', 'água H20', 100, 300, 10, 'E', 42346);


insert into fornecimento (id, CNPJ, pagamento, quantidade, tipo, vencimento, estabelecimento_id, produto_id)
values (1010, 92495378000121, 159800, 10, 'V', '3456-12-11 11:11:11', 42346, 1234);

insert into fornecimento (id, CNPJ, pagamento, quantidade, tipo, vencimento, estabelecimento_id, produto_id)
values (2020, 02989502000112, 3456, 20, 'V', '3335-10-09 01:02:03', 42346, 1235);

insert into fornecimento (id, CNPJ, pagamento, quantidade, tipo, vencimento, estabelecimento_id, produto_id)
values (3030, 92495378000122, 159800, 192, 'C', '3456-12-11 11:11:11', 42346, 1234);

insert into fornecimento (id, CNPJ, pagamento, quantidade, tipo, vencimento, estabelecimento_id, produto_id)
values (4040, 02989502000133, 3456, 80, 'C', '2223-08-02 09:45:54', 42346, 1235);

INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('1', '2018', 'q', '28', '5', 'D', '1234', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('2', '2018', 'q', '28', '5', 'G', '2345', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('3', '2018', 'q', '27', '5', 'D', '3456', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('4', '2018', 'q', '27', '5', 'G', '4567', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('5', '2018', 'q', '26', '5', 'D', '5678', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('6', '2018', 'q', '26', '5', 'G', '6789', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('7', '2018', 'q', '25', '5', 'D', '7890', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('8', '2018', 'q', '25', '5', 'G', '0987', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('9', '2018', 'q', '24', '5', 'D', '9876', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('10', '2018', 'q', '24', '5', 'G', '8765', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('11', '2018', 'q', '23', '5', 'D', '7654', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('12', '2018', 'q', '23', '5', 'G', '6543', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('13', '2018', 'q', '22', '5', 'D', '5432', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('14', '2018', 'q', '22', '5', 'G', '4321', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('15', '2018', 'q', '21', '4', 'D', '2121', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('16', '2018', 'q', '21', '4', 'G', '4141', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('17', '2018', 'q', '28', '3', 'D', '3131', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('18', '2018', 'q', '27', '3', 'G', '6785', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('19', '2018', 'q', '28', '2', 'D', '3465', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('20', '2018', 'q', '27', '2', 'G', '2631', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('21', '2018', 'q', '28', '1', 'D', '9348', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('22', '2018', 'q', '27', '1', 'G', '5674', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('23', '2017', 'q', '28', '12', 'D', '7365', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('24', '2017', 'q', '27', '12', 'G', '3321', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('25', '2017', 'q', '28', '11', 'D', '7864', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('26', '2017', 'q', '27', '10', 'G', '4532', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('27', '2017', 'q', '28', '9', 'D', '9678', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('28', '2017', 'q', '27', '8', 'G', '8080', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('29', '2017', 'q', '28', '7', 'D', '1212', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('30', '2017', 'q', '27', '6', 'G', '9898', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('31', '2017', 'q', '28', '5', 'D', '8787', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('32', '2017', 'q', '27', '4', 'G', '6565', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('33', '2017', 'q', '28', '3', 'D', '2323', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('34', '2017', 'q', '27', '5', 'G', '2345', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('35', '2018', 'q', '20', '5', 'D', '1234', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('36', '2018', 'q', '20', '5', 'G', '2345', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('37', '2018', 'q', '19', '5', 'D', '3456', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('38', '2018', 'q', '19', '5', 'G', '4567', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('39', '2018', 'q', '18', '5', 'D', '5678', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('40', '2018', 'q', '18', '5', 'G', '6789', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('41', '2018', 'q', '17', '5', 'D', '7890', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('42', '2018', 'q', '17', '5', 'G', '0987', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('43', '2018', 'q', '16', '5', 'D', '9876', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('44', '2018', 'q', '16', '5', 'G', '8765', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('45', '2018', 'q', '15', '5', 'D', '7654', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('46', '2018', 'q', '15', '5', 'G', '6543', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('47', '2018', 'q', '14', '5', 'D', '5432', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('48', '2018', 'q', '14', '5', 'G', '4321', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('49', '2018', 'q', '13', '5', 'D', '2121', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('50', '2018', 'q', '13', '5', 'G', '4141', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('51', '2018', 'q', '12', '5', 'D', '3131', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('52', '2018', 'q', '12', '5', 'G', '6785', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('53', '2018', 'q', '11', '5', 'D', '3465', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('54', '2018', 'q', '11', '5', 'G', '2631', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('55', '2018', 'q', '10', '5', 'D', '9348', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('56', '2018', 'q', '10', '5', 'G', '5674', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('57', '2018', 'q', '9', '5', 'D', '7365', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('58', '2018', 'q', '9', '5', 'G', '3321', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('59', '2018', 'q', '8', '5', 'D', '7864', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('60', '2018', 'q', '8', '5', 'G', '4532', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('61', '2018', 'q', '7', '5', 'D', '9678', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('62', '2018', 'q', '7', '5', 'G', '8080', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('63', '2018', 'q', '6', '5', 'D', '1212', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('64', '2018', 'q', '6', '5', 'G', '9898', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('65', '2018', 'q', '5', '5', 'D', '8787', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('66', '2018', 'q', '5', '5', 'G', '6565', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('67', '2018', 'q', '4', '5', 'D', '2323', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('68', '2018', 'q', '4', '5', 'G', '2345', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('69', '2018', 'q', '3', '5', 'D', '1234', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('70', '2018', 'q', '3', '5', 'G', '2345', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('71', '2018', 'q', '2', '5', 'D', '3456', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('72', '2018', 'q', '2', '5', 'G', '4567', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('73', '2018', 'q', '1', '5', 'D', '5678', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('74', '2018', 'q', '1', '5', 'G', '6789', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('75', '2018', 'q', '30', '4', 'D', '7890', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('76', '2018', 'q', '30', '4', 'G', '0987', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('77', '2018', 'q', '29', '4', 'D', '9876', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('78', '2018', 'q', '29', '4', 'G', '8765', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('79', '2018', 'q', '28', '4', 'D', '7654', '1');
INSERT INTO `chickenTracker`.`pagamento` (`id`, `ano`, `descricao`, `dia`, `mes`, `tipo`, `valor`, `estabelecimento_id`) VALUES ('80', '2018', 'q', '28', '4', 'G', '6543', '1');