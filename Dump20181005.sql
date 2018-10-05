-- MySQL dump 10.13  Distrib 8.0.12, for Win64 (x86_64)
--
-- Host: 127.0.0.1    Database: studia
-- ------------------------------------------------------
-- Server version	8.0.12

/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
 SET NAMES utf8 ;
/*!40103 SET @OLD_TIME_ZONE=@@TIME_ZONE */;
/*!40103 SET TIME_ZONE='+00:00' */;
/*!40014 SET @OLD_UNIQUE_CHECKS=@@UNIQUE_CHECKS, UNIQUE_CHECKS=0 */;
/*!40014 SET @OLD_FOREIGN_KEY_CHECKS=@@FOREIGN_KEY_CHECKS, FOREIGN_KEY_CHECKS=0 */;
/*!40101 SET @OLD_SQL_MODE=@@SQL_MODE, SQL_MODE='NO_AUTO_VALUE_ON_ZERO' */;
/*!40111 SET @OLD_SQL_NOTES=@@SQL_NOTES, SQL_NOTES=0 */;

--
-- Table structure for table `assunto`
--

DROP TABLE IF EXISTS `assunto`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `assunto` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(50) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=10 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `assunto`
--

LOCK TABLES `assunto` WRITE;
/*!40000 ALTER TABLE `assunto` DISABLE KEYS */;
INSERT INTO `assunto` VALUES (3,'JavaScript'),(4,'php'),(5,'java'),(9,'aasd');
/*!40000 ALTER TABLE `assunto` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `aula`
--

DROP TABLE IF EXISTS `aula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `aula` (
  `idConteudo` int(10) unsigned NOT NULL,
  `idCurso` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idConteudo`),
  KEY `fk_aula_curso_id_idx` (`idCurso`),
  CONSTRAINT `fk_aula_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`),
  CONSTRAINT `fk_aula_curso` FOREIGN KEY (`idCurso`) REFERENCES `curso` (`idconteudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `aula`
--

LOCK TABLES `aula` WRITE;
/*!40000 ALTER TABLE `aula` DISABLE KEYS */;
INSERT INTO `aula` VALUES (10,6);
/*!40000 ALTER TABLE `aula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `authorities`
--

DROP TABLE IF EXISTS `authorities`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `authorities` (
  `username` varchar(50) NOT NULL,
  `authority` varchar(50) NOT NULL,
  UNIQUE KEY `authorities_idx_1` (`username`,`authority`),
  CONSTRAINT `authorities_ibfk_1` FOREIGN KEY (`username`) REFERENCES `users` (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `authorities`
--

LOCK TABLES `authorities` WRITE;
/*!40000 ALTER TABLE `authorities` DISABLE KEYS */;
INSERT INTO `authorities` VALUES ('john','ROLE_EMPLOYEE'),('mary','ROLE_EMPLOYEE'),('mary','ROLE_MANAGER'),('susan','ROLE_ADMIN'),('susan','ROLE_EMPLOYEE');
/*!40000 ALTER TABLE `authorities` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliacomentario`
--

DROP TABLE IF EXISTS `avaliacomentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avaliacomentario` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idComentario` int(10) unsigned NOT NULL,
  `ehUtil` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idComentario_idx` (`idComentario`),
  CONSTRAINT `fk_avaliacomentario_comentario` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`),
  CONSTRAINT `fk_avaliacomentario_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliacomentario`
--

LOCK TABLES `avaliacomentario` WRITE;
/*!40000 ALTER TABLE `avaliacomentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliacomentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `avaliaconteudo`
--

DROP TABLE IF EXISTS `avaliaconteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `avaliaconteudo` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idConteudo` int(10) unsigned NOT NULL,
  `ehUtil` tinyint(4) NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idConteudo_idx` (`idConteudo`),
  CONSTRAINT `fk_avaliaconteudo_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`),
  CONSTRAINT `fk_avaliaconteudo_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `avaliaconteudo`
--

LOCK TABLES `avaliaconteudo` WRITE;
/*!40000 ALTER TABLE `avaliaconteudo` DISABLE KEYS */;
/*!40000 ALTER TABLE `avaliaconteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `comentario`
--

DROP TABLE IF EXISTS `comentario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci COMMENT='	';
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `comentario`
--

LOCK TABLES `comentario` WRITE;
/*!40000 ALTER TABLE `comentario` DISABLE KEYS */;
/*!40000 ALTER TABLE `comentario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `componenteaula`
--

DROP TABLE IF EXISTS `componenteaula`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `componenteaula` (
  `id` int(10) unsigned NOT NULL AUTO_INCREMENT,
  `publico` tinyint(4) NOT NULL,
  `descricao` longtext NOT NULL,
  `idAula` int(10) unsigned NOT NULL,
  PRIMARY KEY (`id`),
  KEY `idAula_idx` (`idAula`),
  CONSTRAINT `fk_componenteaula_aula` FOREIGN KEY (`idAula`) REFERENCES `aula` (`idconteudo`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `componenteaula`
--

LOCK TABLES `componenteaula` WRITE;
/*!40000 ALTER TABLE `componenteaula` DISABLE KEYS */;
/*!40000 ALTER TABLE `componenteaula` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `conteudo`
--

DROP TABLE IF EXISTS `conteudo`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB AUTO_INCREMENT=12 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `conteudo`
--

LOCK TABLES `conteudo` WRITE;
/*!40000 ALTER TABLE `conteudo` DISABLE KEYS */;
INSERT INTO `conteudo` VALUES (3,'123213','21321312','F','F','2018-10-02 20:39:07','2018-10-02 20:39:07',3,NULL,NULL),(5,'123213','21321312','F','F','2018-10-02 20:51:42','2018-10-02 20:51:42',3,NULL,NULL),(6,'basico','aprenda javascript!','T','F','2018-10-02 20:54:26','2018-10-02 22:16:23',3,NULL,NULL),(7,'aaaaa','aaaaaa','F','F','2018-10-02 21:03:34','2018-10-02 21:03:34',4,NULL,NULL),(8,'asdsadsa','adsasdsadsa','F','F','2018-10-02 21:03:41','2018-10-02 21:03:41',5,NULL,NULL),(9,'123','123','F','F','2018-10-02 23:07:56','2018-10-02 23:07:56',3,NULL,NULL),(10,'123','asd','F','F','2018-10-02 23:20:38','2018-10-02 23:24:53',3,NULL,NULL),(11,'aaaaaaaaa','aaaaa','F','F','2018-10-02 23:25:01','2018-10-02 23:25:01',3,NULL,NULL);
/*!40000 ALTER TABLE `conteudo` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `curso`
--

DROP TABLE IF EXISTS `curso`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `curso` (
  `idConteudo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idConteudo`),
  CONSTRAINT `fk_curso_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `curso`
--

LOCK TABLES `curso` WRITE;
/*!40000 ALTER TABLE `curso` DISABLE KEYS */;
INSERT INTO `curso` VALUES (6),(7);
/*!40000 ALTER TABLE `curso` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `exercicio`
--

DROP TABLE IF EXISTS `exercicio`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `exercicio` (
  `idComponente` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_exercicio_componenteaula` FOREIGN KEY (`idComponente`) REFERENCES `componenteaula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `exercicio`
--

LOCK TABLES `exercicio` WRITE;
/*!40000 ALTER TABLE `exercicio` DISABLE KEYS */;
/*!40000 ALTER TABLE `exercicio` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `favorito`
--

DROP TABLE IF EXISTS `favorito`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `favorito` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idConteudo` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idUsuario`),
  KEY `idConteudo_idx` (`idConteudo`),
  CONSTRAINT `fk_favorito_conteudo` FOREIGN KEY (`idConteudo`) REFERENCES `conteudo` (`id`),
  CONSTRAINT `fk_favorito_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `favorito`
--

LOCK TABLES `favorito` WRITE;
/*!40000 ALTER TABLE `favorito` DISABLE KEYS */;
/*!40000 ALTER TABLE `favorito` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `material`
--

DROP TABLE IF EXISTS `material`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `material` (
  `idComponente` int(10) unsigned NOT NULL,
  `arquivo` varchar(200) NOT NULL,
  `tipoArquivo` varchar(20) NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_material_componenteaula` FOREIGN KEY (`idComponente`) REFERENCES `componenteaula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `material`
--

LOCK TABLES `material` WRITE;
/*!40000 ALTER TABLE `material` DISABLE KEYS */;
/*!40000 ALTER TABLE `material` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `papel`
--

DROP TABLE IF EXISTS `papel`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `papel` (
  `id` int(11) unsigned NOT NULL,
  `nome` varchar(30) COLLATE utf8_unicode_ci NOT NULL,
  `mantemConteudo` tinyint(4) NOT NULL,
  `aprovaConteudo` tinyint(4) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `papel`
--

LOCK TABLES `papel` WRITE;
/*!40000 ALTER TABLE `papel` DISABLE KEYS */;
/*!40000 ALTER TABLE `papel` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `perfil`
--

DROP TABLE IF EXISTS `perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8 COLLATE=utf8_unicode_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `perfil`
--

LOCK TABLES `perfil` WRITE;
/*!40000 ALTER TABLE `perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `pergunta`
--

DROP TABLE IF EXISTS `pergunta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `pergunta` (
  `idComentario` int(10) unsigned NOT NULL,
  `respondida` tinyint(4) NOT NULL,
  `aprovada` tinyint(4) NOT NULL,
  `idAprovador` int(10) unsigned DEFAULT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `idAprovador_idx` (`idAprovador`),
  CONSTRAINT `fk_pergunta_comentario` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`),
  CONSTRAINT `fk_pergunta_usuario` FOREIGN KEY (`idAprovador`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `pergunta`
--

LOCK TABLES `pergunta` WRITE;
/*!40000 ALTER TABLE `pergunta` DISABLE KEYS */;
/*!40000 ALTER TABLE `pergunta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `resposta`
--

DROP TABLE IF EXISTS `resposta`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `resposta` (
  `idComentario` int(10) unsigned NOT NULL,
  `idPergunta` int(10) unsigned NOT NULL,
  PRIMARY KEY (`idComentario`),
  KEY `fk_resposta_pergunta_idx` (`idPergunta`),
  CONSTRAINT `fk_resposta_comentario` FOREIGN KEY (`idComentario`) REFERENCES `comentario` (`id`),
  CONSTRAINT `fk_resposta_pergunta` FOREIGN KEY (`idPergunta`) REFERENCES `pergunta` (`idcomentario`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `resposta`
--

LOCK TABLES `resposta` WRITE;
/*!40000 ALTER TABLE `resposta` DISABLE KEYS */;
/*!40000 ALTER TABLE `resposta` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `solucao`
--

DROP TABLE IF EXISTS `solucao`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
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
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `solucao`
--

LOCK TABLES `solucao` WRITE;
/*!40000 ALTER TABLE `solucao` DISABLE KEYS */;
/*!40000 ALTER TABLE `solucao` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `users`
--

DROP TABLE IF EXISTS `users`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `users` (
  `username` varchar(50) NOT NULL,
  `password` varchar(50) NOT NULL,
  `enabled` tinyint(1) NOT NULL,
  PRIMARY KEY (`username`)
) ENGINE=InnoDB DEFAULT CHARSET=latin1;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `users`
--

LOCK TABLES `users` WRITE;
/*!40000 ALTER TABLE `users` DISABLE KEYS */;
INSERT INTO `users` VALUES ('john','{noop}test123',1),('mary','{noop}test123',1),('susan','{noop}test123',1);
/*!40000 ALTER TABLE `users` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario`
--

DROP TABLE IF EXISTS `usuario`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario` (
  `id` int(11) unsigned NOT NULL AUTO_INCREMENT,
  `nome` varchar(100) NOT NULL,
  `senha` varchar(10) NOT NULL,
  `email` varchar(64) NOT NULL,
  PRIMARY KEY (`id`),
  UNIQUE KEY `id_UNIQUE` (`id`)
) ENGINE=InnoDB AUTO_INCREMENT=2 DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario`
--

LOCK TABLES `usuario` WRITE;
/*!40000 ALTER TABLE `usuario` DISABLE KEYS */;
INSERT INTO `usuario` VALUES (1,'andre','andre','andre@pfeiffer.com.br');
/*!40000 ALTER TABLE `usuario` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `usuario_perfil`
--

DROP TABLE IF EXISTS `usuario_perfil`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `usuario_perfil` (
  `idUsuario` int(10) unsigned NOT NULL,
  `idPerfil` int(10) unsigned NOT NULL,
  UNIQUE KEY `id_UNIQUE` (`idUsuario`),
  UNIQUE KEY `idPapel_UNIQUE` (`idPerfil`),
  CONSTRAINT `fk_usuarioperfil_perfil` FOREIGN KEY (`idPerfil`) REFERENCES `perfil` (`id`),
  CONSTRAINT `fk_usuarioperfil_usuario` FOREIGN KEY (`idUsuario`) REFERENCES `usuario` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `usuario_perfil`
--

LOCK TABLES `usuario_perfil` WRITE;
/*!40000 ALTER TABLE `usuario_perfil` DISABLE KEYS */;
/*!40000 ALTER TABLE `usuario_perfil` ENABLE KEYS */;
UNLOCK TABLES;

--
-- Table structure for table `video`
--

DROP TABLE IF EXISTS `video`;
/*!40101 SET @saved_cs_client     = @@character_set_client */;
 SET character_set_client = utf8mb4 ;
CREATE TABLE `video` (
  `idComponente` int(10) unsigned NOT NULL,
  `arquivo` varchar(200) NOT NULL,
  `tipoArquivo` varchar(45) NOT NULL,
  PRIMARY KEY (`idComponente`),
  CONSTRAINT `fk_video_componenteaula` FOREIGN KEY (`idComponente`) REFERENCES `componenteaula` (`id`)
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4 COLLATE=utf8mb4_0900_ai_ci;
/*!40101 SET character_set_client = @saved_cs_client */;

--
-- Dumping data for table `video`
--

LOCK TABLES `video` WRITE;
/*!40000 ALTER TABLE `video` DISABLE KEYS */;
/*!40000 ALTER TABLE `video` ENABLE KEYS */;
UNLOCK TABLES;
/*!40103 SET TIME_ZONE=@OLD_TIME_ZONE */;

/*!40101 SET SQL_MODE=@OLD_SQL_MODE */;
/*!40014 SET FOREIGN_KEY_CHECKS=@OLD_FOREIGN_KEY_CHECKS */;
/*!40014 SET UNIQUE_CHECKS=@OLD_UNIQUE_CHECKS */;
/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
/*!40111 SET SQL_NOTES=@OLD_SQL_NOTES */;

-- Dump completed on 2018-10-05 13:39:13
