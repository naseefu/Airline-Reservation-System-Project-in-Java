
SET SQL_MODE = "NO_AUTO_VALUE_ON_ZERO";
START TRANSACTION;
SET time_zone = "+00:00";

-- project4
CREATE TABLE `cancellation` (
  `pnr_no` varchar(30) NOT NULL,
  `cancellation_no` varchar(30) NOT NULL,
  `cancellation_date` varchar(30) NOT NULL,
  `fli_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


CREATE TABLE `flight` (
  `f_code` varchar(30) NOT NULL,
  `f_name` varchar(30) NOT NULL,
  `src` varchar(30) NOT NULL,
  `dst` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `flight` (`f_code`, `f_name`, `src`, `dst`) VALUES
('f1005', 'flight 1005', 'Philippines', 'United States');



CREATE TABLE `login` (
  `username` varchar(30) NOT NULL,
  `password` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `login` (`username`, `password`) VALUES
('admin', 'admin');


CREATE TABLE `passenger` (
  `pnr_no` varchar(30) NOT NULL,
  `address` text NOT NULL,
  `nationality` varchar(30) NOT NULL,
  `name` varchar(30) NOT NULL,
  `gender` varchar(30) NOT NULL,
  `ph_no` varchar(30) NOT NULL,
  `passport_no` varchar(30) NOT NULL,
  `fl_code` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `passenger` (`pnr_no`, `address`, `nationality`, `name`, `gender`, `ph_no`, `passport_no`, `fl_code`) VALUES
('11', 'Negros Occidental, Philippines', 'Filipino', '', 'male', '09272777334', 'SAR081119', 'f1005');



CREATE TABLE `payment` (
  `pnr_no` varchar(30) NOT NULL,
  `ph_no` varchar(30) NOT NULL,
  `cheque_no` varchar(30) NOT NULL,
  `card_no` varchar(30) NOT NULL,
  `paid_amt` varchar(30) NOT NULL,
  `pay_date` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;



INSERT INTO `payment` (`pnr_no`, `ph_no`, `cheque_no`, `card_no`, `paid_amt`, `pay_date`) VALUES
('11', '09272777334', '1222', '121-121', '1000', '2022-05-05');



CREATE TABLE `reservation` (
  `pnr_no` varchar(30) NOT NULL,
  `ticket_id` varchar(30) NOT NULL,
  `f_code` varchar(30) NOT NULL,
  `jny_date` varchar(30) NOT NULL,
  `jny_time` varchar(30) NOT NULL,
  `src` varchar(30) NOT NULL,
  `dst` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `reservation` (`pnr_no`, `ticket_id`, `f_code`, `jny_date`, `jny_time`, `src`, `dst`) VALUES
('11', '111', 'f1005', '2022-05-05', '1:00 PM', 'Philippines', 'United States');



CREATE TABLE `sector` (
  `flight_code` varchar(30) NOT NULL,
  `capacity` varchar(30) NOT NULL,
  `class_code` varchar(30) NOT NULL,
  `class_name` varchar(30) NOT NULL
) ENGINE=InnoDB DEFAULT CHARSET=utf8mb4;


INSERT INTO `sector` (`flight_code`, `capacity`, `class_code`, `class_name`) VALUES
('f1005', '500', 'A', 'FIRST CLASS'),
('f1005', '500', 'B', 'BUSINESS CLASS'),
('f1005', '500', 'C', 'ECONOMY');
COMMIT;
