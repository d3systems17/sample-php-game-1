
--
-- Database: `samplega_game1`
--

-- --------------------------------------------------------

--
-- Table structure for table `CurrencyBaseValue`
--

DROP TABLE IF EXISTS `CurrencyBaseValue`;
CREATE TABLE `CurrencyBaseValue` (
  `id` int(11) NOT NULL,
  `title` varchar(20) DEFAULT NULL,
  `code` varchar(3) NOT NULL,
  `unitvalue` int(11) NOT NULL,
  `exponent` int(11) NOT NULL,
  `sort_order` int(11) NOT NULL,
  `created_date` timestamp NOT NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NOT NULL DEFAULT '0000-00-00 00:00:00',
  `left_symbol` varchar(10) DEFAULT NULL,
  `right_symbol` varchar(10) DEFAULT NULL,
  `status` int(11) DEFAULT '1'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Truncate table before insert `CurrencyBaseValue`
--

TRUNCATE TABLE `CurrencyBaseValue`;
--
-- Dumping data for table `CurrencyBaseValue`
--

INSERT INTO `CurrencyBaseValue` (`id`, `title`, `code`, `unitvalue`, `exponent`, `sort_order`, `created_date`, `update_date`, `left_symbol`, `right_symbol`, `status`) VALUES(1, 'EURO', 'EUR', 1, 100, 1, '2018-09-13 21:58:27', '2018-08-28 11:28:46', '&#8364;', NULL, 1);
INSERT INTO `CurrencyBaseValue` (`id`, `title`, `code`, `unitvalue`, `exponent`, `sort_order`, `created_date`, `update_date`, `left_symbol`, `right_symbol`, `status`) VALUES(2, 'USD', 'USD', 1, 100, 2, '2018-10-22 08:05:29', '2018-08-28 11:28:49', NULL, NULL, 1);
INSERT INTO `CurrencyBaseValue` (`id`, `title`, `code`, `unitvalue`, `exponent`, `sort_order`, `created_date`, `update_date`, `left_symbol`, `right_symbol`, `status`) VALUES(3, 'Japanese Yen', 'JPN', 1, 1, 3, '2018-10-22 08:05:12', '2018-08-28 11:28:53', NULL, NULL, 0);
INSERT INTO `CurrencyBaseValue` (`id`, `title`, `code`, `unitvalue`, `exponent`, `sort_order`, `created_date`, `update_date`, `left_symbol`, `right_symbol`, `status`) VALUES(4, 'Kuwaiti Dinar', 'KWD', 1, 1000, 4, '2018-10-22 08:05:10', '2018-08-28 11:28:56', NULL, NULL, 0);

-- --------------------------------------------------------

--
-- Table structure for table `GameSession`
--

DROP TABLE IF EXISTS `GameSession`;
CREATE TABLE `GameSession` (
  `id` int(11) NOT NULL,
  `game_code` varchar(256) DEFAULT NULL COMMENT 'game-session Unique code',
  `user_proxy_id` varchar(256) DEFAULT NULL,
  `currency` varchar(10) DEFAULT NULL COMMENT 'currency type used for bet',
  `game_session` enum('open','close') DEFAULT 'open' COMMENT 'game is open or closed',
  `created_date` timestamp NULL DEFAULT NULL,
  `update_date` timestamp NULL DEFAULT NULL,
  `game_post_sale_transaction_id` varchar(200) DEFAULT NULL COMMENT 'response from post sale as transaction id',
  `game_post_sale_status` varchar(20) DEFAULT 'pending' COMMENT 'response from post sale as transaction status',
  `post_sale_update_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `Transaction`
--

DROP TABLE IF EXISTS `Transaction`;
CREATE TABLE `Transaction` (
  `id` int(11) NOT NULL,
  `trans_type` enum('credit','debit') DEFAULT NULL COMMENT 'transaction type',
  `identity` enum('deposit','withdrawal','bet','collect') DEFAULT NULL,
  `status` enum('pending','approved') DEFAULT NULL,
  `counterid` varchar(255) DEFAULT '0' COMMENT 'for deposit/withdrawal, you store the ID we send with that, so you can match it. , It is used for game code',
  `user_proxy_id` varchar(255) DEFAULT NULL COMMENT 'foreign key',
  `game_session_id` int(11) DEFAULT NULL COMMENT 'foreign key',
  `amount` decimal(19,0) DEFAULT NULL,
  `currency_type` varchar(5) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT '0000-00-00 00:00:00'
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

-- --------------------------------------------------------

--
-- Table structure for table `UserProxy`
--

DROP TABLE IF EXISTS `UserProxy`;
CREATE TABLE `UserProxy` (
  `id` int(11) NOT NULL,
  `uuid` varchar(256) NOT NULL,
  `username` varchar(50) DEFAULT NULL,
  `created_date` timestamp NULL DEFAULT CURRENT_TIMESTAMP ON UPDATE CURRENT_TIMESTAMP,
  `update_date` timestamp NULL DEFAULT NULL
) ENGINE=InnoDB DEFAULT CHARSET=latin1;

--
-- Indexes for dumped tables
--

--
-- Indexes for table `CurrencyBaseValue`
--
ALTER TABLE `CurrencyBaseValue`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `GameSession`
--
ALTER TABLE `GameSession`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `Transaction`
--
ALTER TABLE `Transaction`
  ADD PRIMARY KEY (`id`);

--
-- Indexes for table `UserProxy`
--
ALTER TABLE `UserProxy`
  ADD PRIMARY KEY (`id`);

--
-- AUTO_INCREMENT for dumped tables
--

--
-- AUTO_INCREMENT for table `CurrencyBaseValue`
--
ALTER TABLE `CurrencyBaseValue`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=5;

--
-- AUTO_INCREMENT for table `GameSession`
--
ALTER TABLE `GameSession`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=45;

--
-- AUTO_INCREMENT for table `Transaction`
--
ALTER TABLE `Transaction`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=217;

--
-- AUTO_INCREMENT for table `UserProxy`
--
ALTER TABLE `UserProxy`
  MODIFY `id` int(11) NOT NULL AUTO_INCREMENT, AUTO_INCREMENT=8;
COMMIT;
 
