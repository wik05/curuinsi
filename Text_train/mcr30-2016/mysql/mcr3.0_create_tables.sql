-- phpMyAdmin SQL Dump
-- version 4.0.10.15
-- http://www.phpmyadmin.net
--
-- Servidor: localhost
-- Temps de generació: 16-06-2016 a les 11:07:10
-- Versió del servidor: 5.1.73
-- Versió de PHP: 5.3.3

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8 */;

--
-- Base de dades: `mcr9`
--

-- --------------------------------------------------------

--
-- Table structure for table `mark_values_synset`
--

CREATE TABLE IF NOT EXISTS `mark_values_synset` (
  `value` varchar(20) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `mark_values_variant`
--

CREATE TABLE IF NOT EXISTS `mark_values_variant` (
  `value` varchar(20) COLLATE utf8_bin NOT NULL,
  `description` varchar(100) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`value`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_cat-30_examples`
--

CREATE TABLE IF NOT EXISTS `wei_cat-30_examples` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL,
  `sense` int(11) NOT NULL DEFAULT '0',
  `examples` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` varchar(17) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_cat-30_relation`
--

CREATE TABLE IF NOT EXISTS `wei_cat-30_relation` (
  `relation` smallint(6) NOT NULL DEFAULT '0',
  `sourceSynset` char(17) COLLATE utf8_bin NOT NULL,
  `sourcePos` char(1) COLLATE utf8_bin NOT NULL,
  `targetSynset` char(17) COLLATE utf8_bin NOT NULL,
  `targetPos` char(1) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  `method` char(2) COLLATE utf8_bin NOT NULL,
  `version` char(1) COLLATE utf8_bin NOT NULL,
  `wnSource` char(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`relation`,`sourceSynset`,`sourcePos`,`targetSynset`,`targetPos`,`method`,`version`,`wnSource`),
  KEY `relation` (`relation`),
  KEY `targetSynset` (`targetSynset`,`targetPos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_cat-30_synset`
--

CREATE TABLE IF NOT EXISTS `wei_cat-30_synset` (
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `sons` int(1) NOT NULL DEFAULT '0',
  `status` enum('i','-') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `lexical` enum('-','n') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `instance` tinyint(1) NOT NULL DEFAULT '0',
  `gloss` text COLLATE utf8_bin,
  `level` int(1) NOT NULL DEFAULT '0',
  `levelFromTop` int(1) NOT NULL DEFAULT '0',
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_cat-30_to_ili`
--

CREATE TABLE IF NOT EXISTS `wei_cat-30_to_ili` (
  `iliOffset` char(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` char(17) COLLATE utf8_bin NOT NULL,
  `iliWnId` char(6) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`iliOffset`,`pos`,`offset`,`iliWnId`),
  KEY `iliOffset` (`iliOffset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_cat-30_variant`
--

CREATE TABLE IF NOT EXISTS `wei_cat-30_variant` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sense` int(1) NOT NULL DEFAULT '0',
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL DEFAULT '',
  `csco` float NOT NULL DEFAULT '0',
  `experiment` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`word`,`sense`,`pos`,`offset`),
  KEY `word` (`word`),
  KEY `offset` (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_domains`
--

CREATE TABLE IF NOT EXISTS `wei_domains` (
  `target` varchar(25) COLLATE utf8_bin NOT NULL,
  `source` varchar(25) COLLATE utf8_bin DEFAULT NULL,
  `type` char(1) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eng-30_examples`
--

CREATE TABLE IF NOT EXISTS `wei_eng-30_examples` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL,
  `sense` int(11) NOT NULL DEFAULT '0',
  `examples` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` varchar(17) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eng-30_relation`
--

CREATE TABLE IF NOT EXISTS `wei_eng-30_relation` (
  `relation` smallint(6) NOT NULL DEFAULT '0',
  `sourceSynset` char(17) COLLATE utf8_bin NOT NULL,
  `sourcePos` char(1) COLLATE utf8_bin NOT NULL,
  `targetSynset` char(17) COLLATE utf8_bin NOT NULL,
  `targetPos` char(1) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  `method` char(2) COLLATE utf8_bin NOT NULL,
  `version` char(1) COLLATE utf8_bin NOT NULL,
  `wnSource` char(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`relation`,`sourceSynset`,`sourcePos`,`targetSynset`,`targetPos`,`method`,`version`,`wnSource`),
  KEY `relation` (`relation`),
  KEY `targetSynset` (`targetSynset`,`targetPos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eng-30_synset`
--

CREATE TABLE IF NOT EXISTS `wei_eng-30_synset` (
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `sons` int(1) NOT NULL DEFAULT '0',
  `status` enum('i','-') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `lexical` enum('-','n') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `instance` tinyint(1) NOT NULL DEFAULT '0',
  `gloss` text COLLATE utf8_bin,
  `level` int(1) NOT NULL DEFAULT '0',
  `levelFromTop` int(1) NOT NULL DEFAULT '0',
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eng-30_to_ili`
--

CREATE TABLE IF NOT EXISTS `wei_eng-30_to_ili` (
  `iliOffset` char(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` char(17) COLLATE utf8_bin NOT NULL,
  `iliWnId` char(6) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`iliOffset`,`pos`,`offset`,`iliWnId`),
  KEY `iliOffset` (`iliOffset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eng-30_variant`
--

CREATE TABLE IF NOT EXISTS `wei_eng-30_variant` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sense` int(1) NOT NULL DEFAULT '0',
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL DEFAULT '',
  `csco` float NOT NULL DEFAULT '0',
  `experiment` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`word`,`sense`,`pos`,`offset`),
  KEY `word` (`word`),
  KEY `offset` (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eus-30_examples`
--

CREATE TABLE IF NOT EXISTS `wei_eus-30_examples` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL,
  `sense` bigint(11) NOT NULL DEFAULT '0',
  `examples` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` varchar(17) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eus-30_relation`
--

CREATE TABLE IF NOT EXISTS `wei_eus-30_relation` (
  `relation` smallint(6) NOT NULL DEFAULT '0',
  `sourceSynset` char(17) COLLATE utf8_bin NOT NULL,
  `sourcePos` char(1) COLLATE utf8_bin NOT NULL,
  `targetSynset` char(17) COLLATE utf8_bin NOT NULL,
  `targetPos` char(1) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  `method` char(2) COLLATE utf8_bin NOT NULL,
  `version` char(1) COLLATE utf8_bin NOT NULL,
  `wnSource` char(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`relation`,`sourceSynset`,`sourcePos`,`targetSynset`,`targetPos`,`method`,`version`,`wnSource`),
  KEY `relation` (`relation`),
  KEY `targetSynset` (`targetSynset`,`targetPos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eus-30_synset`
--

CREATE TABLE IF NOT EXISTS `wei_eus-30_synset` (
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `sons` int(1) NOT NULL DEFAULT '0',
  `status` enum('i','-') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `lexical` enum('-','n') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `instance` tinyint(1) NOT NULL DEFAULT '0',
  `gloss` text COLLATE utf8_bin,
  `level` int(1) NOT NULL DEFAULT '0',
  `levelFromTop` int(1) NOT NULL DEFAULT '0',
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_eus-30_to_ili`
--

CREATE TABLE IF NOT EXISTS `wei_eus-30_to_ili` (
  `iliOffset` char(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` char(17) COLLATE utf8_bin NOT NULL,
  `iliWnId` char(6) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`iliOffset`,`pos`,`offset`,`iliWnId`),
  KEY `iliOffset` (`iliOffset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de la taula `wei_eus-30_variant`
--

CREATE TABLE IF NOT EXISTS `wei_eus-30_variant` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sense` int(1) NOT NULL DEFAULT '0',
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL DEFAULT '',
  `csco` float NOT NULL DEFAULT '0',
  `experiment` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`word`,`sense`,`offset`,`pos`),
  KEY `word` (`word`),
  KEY `offset` (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_glg-30_examples`
--

CREATE TABLE IF NOT EXISTS `wei_glg-30_examples` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL,
  `sense` int(11) NOT NULL DEFAULT '0',
  `examples` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` varchar(17) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_glg-30_relation`
--

CREATE TABLE IF NOT EXISTS `wei_glg-30_relation` (
  `relation` smallint(6) NOT NULL DEFAULT '0',
  `sourceSynset` char(17) COLLATE utf8_bin NOT NULL,
  `sourcePos` char(1) COLLATE utf8_bin NOT NULL,
  `targetSynset` char(17) COLLATE utf8_bin NOT NULL,
  `targetPos` char(1) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  `method` char(2) COLLATE utf8_bin NOT NULL,
  `version` char(1) COLLATE utf8_bin NOT NULL,
  `wnSource` char(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`relation`,`sourceSynset`,`sourcePos`,`targetSynset`,`targetPos`,`method`,`version`,`wnSource`),
  KEY `relation` (`relation`),
  KEY `targetSynset` (`targetSynset`,`targetPos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_glg-30_synset`
--

CREATE TABLE IF NOT EXISTS `wei_glg-30_synset` (
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `sons` int(1) NOT NULL DEFAULT '0',
  `status` enum('i','-') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `lexical` enum('-','n') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `instance` tinyint(1) NOT NULL DEFAULT '0',
  `gloss` text COLLATE utf8_bin,
  `level` int(1) NOT NULL DEFAULT '0',
  `levelFromTop` int(1) NOT NULL DEFAULT '0',
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_glg-30_to_ili`
--

CREATE TABLE IF NOT EXISTS `wei_glg-30_to_ili` (
  `iliOffset` char(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` char(17) COLLATE utf8_bin NOT NULL,
  `iliWnId` char(6) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`iliOffset`,`pos`,`offset`,`iliWnId`),
  KEY `iliOffset` (`iliOffset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_glg-30_variant`
--

CREATE TABLE IF NOT EXISTS `wei_glg-30_variant` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sense` int(1) NOT NULL DEFAULT '0',
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL DEFAULT '',
  `csco` float NOT NULL DEFAULT '0',
  `experiment` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`word`,`sense`,`pos`,`offset`),
  KEY `word` (`word`),
  KEY `offset` (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Estructura de la taula `wei_ili_record`
--

CREATE TABLE IF NOT EXISTS `wei_ili_record` (
  `iliOffset` char(17) COLLATE utf8_bin NOT NULL,
  `iliPos` char(1) COLLATE utf8_bin NOT NULL,
  `iliWnId` char(6) COLLATE utf8_bin NOT NULL,
  `semf` char(2) COLLATE utf8_bin NOT NULL,
  `instance` tinyint(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`iliOffset`,`iliPos`,`iliWnId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_ili_to_blc`
--

CREATE TABLE IF NOT EXISTS `wei_ili_to_blc` (
  `blc` varchar(25) COLLATE utf8_bin NOT NULL,
  `iliOffset` varchar(17) COLLATE utf8_bin NOT NULL,
  `iliPos` char(1) COLLATE utf8_bin NOT NULL,
  `iliWnId` varchar(6) COLLATE utf8_bin NOT NULL,
  `modif` char(1) COLLATE utf8_bin NOT NULL DEFAULT '#',
  `represent` int(1) NOT NULL,
  `relations` int(11) NOT NULL,
  PRIMARY KEY (`blc`,`iliOffset`,`iliPos`,`iliWnId`,`modif`),
  KEY `iliOffset` (`iliOffset`,`iliPos`,`iliWnId`),
  KEY `blc` (`blc`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_ili_to_domains`
--

CREATE TABLE IF NOT EXISTS `wei_ili_to_domains` (
  `domain` varchar(25) COLLATE utf8_bin NOT NULL,
  `iliOffset` varchar(17) COLLATE utf8_bin NOT NULL,
  `iliPos` char(1) COLLATE utf8_bin NOT NULL,
  `iliWnId` varchar(6) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`domain`,`iliOffset`,`iliPos`,`iliWnId`),
  KEY `iliOffset` (`iliOffset`,`iliPos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_ili_to_sumo`
--

CREATE TABLE IF NOT EXISTS `wei_ili_to_sumo` (
  `iliOffset` varchar(17) COLLATE utf8_bin NOT NULL,
  `iliPos` char(1) COLLATE utf8_bin NOT NULL,
  `iliWnId` varchar(6) COLLATE utf8_bin NOT NULL DEFAULT 'en16',
  `SUMO` varchar(120) COLLATE utf8_bin NOT NULL,
  `modif` char(3) COLLATE utf8_bin NOT NULL DEFAULT '',
  PRIMARY KEY (`iliOffset`,`iliPos`,`iliWnId`,`SUMO`,`modif`),
  KEY `SUMO` (`SUMO`),
  KEY `iliOffset` (`iliOffset`,`iliPos`,`iliWnId`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin COMMENT='SUMO';

-- --------------------------------------------------------

--
-- Table structure for table `wei_ili_to_to`
--

CREATE TABLE IF NOT EXISTS `wei_ili_to_to` (
  `top` varchar(25) COLLATE utf8_bin NOT NULL,
  `iliOffset` varchar(17) COLLATE utf8_bin NOT NULL,
  `iliPos` char(1) COLLATE utf8_bin NOT NULL,
  `iliWnId` varchar(6) COLLATE utf8_bin NOT NULL,
  `modif` char(1) COLLATE utf8_bin NOT NULL DEFAULT '#',
  PRIMARY KEY (`top`,`iliOffset`,`iliPos`,`iliWnId`,`modif`),
  KEY `iliOffset` (`iliOffset`,`iliPos`,`iliWnId`),
  KEY `top` (`top`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_lexnames`
--

CREATE TABLE IF NOT EXISTS `wei_lexnames` (
  `semf` char(2) COLLATE utf8_bin NOT NULL,
  `name` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`semf`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--

--
-- Table structure for table `wei_por-30_examples`
--

CREATE TABLE IF NOT EXISTS `wei_por-30_examples` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL,
  `sense` int(11) NOT NULL DEFAULT '0',
  `examples` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` varchar(17) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_por-30_relation`
--

CREATE TABLE IF NOT EXISTS `wei_por-30_relation` (
  `relation` smallint(6) NOT NULL DEFAULT '0',
  `sourceSynset` char(17) COLLATE utf8_bin NOT NULL,
  `sourcePos` char(1) COLLATE utf8_bin NOT NULL,
  `targetSynset` char(17) COLLATE utf8_bin NOT NULL,
  `targetPos` char(1) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  `method` char(2) COLLATE utf8_bin NOT NULL,
  `version` char(1) COLLATE utf8_bin NOT NULL,
  `wnSource` char(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`relation`,`sourceSynset`,`sourcePos`,`targetSynset`,`targetPos`,`method`,`version`,`wnSource`),
  KEY `relation` (`relation`),
  KEY `targetSynset` (`targetSynset`,`targetPos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_por-30_synset`
--

CREATE TABLE IF NOT EXISTS `wei_por-30_synset` (
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `sons` int(1) NOT NULL DEFAULT '0',
  `status` enum('i','-') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `lexical` enum('-','n') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `instance` tinyint(1) NOT NULL DEFAULT '0',
  `gloss` text COLLATE utf8_bin,
  `level` int(1) NOT NULL DEFAULT '0',
  `levelFromTop` int(1) NOT NULL DEFAULT '0',
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_por-30_to_ili`
--

CREATE TABLE IF NOT EXISTS `wei_por-30_to_ili` (
  `iliOffset` char(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` char(17) COLLATE utf8_bin NOT NULL,
  `iliWnId` char(6) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`iliOffset`,`pos`,`offset`,`iliWnId`),
  KEY `iliOffset` (`iliOffset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_por-30_variant`
--

CREATE TABLE IF NOT EXISTS `wei_por-30_variant` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sense` int(1) NOT NULL DEFAULT '0',
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL DEFAULT '',
  `csco` float NOT NULL DEFAULT '0',
  `experiment` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY  (`word`,`sense`,`pos`,`offset`),
  KEY `word` (`word`),
  KEY `offset` (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_relations`
--

CREATE TABLE IF NOT EXISTS `wei_relations` (
  `id` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(25) COLLATE utf8_bin NOT NULL,
  `props` varchar(4) COLLATE utf8_bin NOT NULL,
  `inverse` varchar(25) COLLATE utf8_bin NOT NULL,
  `grup` int(11) DEFAULT NULL,
  `note` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_relations_group`
--

CREATE TABLE IF NOT EXISTS `wei_relations_group` (
  `id` smallint(6) NOT NULL DEFAULT '0',
  `name` varchar(25) COLLATE utf8_bin NOT NULL,
  `cascada` int(1) NOT NULL DEFAULT '0',
  PRIMARY KEY (`id`),
  KEY `name` (`name`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_spa-30_examples`
--

CREATE TABLE IF NOT EXISTS `wei_spa-30_examples` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL,
  `sense` int(11) NOT NULL DEFAULT '0',
  `examples` varchar(255) COLLATE utf8_bin DEFAULT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` varchar(17) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_spa-30_relation`
--

CREATE TABLE IF NOT EXISTS `wei_spa-30_relation` (
  `relation` smallint(6) NOT NULL DEFAULT '0',
  `sourceSynset` char(17) COLLATE utf8_bin NOT NULL,
  `sourcePos` char(1) COLLATE utf8_bin NOT NULL,
  `targetSynset` char(17) COLLATE utf8_bin NOT NULL,
  `targetPos` char(1) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  `method` char(2) COLLATE utf8_bin NOT NULL,
  `version` char(1) COLLATE utf8_bin NOT NULL,
  `wnSource` char(4) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`relation`,`sourceSynset`,`sourcePos`,`targetSynset`,`targetPos`,`method`,`version`,`wnSource`),
  KEY `relation` (`relation`),
  KEY `targetSynset` (`targetSynset`,`targetPos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_spa-30_synset`
--

CREATE TABLE IF NOT EXISTS `wei_spa-30_synset` (
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `sons` int(1) NOT NULL DEFAULT '0',
  `status` enum('i','-') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `lexical` enum('-','n') COLLATE utf8_bin NOT NULL DEFAULT '-',
  `instance` tinyint(1) NOT NULL DEFAULT '0',
  `gloss` text COLLATE utf8_bin,
  `level` int(1) NOT NULL DEFAULT '0',
  `levelFromTop` int(1) NOT NULL DEFAULT '0',
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_spa-30_to_ili`
--

CREATE TABLE IF NOT EXISTS `wei_spa-30_to_ili` (
  `iliOffset` char(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL,
  `offset` char(17) COLLATE utf8_bin NOT NULL,
  `iliWnId` char(6) COLLATE utf8_bin NOT NULL,
  `csco` float NOT NULL DEFAULT '0',
  PRIMARY KEY (`iliOffset`,`pos`,`offset`,`iliWnId`),
  KEY `iliOffset` (`iliOffset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_spa-30_variant`
--

CREATE TABLE IF NOT EXISTS `wei_spa-30_variant` (
  `word` varchar(100) COLLATE utf8_bin NOT NULL DEFAULT '',
  `sense` int(1) NOT NULL DEFAULT '0',
  `offset` varchar(17) COLLATE utf8_bin NOT NULL,
  `pos` char(1) COLLATE utf8_bin NOT NULL DEFAULT '',
  `csco` float NOT NULL DEFAULT '0',
  `experiment` varchar(20) COLLATE utf8_bin DEFAULT NULL,
  `mark` varchar(20) COLLATE utf8_bin NOT NULL DEFAULT '------',
  PRIMARY KEY (`word`,`sense`,`pos`,`offset`),
  KEY `word` (`word`),
  KEY `offset` (`offset`,`pos`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_sumo_relations`
--

CREATE TABLE IF NOT EXISTS `wei_sumo_relations` (
  `relacio` varchar(50) COLLATE utf8_bin NOT NULL,
  `target` varchar(50) COLLATE utf8_bin NOT NULL,
  `source` varchar(50) COLLATE utf8_bin NOT NULL
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_to_record`
--

CREATE TABLE IF NOT EXISTS `wei_to_record` (
  `top` varchar(25) COLLATE utf8_bin NOT NULL,
  `gloss` text COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`top`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

-- --------------------------------------------------------

--
-- Table structure for table `wei_to_relations`
--

CREATE TABLE IF NOT EXISTS `wei_to_relations` (
  `relation` varchar(25) COLLATE utf8_bin NOT NULL,
  `source` varchar(25) COLLATE utf8_bin NOT NULL,
  `target` varchar(25) COLLATE utf8_bin NOT NULL,
  PRIMARY KEY (`relation`,`source`,`target`)
) ENGINE=MyISAM DEFAULT CHARSET=utf8 COLLATE=utf8_bin;

