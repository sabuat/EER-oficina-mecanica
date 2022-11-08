CREATE TABLE `Cliente` (
	`IdCliente` int(255) NOT NULL AUTO_INCREMENT,
	`Cnome` varchar(255) NOT NULL,
	`Vehi_cliente` int(255) NOT NULL,
	`Orden_serv` int(255) NOT NULL,
	PRIMARY KEY (`IdCliente`)
);

CREATE TABLE `Orden de Serviço` (
	`idOS` int NOT NULL AUTO_INCREMENT,
	`Cliente_OS` int NOT NULL,
	`Vehiculo_OS` int NOT NULL,
	`Team_OS` int NOT NULL UNIQUE,
	`Valor_OS` FLOAT NOT NULL UNIQUE,
	`Data_in` DATE NOT NULL UNIQUE,
	`Data_out` DATE NOT NULL UNIQUE,
	`Status_OS` BOOLEAN NOT NULL UNIQUE,
	`Serviço_OS` int NOT NULL,
	`Peça_OS` int NOT NULL,
	PRIMARY KEY (`idOS`)
);

CREATE TABLE `Mecanico` (
	`IdMecanico` int NOT NULL AUTO_INCREMENT,
	`Nome_mec` varchar(255) NOT NULL,
	`Espec_mec` varchar(255) NOT NULL UNIQUE,
	`TEAM_mec` int(255) NOT NULL,
	PRIMARY KEY (`IdMecanico`)
);

CREATE TABLE `TEAMS` (
	`IdTeam` int NOT NULL AUTO_INCREMENT,
	`Name_team` varchar(255) NOT NULL UNIQUE,
	`Membro_team` int(255) NOT NULL,
	PRIMARY KEY (`IdTeam`)
);

CREATE TABLE `Serviço` (
	`IdServiço` int NOT NULL AUTO_INCREMENT,
	`Nome_serv` varchar(255) NOT NULL UNIQUE,
	`Valor_serv` FLOAT(255) NOT NULL UNIQUE,
	`TEAM_serv` int(255) NOT NULL,
	PRIMARY KEY (`IdServiço`)
);

CREATE TABLE `Peças` (
	`IdPeças` int NOT NULL AUTO_INCREMENT,
	`Nome_peça` varchar(255) NOT NULL UNIQUE,
	`Valor_peça` varchar(255) NOT NULL UNIQUE,
	`TEAM_serv` int(255) NOT NULL,
	PRIMARY KEY (`IdPeças`)
);

CREATE TABLE `Vehiculo` (
	`IdVehiculo` int NOT NULL AUTO_INCREMENT,
	`Marca` varchar(255) NOT NULL UNIQUE,
	`Modelo` varchar(255) NOT NULL UNIQUE,
	`Placa` varchar(255) NOT NULL UNIQUE,
	`Serial` varchar(255) NOT NULL UNIQUE,
	`Proprietario` int NOT NULL UNIQUE,
	PRIMARY KEY (`IdVehiculo`,`Proprietario`)
);

CREATE TABLE `Status_OS` (
	`IdOS` int NOT NULL,
	`Status` BOOLEAN NOT NULL UNIQUE,
	`Responsable` int NOT NULL,
	PRIMARY KEY (`IdOS`)
);

CREATE TABLE `Valor _OS` (
	`IdOS` int NOT NULL,
	`Valor_serv` FLOAT NOT NULL,
	`Valor_peça` FLOAT NOT NULL,
	PRIMARY KEY (`IdOS`)
);

ALTER TABLE `Cliente` ADD CONSTRAINT `Cliente_fk0` FOREIGN KEY (`Vehi_cliente`) REFERENCES `Vehiculo`(`IdVehiculo`);

ALTER TABLE `Cliente` ADD CONSTRAINT `Cliente_fk1` FOREIGN KEY (`Orden_serv`) REFERENCES `Orden de Serviço`(`idOS`);

ALTER TABLE `Orden de Serviço` ADD CONSTRAINT `Orden de Serviço_fk0` FOREIGN KEY (`Cliente_OS`) REFERENCES `Cliente`(`IdCliente`);

ALTER TABLE `Orden de Serviço` ADD CONSTRAINT `Orden de Serviço_fk1` FOREIGN KEY (`Vehiculo_OS`) REFERENCES `Vehiculo`(`IdVehiculo`);

ALTER TABLE `Orden de Serviço` ADD CONSTRAINT `Orden de Serviço_fk2` FOREIGN KEY (`Team_OS`) REFERENCES `TEAMS`(`IdTeam`);

ALTER TABLE `Orden de Serviço` ADD CONSTRAINT `Orden de Serviço_fk3` FOREIGN KEY (`Serviço_OS`) REFERENCES `Serviço`(`IdServiço`);

ALTER TABLE `Orden de Serviço` ADD CONSTRAINT `Orden de Serviço_fk4` FOREIGN KEY (`Peça_OS`) REFERENCES `Peças`(`IdPeças`);

ALTER TABLE `TEAMS` ADD CONSTRAINT `TEAMS_fk0` FOREIGN KEY (`Membro_team`) REFERENCES `Mecanico`(`IdMecanico`);

ALTER TABLE `Serviço` ADD CONSTRAINT `Serviço_fk0` FOREIGN KEY (`TEAM_serv`) REFERENCES `TEAMS`(`IdTeam`);

ALTER TABLE `Peças` ADD CONSTRAINT `Peças_fk0` FOREIGN KEY (`TEAM_serv`) REFERENCES `TEAMS`(`IdTeam`);

ALTER TABLE `Vehiculo` ADD CONSTRAINT `Vehiculo_fk0` FOREIGN KEY (`Proprietario`) REFERENCES `Cliente`(`IdCliente`);

ALTER TABLE `Status_OS` ADD CONSTRAINT `Status_OS_fk0` FOREIGN KEY (`IdOS`) REFERENCES `Orden de Serviço`(`idOS`);

ALTER TABLE `Status_OS` ADD CONSTRAINT `Status_OS_fk1` FOREIGN KEY (`Responsable`) REFERENCES `Orden de Serviço`(`Team_OS`);

ALTER TABLE `Valor _OS` ADD CONSTRAINT `Valor _OS_fk0` FOREIGN KEY (`IdOS`) REFERENCES `Orden de Serviço`(`idOS`);

ALTER TABLE `Valor _OS` ADD CONSTRAINT `Valor _OS_fk1` FOREIGN KEY (`Valor_serv`) REFERENCES `Serviço`(`Valor_serv`);

ALTER TABLE `Valor _OS` ADD CONSTRAINT `Valor _OS_fk2` FOREIGN KEY (`Valor_peça`) REFERENCES `Peças`(`Valor_peça`);










