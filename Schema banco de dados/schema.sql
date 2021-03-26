CREATE TABLE `Pedido` (
	`id` int NOT NULL AUTO_INCREMENT,
	`id_cliente` int NOT NULL,
	`id_situacao` int NOT NULL,
	`preco_total` double NOT NULL,
	`data` date NOT NULL,
	`data_retirada` DATE NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `cliente` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nome_completo` varchar (255) NOT NULL,
	`credito` FLOAT NOT NULL,
	`picpay` varchar (255) NOT NULL,
	`pix` varchar (255) NOT NULL,
	`email` varchar (255) NOT NULL,
	`professor` bool NOT NULL,
	`aluno` bool NOT NULL,
	`visitante` bool NOT NULL,
	`administrativo` bool NOT NULL,
	`celular` varchar (255) NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `recarga` (
	`id` int NOT NULL AUTO_INCREMENT,
	`data` date NOT NULL,
	`valor_recarga` double NOT NULL,
	`id_cliente` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `categoria` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nome` varchar (255) NOT NULL,
	`subcategoria` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `produto` (
	`id` int NOT NULL AUTO_INCREMENT,
	`descricao` varchar (255) NOT NULL,
	`preco` double NOT NULL,
	`disponivel` BOOLEAN NOT NULL,
	`id_categoria` int NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `item_pedido` (
	`id` int NOT NULL AUTO_INCREMENT,
	`id_pedido` int NOT NULL,
	`id_produto` int NOT NULL,
	`quantidade` int NOT NULL,
	`preco_unitario` double NOT NULL,
	PRIMARY KEY (`id`)
);

CREATE TABLE `situacao_pedido` (
	`id` int NOT NULL AUTO_INCREMENT,
	`nome` varchar (255) NOT NULL,
	PRIMARY KEY (`id`)
);

ALTER TABLE `Pedido` ADD CONSTRAINT` Pedido_fk0` FOREIGN KEY (`id_cliente`) REFERENCES ` cliente` (`id`);

ALTER TABLE `Pedido` ADD CONSTRAINT` Pedido_fk1` FOREIGN KEY (`id_situacao`) REFERENCES` situacao_pedido` (`id`);

ALTER TABLE `recarga` ADD CONSTRAINT` recarga_fk0` FOREIGN KEY (`id_cliente`) REFERENCES` cliente` (`id`);

ALTER TABLE `categoria` ADD CONSTRAINT` categoria_fk0` FOREIGN KEY (`subcategoria`) REFERENCES` categoria` (`id`);

ALTER TABLE `produto` ADD CONSTRAINT` produto_fk0` FOREIGN KEY (`id_categoria`) REFERENCES` categoria` (`id`);

ALTER TABLE `item_pedido` ADD CONSTRAINT` item_pedido_fk0` FOREIGN KEY (`id_pedido`) REFERENCES` Pedido` (`id`);

ALTER TABLE `item_pedido` ADD CONSTRAINT` item_pedido_fk1` FOREIGN KEY (`id_produto`) REFERENCES` produto` (`id`);
