-- phpMyAdmin SQL Dump
-- version 4.8.4
-- https://www.phpmyadmin.net/
--
-- Host: mysql1.mydevil.net
-- Czas generowania: 27 Kwi 2019, 20:49
-- Wersja serwera: 5.7.21-20-log
-- Wersja PHP: 7.1.12

SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
SET AUTOCOMMIT = 0;
START TRANSACTION;
SET time_zone = "+00:00";


/*!40101 SET @OLD_CHARACTER_SET_CLIENT=@@CHARACTER_SET_CLIENT */;
/*!40101 SET @OLD_CHARACTER_SET_RESULTS=@@CHARACTER_SET_RESULTS */;
/*!40101 SET @OLD_COLLATION_CONNECTION=@@COLLATION_CONNECTION */;
/*!40101 SET NAMES utf8mb4 */;

--
-- Baza danych: `m13756_minecraft`
--

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `authme`
--

CREATE TABLE `authme` (
  `id` mediumint(8) UNSIGNED NOT NULL,
  `username` varchar(255) NOT NULL,
  `realname` varchar(255) NOT NULL,
  `password` varchar(255) CHARACTER SET ascii COLLATE ascii_bin NOT NULL,
  `ip` varchar(40) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `lastlogin` bigint(20) DEFAULT NULL,
  `x` double NOT NULL DEFAULT '0',
  `y` double NOT NULL DEFAULT '0',
  `z` double NOT NULL DEFAULT '0',
  `world` varchar(255) NOT NULL DEFAULT 'world',
  `regdate` bigint(20) NOT NULL DEFAULT '0',
  `regip` varchar(40) CHARACTER SET ascii COLLATE ascii_bin DEFAULT NULL,
  `yaw` float DEFAULT NULL,
  `pitch` float DEFAULT NULL,
  `email` varchar(255) DEFAULT NULL,
  `isLogged` smallint(6) NOT NULL DEFAULT '0',
  `hasSession` smallint(6) NOT NULL DEFAULT '0'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_ip_bans`
--

CREATE TABLE `bm_ip_bans` (
  `id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL,
  `expires` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_ip_ban_records`
--

CREATE TABLE `bm_ip_ban_records` (
  `id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expired` int(10) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `pastActor_id` binary(16) NOT NULL,
  `pastCreated` int(10) NOT NULL,
  `created` int(10) NOT NULL,
  `createdReason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_ip_mutes`
--

CREATE TABLE `bm_ip_mutes` (
  `id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL,
  `expires` int(10) NOT NULL,
  `soft` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_ip_mute_records`
--

CREATE TABLE `bm_ip_mute_records` (
  `id` int(11) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expired` int(10) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `pastActor_id` binary(16) NOT NULL,
  `pastCreated` int(10) NOT NULL,
  `created` int(10) NOT NULL,
  `createdReason` varchar(255) NOT NULL,
  `soft` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_ip_range_bans`
--

CREATE TABLE `bm_ip_range_bans` (
  `id` int(11) NOT NULL,
  `fromIp` int(10) UNSIGNED NOT NULL,
  `toIp` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL,
  `expires` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_ip_range_ban_records`
--

CREATE TABLE `bm_ip_range_ban_records` (
  `id` int(11) NOT NULL,
  `fromIp` int(10) UNSIGNED NOT NULL,
  `toIp` int(10) UNSIGNED NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expired` int(10) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `pastActor_id` binary(16) NOT NULL,
  `pastCreated` int(10) NOT NULL,
  `created` int(10) NOT NULL,
  `createdReason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_name_bans`
--

CREATE TABLE `bm_name_bans` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL,
  `expires` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_name_ban_records`
--

CREATE TABLE `bm_name_ban_records` (
  `id` int(11) NOT NULL,
  `name` varchar(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expired` bigint(20) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `pastActor_id` binary(16) NOT NULL,
  `pastCreated` int(10) NOT NULL,
  `created` int(10) NOT NULL,
  `createdReason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_players`
--

CREATE TABLE `bm_players` (
  `id` binary(16) NOT NULL,
  `name` varchar(16) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `lastSeen` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_bans`
--

CREATE TABLE `bm_player_bans` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL,
  `expires` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_ban_records`
--

CREATE TABLE `bm_player_ban_records` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expired` bigint(20) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `pastActor_id` binary(16) NOT NULL,
  `pastCreated` int(10) NOT NULL,
  `created` int(10) NOT NULL,
  `createdReason` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_history`
--

CREATE TABLE `bm_player_history` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `ip` int(10) UNSIGNED NOT NULL,
  `join` int(10) NOT NULL,
  `leave` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_kicks`
--

CREATE TABLE `bm_player_kicks` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_mutes`
--

CREATE TABLE `bm_player_mutes` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL,
  `expires` int(10) NOT NULL,
  `soft` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_mute_records`
--

CREATE TABLE `bm_player_mute_records` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `expired` bigint(20) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `pastActor_id` binary(16) NOT NULL,
  `pastCreated` int(10) NOT NULL,
  `created` int(10) NOT NULL,
  `createdReason` varchar(255) NOT NULL,
  `soft` tinyint(1) DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_notes`
--

CREATE TABLE `bm_player_notes` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `message` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_reports`
--

CREATE TABLE `bm_player_reports` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `state_id` int(11) NOT NULL,
  `assignee_id` binary(16) DEFAULT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_report_commands`
--

CREATE TABLE `bm_player_report_commands` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `command` varchar(255) NOT NULL,
  `args` varchar(255) NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_report_comments`
--

CREATE TABLE `bm_player_report_comments` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `comment` varchar(255) NOT NULL,
  `created` int(10) NOT NULL,
  `updated` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_report_locations`
--

CREATE TABLE `bm_player_report_locations` (
  `id` int(11) NOT NULL,
  `report_id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `world` varchar(255) NOT NULL,
  `x` double NOT NULL,
  `y` double NOT NULL,
  `z` double NOT NULL,
  `pitch` float NOT NULL,
  `yaw` float NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_report_states`
--

CREATE TABLE `bm_player_report_states` (
  `id` int(11) NOT NULL,
  `name` varchar(255) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_player_warnings`
--

CREATE TABLE `bm_player_warnings` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `reason` varchar(255) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `created` int(10) NOT NULL,
  `expires` int(10) NOT NULL,
  `read` tinyint(1) DEFAULT NULL,
  `points` decimal(60,2) NOT NULL DEFAULT '1.00'
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `bm_rollbacks`
--

CREATE TABLE `bm_rollbacks` (
  `id` int(11) NOT NULL,
  `player_id` binary(16) NOT NULL,
  `actor_id` binary(16) NOT NULL,
  `type` varchar(255) NOT NULL,
  `created` int(10) NOT NULL,
  `expires` int(10) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `buy_list`
--

CREATE TABLE `buy_list` (
  `id` int(11) NOT NULL,
  `nick` text NOT NULL,
  `przedmiot` text NOT NULL,
  `kod` text NOT NULL,
  `data` text NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `guilds`
--

CREATE TABLE `guilds` (
  `uuid` varchar(100) NOT NULL,
  `name` text NOT NULL,
  `tag` text NOT NULL,
  `owner` text NOT NULL,
  `home` text NOT NULL,
  `region` text NOT NULL,
  `members` text NOT NULL,
  `regions` text NOT NULL,
  `points` int(11) NOT NULL,
  `lives` int(11) NOT NULL,
  `ban` bigint(20) NOT NULL,
  `born` bigint(20) NOT NULL,
  `validity` bigint(20) NOT NULL,
  `pvp` tinyint(1) NOT NULL,
  `attacked` bigint(20) DEFAULT NULL,
  `allies` text,
  `enemies` text,
  `info` text,
  `deputy` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `regions`
--

CREATE TABLE `regions` (
  `name` varchar(100) NOT NULL,
  `center` text NOT NULL,
  `size` int(11) NOT NULL,
  `enlarge` int(11) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

-- --------------------------------------------------------

--
-- Struktura tabeli dla tabeli `users`
--

CREATE TABLE `users` (
  `uuid` varchar(36) NOT NULL,
  `name` text NOT NULL,
  `points` int(11) NOT NULL,
  `kills` int(11) NOT NULL,
  `deaths` int(11) NOT NULL,
  `guild` varchar(100) DEFAULT NULL,
  `ban` bigint(20) DEFAULT NULL,
  `reason` text
) ENGINE=InnoDB DEFAULT CHARSET=utf8;

--
-- Indeksy dla zrzutów tabel
--

--
-- Indeksy dla tabeli `authme`
--
ALTER TABLE `authme`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `username` (`username`);

--
-- Indeksy dla tabeli `bm_ip_bans`
--
ALTER TABLE `bm_ip_bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_ip_bans_created_idx` (`created`),
  ADD KEY `bm_ip_bans_expires_idx` (`expires`),
  ADD KEY `bm_ip_bans_updated_idx` (`updated`);

--
-- Indeksy dla tabeli `bm_ip_ban_records`
--
ALTER TABLE `bm_ip_ban_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_ip_ban_records_created_idx` (`created`);

--
-- Indeksy dla tabeli `bm_ip_mutes`
--
ALTER TABLE `bm_ip_mutes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_ip_mutes_ip_idx` (`ip`),
  ADD KEY `bm_ip_mutes_updated_idx` (`updated`),
  ADD KEY `bm_ip_mutes_soft_idx` (`soft`),
  ADD KEY `bm_ip_mutes_created_idx` (`created`),
  ADD KEY `bm_ip_mutes_expires_idx` (`expires`);

--
-- Indeksy dla tabeli `bm_ip_mute_records`
--
ALTER TABLE `bm_ip_mute_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_ip_mute_records_created_idx` (`created`),
  ADD KEY `bm_ip_mute_records_soft_idx` (`soft`),
  ADD KEY `bm_ip_mute_records_ip_idx` (`ip`);

--
-- Indeksy dla tabeli `bm_ip_range_bans`
--
ALTER TABLE `bm_ip_range_bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_ip_range_bans_expires_idx` (`expires`),
  ADD KEY `bm_ip_range_bans_fromIp_idx` (`fromIp`),
  ADD KEY `bm_ip_range_bans_created_idx` (`created`),
  ADD KEY `bm_ip_range_bans_updated_idx` (`updated`),
  ADD KEY `bm_ip_range_bans_toIp_idx` (`toIp`);

--
-- Indeksy dla tabeli `bm_ip_range_ban_records`
--
ALTER TABLE `bm_ip_range_ban_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_ip_range_ban_records_created_idx` (`created`),
  ADD KEY `bm_ip_range_ban_records_toIp_idx` (`toIp`),
  ADD KEY `bm_ip_range_ban_records_fromIp_idx` (`fromIp`);

--
-- Indeksy dla tabeli `bm_name_bans`
--
ALTER TABLE `bm_name_bans`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_name_bans_updated_idx` (`updated`),
  ADD KEY `bm_name_bans_created_idx` (`created`),
  ADD KEY `bm_name_bans_expires_idx` (`expires`);

--
-- Indeksy dla tabeli `bm_name_ban_records`
--
ALTER TABLE `bm_name_ban_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_name_ban_records_created_idx` (`created`);

--
-- Indeksy dla tabeli `bm_players`
--
ALTER TABLE `bm_players`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_players_ip_idx` (`ip`),
  ADD KEY `bm_players_name_idx` (`name`);

--
-- Indeksy dla tabeli `bm_player_bans`
--
ALTER TABLE `bm_player_bans`
  ADD PRIMARY KEY (`id`),
  ADD UNIQUE KEY `bm_player_bans_player_idx` (`player_id`),
  ADD KEY `bm_player_bans_created_idx` (`created`),
  ADD KEY `bm_player_bans_expires_idx` (`expires`),
  ADD KEY `bm_player_bans_updated_idx` (`updated`);

--
-- Indeksy dla tabeli `bm_player_ban_records`
--
ALTER TABLE `bm_player_ban_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_ban_records_created_idx` (`created`);

--
-- Indeksy dla tabeli `bm_player_history`
--
ALTER TABLE `bm_player_history`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_history_ip_idx` (`ip`),
  ADD KEY `bm_player_history_leave_idx` (`leave`),
  ADD KEY `bm_player_history_join_idx` (`join`);

--
-- Indeksy dla tabeli `bm_player_kicks`
--
ALTER TABLE `bm_player_kicks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_kicks_created_idx` (`created`);

--
-- Indeksy dla tabeli `bm_player_mutes`
--
ALTER TABLE `bm_player_mutes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_mutes_expires_idx` (`expires`),
  ADD KEY `bm_player_mutes_soft_idx` (`soft`),
  ADD KEY `bm_player_mutes_updated_idx` (`updated`),
  ADD KEY `bm_player_mutes_created_idx` (`created`);

--
-- Indeksy dla tabeli `bm_player_mute_records`
--
ALTER TABLE `bm_player_mute_records`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_mute_records_soft_idx` (`soft`),
  ADD KEY `bm_player_mute_records_created_idx` (`created`);

--
-- Indeksy dla tabeli `bm_player_notes`
--
ALTER TABLE `bm_player_notes`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_notes_created_idx` (`created`),
  ADD KEY `bm_player_notes_actor_idx` (`actor_id`),
  ADD KEY `bm_player_notes_player_idx` (`player_id`);

--
-- Indeksy dla tabeli `bm_player_reports`
--
ALTER TABLE `bm_player_reports`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_reports_player_idx` (`player_id`),
  ADD KEY `bm_player_reports_actor_idx` (`actor_id`),
  ADD KEY `bm_player_reports_state_idx` (`state_id`),
  ADD KEY `bm_player_reports_assignee_idx` (`assignee_id`),
  ADD KEY `bm_player_reports_created_idx` (`created`),
  ADD KEY `bm_player_reports_updated_idx` (`updated`);

--
-- Indeksy dla tabeli `bm_player_report_commands`
--
ALTER TABLE `bm_player_report_commands`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_report_commands_actor_idx` (`actor_id`),
  ADD KEY `bm_player_report_commands_updated_idx` (`updated`),
  ADD KEY `bm_player_report_commands_command_idx` (`command`),
  ADD KEY `bm_player_report_commands_report_idx` (`report_id`),
  ADD KEY `bm_player_report_commands_created_idx` (`created`);

--
-- Indeksy dla tabeli `bm_player_report_comments`
--
ALTER TABLE `bm_player_report_comments`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_report_comments_updated_idx` (`updated`),
  ADD KEY `bm_player_report_comments_report_idx` (`report_id`),
  ADD KEY `bm_player_report_comments_actor_idx` (`actor_id`),
  ADD KEY `bm_player_report_comments_created_idx` (`created`);

--
-- Indeksy dla tabeli `bm_player_report_locations`
--
ALTER TABLE `bm_player_report_locations`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_report_locations_player_idx` (`player_id`),
  ADD KEY `bm_player_report_locations_world_idx` (`world`),
  ADD KEY `bm_player_report_locations_report_idx` (`report_id`);

--
-- Indeksy dla tabeli `bm_player_report_states`
--
ALTER TABLE `bm_player_report_states`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `bm_player_warnings`
--
ALTER TABLE `bm_player_warnings`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_player_warnings_expires_idx` (`expires`),
  ADD KEY `bm_player_warnings_read_idx` (`read`),
  ADD KEY `bm_player_warnings_points_idx` (`points`),
  ADD KEY `bm_player_warnings_created_idx` (`created`),
  ADD KEY `bm_player_warnings_player_idx` (`player_id`);

--
-- Indeksy dla tabeli `bm_rollbacks`
--
ALTER TABLE `bm_rollbacks`
  ADD PRIMARY KEY (`id`),
  ADD KEY `bm_rollbacks_created_idx` (`created`),
  ADD KEY `bm_rollbacks_expires_idx` (`expires`);

--
-- Indeksy dla tabeli `buy_list`
--
ALTER TABLE `buy_list`
  ADD PRIMARY KEY (`id`);

--
-- Indeksy dla tabeli `guilds`
--
ALTER TABLE `guilds`
  ADD PRIMARY KEY (`uuid`);

--
-- Indeksy dla tabeli `regions`
--
ALTER TABLE `regions`
  ADD PRIMARY KEY (`name`);

--
-- Indeksy dla tabeli `users`
--
ALTER TABLE `users`
  ADD PRIMARY KEY (`uuid`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT dla tabeli `authme`
--
ALTER TABLE `authme`
  MODIFY `id` mediumint(8) UNSIGNED NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_ip_bans`
--
ALTER TABLE `bm_ip_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_ip_ban_records`
--
ALTER TABLE `bm_ip_ban_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_ip_mutes`
--
ALTER TABLE `bm_ip_mutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_ip_mute_records`
--
ALTER TABLE `bm_ip_mute_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_ip_range_bans`
--
ALTER TABLE `bm_ip_range_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_ip_range_ban_records`
--
ALTER TABLE `bm_ip_range_ban_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_name_bans`
--
ALTER TABLE `bm_name_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_name_ban_records`
--
ALTER TABLE `bm_name_ban_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_bans`
--
ALTER TABLE `bm_player_bans`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_ban_records`
--
ALTER TABLE `bm_player_ban_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_history`
--
ALTER TABLE `bm_player_history`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_kicks`
--
ALTER TABLE `bm_player_kicks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_mutes`
--
ALTER TABLE `bm_player_mutes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_mute_records`
--
ALTER TABLE `bm_player_mute_records`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_notes`
--
ALTER TABLE `bm_player_notes`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_reports`
--
ALTER TABLE `bm_player_reports`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_report_commands`
--
ALTER TABLE `bm_player_report_commands`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_report_comments`
--
ALTER TABLE `bm_player_report_comments`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_report_locations`
--
ALTER TABLE `bm_player_report_locations`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_report_states`
--
ALTER TABLE `bm_player_report_states`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_player_warnings`
--
ALTER TABLE `bm_player_warnings`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `bm_rollbacks`
--
ALTER TABLE `bm_rollbacks`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;

--
-- AUTO_INCREMENT dla tabeli `buy_list`
--
ALTER TABLE `buy_list`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT;
COMMIT;

/*!40101 SET CHARACTER_SET_CLIENT=@OLD_CHARACTER_SET_CLIENT */;
/*!40101 SET CHARACTER_SET_RESULTS=@OLD_CHARACTER_SET_RESULTS */;
/*!40101 SET COLLATION_CONNECTION=@OLD_COLLATION_CONNECTION */;
