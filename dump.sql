 SET NAMES utf8 ;

CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `users`;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `usuario`;
CREATE TABLE `usuario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `papel`;
CREATE TABLE `papel` (
  `id` int(11) unsigned NOT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mantemConteudo` tinyint(4) NOT NULL,
  `aprovaConteudo` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB;

 DROP TABLE IF EXISTS `assunto`;
CREATE TABLE `assunto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `perfil`;
CREATE TABLE `perfil` (
  `id` int(11) unsigned NOT NULL,
  `idPapel` int(11) unsigned NOT NULL,
  `idAssunto` int(11) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idAssunto_idx` (`idAssunto`),
  KEY `fk_perfil_papel_idx` (`idPapel`),
  CONSTRAINT `fk_perfil_assunto` FOREIGN KEY (`idAssunto`) REFERENCES `assunto` (`id`),
  CONSTRAINT `fk_perfil_papel` FOREIGN KEY (`idPapel`) REFERENCES `papel` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `usuario_perfil`;
CREATE TABLE `usuario_perfil` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idPerfil` int(10) unsigned NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`idUsuario`),
  UNIQUE KEY `idPapel_UNIQUE` (`idPerfil`),
  CONSTRAINT `fk_usuarioperfil_perfil` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`id`),
  CONSTRAINT `fk_usuarioperfil_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `conteudo`;
CREATE TABLE `conteudo` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  `descricao` text,
  `publico` char(1) NOT NULL,
  `aprovado` char(1) NOT NULL,
  `dataCriado` datetime NOT NULL DEFAULT CURRENT_TIMESTAMP,
  `dataAtualizado` datetime DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `idAssunto` int(10) unsigned NOT NULL,
  `idAutor` int(10) unsigned DEFAULT NULL,
  `idAprovador` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`),
  KEY `idAssunto_idx` (`idAssunto`),
  KEY `idAutor_idx` (`idAutor`),
  KEY `fk_conteudo_usuario2_idx` (`idAprovador`),
  CONSTRAINT `fk_conteudo_assunto` FOREIGN KEY (`idAssunto`) REFERENCES `assunto` (`id`),
  CONSTRAINT `fk_conteudo_usuario1` FOREIGN KEY (`idAutor`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_conteudo_usuario2` FOREIGN KEY (`idAprovador`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `favorito`;
CREATE TABLE `favorito` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idConteudo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idConteudo_idx` (`idConteudo`),
  CONSTRAINT `fk_favorito_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`),
  CONSTRAINT `fk_favorito_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `curso`;
CREATE TABLE `curso` (
  `idConteudo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idConteudo`),
  CONSTRAINT `fk_curso_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `aula`;
CREATE TABLE `aula` (
  `idConteudo` int(10) unsigned NOT NULL,
  `idCurso` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idConteudo`),
  KEY `fk_aula_curso_id_idx` (`idCurso`),
  CONSTRAINT `fk_aula_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`),
  CONSTRAINT `fk_aula_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idconteudo`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `componenteaula`;
CREATE TABLE `componenteaula` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publico` tinyint(4) NOT NULL,
  `descricao` longtext NOT NULL,
  `idAula` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAula_idx` (`idAula`),
  CONSTRAINT `fk_componenteaula_aula` FOREIGN KEY (`idAula`) REFERENCES `aula` (`idconteudo`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `material`;
CREATE TABLE `material` (
  `idComponente` int(10) unsigned NOT NULL,
  `arquivo` varchar(200) NOT NULL,
  `tipoArquivo` varchar(20) NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_material_componenteaula` FOREIGN KEY (`idComponente`) REFERENCES `componenteaula` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `video`;
CREATE TABLE `video` (
  `idComponente` int(10) unsigned NOT NULL,
  `arquivo` varchar(200) NOT NULL,
  `tipoArquivo` varchar(45) NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_video_componenteaula` FOREIGN KEY (`idComponente`) REFERENCES `componenteaula` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `exercicio`;
CREATE TABLE `exercicio` (
  `idComponente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_exercicio_componenteaula` FOREIGN KEY (`idComponente`) REFERENCES `componenteaula` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `solucao`;
CREATE TABLE `solucao` (
  `idExercicio` int(10) unsigned NOT NULL,
  `idAutor` int(10) unsigned NOT NULL,
  `descricao` longtext NOT NULL,
  `nota` float DEFAULT NULL,
  `idRevisor` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idExercicio`),
  KEY `idAutor_idx` (`idAutor`),
  KEY `fk_solucao_usuario2_idx` (`idRevisor`),
  CONSTRAINT `fk_solucao_exercicio` FOREIGN KEY (`idExercicio`) REFERENCES `exercicio` (`idcomponente`),
  CONSTRAINT `fk_solucao_usuario1` FOREIGN KEY (`idAutor`) REFERENCES `usuario` (`id`),
  CONSTRAINT `fk_solucao_usuario2` FOREIGN KEY (`idRevisor`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `comentario`;
CREATE TABLE `comentario` (
  `id` int(10) unsigned NOT NULL,
  `descricao` longtext NOT NULL,
  `idUsuario` int(10) unsigned NOT NULL,
  `dataCriado` date NOT NULL,
  `idConteudo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idUsuario_idx` (`idUsuario`),
  KEY `idConteudo_idx` (`idConteudo`),
  CONSTRAINT `fk_comentario_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`),
  CONSTRAINT `fk_comentario_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `pergunta`;
CREATE TABLE `pergunta` (
  `idComentario` int(10) unsigned NOT NULL,
  `respondida` tinyint(4) NOT NULL,
  `aprovada` tinyint(4) NOT NULL,
  `idAprovador` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idAprovador_idx` (`idAprovador`),
  CONSTRAINT `fk_pergunta_comentario` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`),
  CONSTRAINT `fk_pergunta_usuario` FOREIGN KEY (`idAprovador`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `resposta`;
CREATE TABLE `resposta` (
  `idComentario` int(10) unsigned NOT NULL,
  `idPergunta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `fk_resposta_pergunta_idx` (`idPergunta`),
  CONSTRAINT `fk_resposta_comentario` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`),
  CONSTRAINT `fk_resposta_pergunta` FOREIGN KEY (`idPergunta`) REFERENCES `pergunta` (`idcomentario`)
) ENGINE;

DROP TABLE IF EXISTS `avaliacomentario`;
CREATE TABLE `avaliacomentario` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idComentario` int(10) unsigned NOT NULL,
  `ehUtil` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idComentario_idx` (`idComentario`),
  CONSTRAINT `fk_avaliacomentario_comentario` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`),
  CONSTRAINT `fk_avaliacomentario_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB;

DROP TABLE IF EXISTS `avaliaconteudo`;
CREATE TABLE `avaliaconteudo` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idConteudo` int(10) unsigned NOT NULL,
  `ehUtil` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idConteudo_idx` (`idConteudo`),
  CONSTRAINT `fk_avaliaconteudo_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`),
  CONSTRAINT `fk_avaliaconteudo_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB;


