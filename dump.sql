SET NAMES utf8mb4;
--
-- Assunto
--
DROP TABLE IF EXISTS `Assunto`;
CREATE TABLE `Assunto` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Usuario
--
DROP TABLE IF EXISTS `Usuario`;
CREATE TABLE `Usuario` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `senha` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  `email` varchar(64) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`id`)
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Papel`;
CREATE TABLE `Papel` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(30) COLLATE utf8mb4_unicode_ci NOT NULL,
  `mantemConteudo` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'F',
  `aprovaConteudo` char(1) COLLATE utf8mb4_unicode_ci DEFAULT 'F',
  PRIMARY KEY (`id`)
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Perfil`;
CREATE TABLE `Perfil` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `idPapel` int unsigned NOT NULL,
  `idAssunto` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idPapel_idx` (`idPapel`),
  KEY `idAssunto_idx` (`idAssunto`),
  CONSTRAINT `fk_perfil_papel` 
  FOREIGN KEY (`idPapel`) REFERENCES `Papel` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_perfil_assunto` 
  FOREIGN KEY (`idAssunto`) REFERENCES `Assunto` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Usuario_Perfil`;
CREATE TABLE `Usuario_Perfil` (
  `idUsuario` int unsigned NOT NULL,
  `idPerfil` int unsigned NOT NULL,
  PRIMARY KEY (`idUsuario`,`idPerfil`),
  CONSTRAINT `fk_usuario_perfil_perfil` 
  FOREIGN KEY (`idPerfil`) REFERENCES `Perfil` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_usuario_perfil_usuario` 
  FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Conteudo
--
DROP TABLE IF EXISTS `Conteudo`;
CREATE TABLE `Conteudo` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) COLLATE utf8mb4_unicode_ci NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci,
  `publico` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `aprovado` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `dataCriado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizado` datetime DEFAULT 
  CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idAutor` int unsigned NOT NULL,
  `idAprovador` int unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `idAutor_idx` (`idAutor`),
  KEY `id_Aprovador_idx` (`idAprovador`),
  CONSTRAINT `fk_conteudo_usuario1` 
  FOREIGN KEY (`idAutor`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_conteudo_usuario2` 
  FOREIGN KEY (`idAprovador`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Curso`;
CREATE TABLE `Curso` (
  `idConteudo` int unsigned NOT NULL,
  `idAssunto` int unsigned NOT NULL,
  PRIMARY KEY (`idConteudo`),
  KEY `idAssunto_idx` (`idAssunto`),
  CONSTRAINT `fk_curso_conteudo` 
  FOREIGN KEY (`idConteudo`) REFERENCES `Conteudo` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_curso_assunto` 
  FOREIGN KEY (`idAssunto`) REFERENCES `Assunto` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Aula`;
CREATE TABLE `Aula` (
  `idConteudo` int unsigned NOT NULL,
  `idCurso` int unsigned NOT NULL,
  `ordem` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`idConteudo`),
  KEY `idCurso_idx` (`idCurso`),
  CONSTRAINT `fk_aula_conteudo` 
  FOREIGN KEY (`idConteudo`) REFERENCES `Conteudo` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_aula_curso` 
  FOREIGN KEY (`idCurso`) REFERENCES `Curso` (`idconteudo`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `ComponenteAula`;
CREATE TABLE `ComponenteAula` (
  `id` int unsigned NOT NULL AUTO_INCREMENT,
  `publico` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idAula` int unsigned NOT NULL,
  `ordem` int NOT NULL DEFAULT 0,
  PRIMARY KEY (`id`),
  KEY `idAula_idx` (`idAula`),
  CONSTRAINT `fk_componenteaula_aula` 
  FOREIGN KEY (`idAula`) REFERENCES `Aula` (`idconteudo`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Exercicio`;
CREATE TABLE `Exercicio` (
  `idComponente` int unsigned NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_exercicio_componenteaula` 
  FOREIGN KEY (`idComponente`) REFERENCES `ComponenteAula` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Video`;
CREATE TABLE `Video` (
  `idComponente` int unsigned NOT NULL,
  `arquivo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoArquivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_video_componenteaula` 
  FOREIGN KEY (`idComponente`) REFERENCES `ComponenteAula` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Material`;
CREATE TABLE `Material` (
  `idComponente` int unsigned NOT NULL,
  `arquivo` varchar(200) COLLATE utf8mb4_unicode_ci NOT NULL,
  `tipoArquivo` varchar(100) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_material_componenteaula` 
  FOREIGN KEY (`idComponente`) REFERENCES `ComponenteAula` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Solucao`;
CREATE TABLE `Solucao` (
  `idExercicio` int unsigned NOT NULL,
  `idAutor` int unsigned NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `nota` float DEFAULT NULL,
  `idRevisor` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idExercicio`, `idAutor`),
  KEY `idRevisor_idx` (`idRevisor`),
  CONSTRAINT `fk_solucao_exercicio` 
  FOREIGN KEY (`idExercicio`) REFERENCES `Exercicio` (`idcomponente`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_solucao_usuario1` 
  FOREIGN KEY (`idAutor`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_solucao_usuario2` 
  FOREIGN KEY (`idRevisor`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Historico`;
CREATE TABLE `Historico` (
  `id` INT UNSIGNED NOT NULL AUTO_INCREMENT,
  `usuarioId` INT UNSIGNED NOT NULL,
  `tipoConteudo` VARCHAR(45) NOT NULL,
  `dataCompletado` DATETIME NOT NULL DEFAULT CURRENT_TIMESTAMP,
  PRIMARY KEY (`id`),
  INDEX `usuarioId` (`usuarioId` ASC) VISIBLE,
  CONSTRAINT `fk_historico_usuario`
    FOREIGN KEY (`usuarioId`) REFERENCES `studia`.`usuario` (`id`)
    ON DELETE CASCADE ON UPDATE CASCADE
)
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Comentario
--
DROP TABLE IF EXISTS `Comentario`;
CREATE TABLE `Comentario` (
  `id` int unsigned NOT NULL,
  `descricao` text COLLATE utf8mb4_unicode_ci NOT NULL,
  `idUsuario` int unsigned NOT NULL,
  `dataCriado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `idConteudo` int unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario_idx` (`idUsuario`),
  KEY `idConteudo_idx` (`idConteudo`),
  CONSTRAINT `fk_comentario_conteudo` 
  FOREIGN KEY (`idConteudo`) REFERENCES `Conteudo` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_comentario_usuario` 
  FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Pergunta`;
CREATE TABLE `Pergunta` (
  `idComentario` int unsigned NOT NULL,
  `respondida` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `aprovada` char(1) COLLATE utf8mb4_unicode_ci NOT NULL DEFAULT 'F',
  `idAprovador` int unsigned DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idAprovador_idx` (`idAprovador`),
  CONSTRAINT `fk_pergunta_comentario` 
  FOREIGN KEY (`idComentario`) REFERENCES `Comentario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_pergunta_usuario` 
  FOREIGN KEY (`idAprovador`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `Resposta`;
CREATE TABLE `Resposta` (
  `idComentario` int unsigned NOT NULL,
  `idPergunta` int unsigned NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idPergunta_idx` (`idPergunta`),
  CONSTRAINT `fk_resposta_comentario` 
  FOREIGN KEY (`idComentario`) REFERENCES `Comentario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_resposta_pergunta` 
  FOREIGN KEY (`idPergunta`) REFERENCES `Pergunta` (`idcomentario`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Avaliacao
--
DROP TABLE IF EXISTS `AvaliaConteudo`;
CREATE TABLE `AvaliaConteudo` (
  `idUsuario` int unsigned NOT NULL,
  `idConteudo` int unsigned NOT NULL,
  `ehUtil` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idUsuario`,`idConteudo`),
  CONSTRAINT `fk_avaliaconteudo_conteudo` 
  FOREIGN KEY (`idConteudo`) REFERENCES `Conteudo` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_avaliaconteudo_usuario` 
  FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

DROP TABLE IF EXISTS `AvaliaComentario`;
CREATE TABLE `AvaliaComentario` (
  `idUsuario` int unsigned NOT NULL,
  `idComentario` int unsigned NOT NULL,
  `ehUtil` char(1) COLLATE utf8mb4_unicode_ci NOT NULL,
  PRIMARY KEY (`idUsuario`,`idComentario`),
  CONSTRAINT `fk_avaliacomentario_comentario` 
  FOREIGN KEY (`idComentario`) REFERENCES `Comentario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_avaliacomentario_usuario` 
  FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Favorito
--
DROP TABLE IF EXISTS `Favorito`;
CREATE TABLE `Favorito` (
  `idUsuario` int unsigned NOT NULL,
  `idConteudo` int unsigned NOT NULL,
  PRIMARY KEY (`idUsuario`,`idConteudo`),
  CONSTRAINT `fk_favorito_conteudo` 
  FOREIGN KEY (`idConteudo`) REFERENCES `Conteudo` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE,
  CONSTRAINT `fk_favorito_usuario` 
  FOREIGN KEY (`idUsuario`) REFERENCES `Usuario` (`id`)
  ON DELETE CASCADE ON UPDATE CASCADE
) 
ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_unicode_ci;

--
-- Criação de papel, perfil e usuario padrões
--
INSERT INTO `Papel` (id, nome, mantemConteudo, aprovaConteudo) 
VALUES (1, 'Administrador', 'T', 'T');
INSERT INTO `Papel` (id, nome, mantemConteudo, aprovaConteudo) 
VALUES (2, 'Aluno', 'F', 'F');
INSERT INTO `Papel` (id, nome, mantemConteudo, aprovaConteudo) 
VALUES (3, 'Instrutor', 'T', 'F');
INSERT INTO `Papel` (id, nome, mantemConteudo, aprovaConteudo) 
VALUES (4, 'Coordenador Acadêmico', 'T', 'T');

INSERT INTO `Perfil` (id, idPapel) values (1, 1);
INSERT INTO `Perfil` (id, idPapel) values (2, 2);

--
-- Senha padrão com o valor ‘root’
--
INSERT INTO `Usuario` (id, nome, senha, email) values 
(1, 'root', '$2a$10$jxqFF6RTc1/dSwwiDaE9cuYbjMQk7UdHCPlbh7kC4ElLZzciEk3uK', 'admin@studia.cc');

INSERT INTO `Usuario_Perfil` (idUsuario, idPerfil) values (1, 1);


